using Microsoft.Maui.Controls;
using System;
using System.IO.Ports;
using System.Threading;
using System.Threading.Tasks;
using System.Net.Http;
using System.Text.Json;
using System.Text.RegularExpressions;
using Microsoft.Maui.Devices;
using Supabase;
using SmartTempMonApp.Models;
using Microsoft.Extensions.Hosting;
using Supabase.Interfaces;

namespace SmartTempMonApp.Pages
{
    public partial class DashboardPage : ContentPage, IDisposable
    {
        private string username;
        private float _currentTemperature;
        private readonly SupabaseService _supabaseService;
        private string role;
        private SerialPort serialPort;
        
        // instannce of class to manage cancellation of task running in background
        private CancellationTokenSource _cancellationTokenSource;

        private bool _isWirelessMode;

        public DashboardPage(string username, string role, bool isWirelessMode = false)
        {
            InitializeComponent();

            _isWirelessMode = isWirelessMode;
            this.username = username;
            this.role = role;
            _supabaseService = new SupabaseService();
            serialPort = new SerialPort("COM7", 9600); // Arduino's COM port

           if (!_isWirelessMode)
        {
            serialPort = new SerialPort("COM7", 9600);
            try
            {
                serialPort.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Serial Port Error: " + ex.Message);
            }
        }

            StartTemperatureUpdates();

            // based on role
            AddStaffButton.IsVisible = role.ToLower() == "admin";
        }

        private void StartTemperatureUpdates()
        {
            if (_cancellationTokenSource == null || _cancellationTokenSource.IsCancellationRequested)
            {
                _cancellationTokenSource = new CancellationTokenSource();

                if (_isWirelessMode)
                {
                    StartWirelessTemperatureUpdates();
                }
                else
                {
                    StartDirectTemperatureUpdates();
                }
            }
        }

        private void StartDirectTemperatureUpdates()
        {
            Task.Run(async () =>
            {
                while (!_cancellationTokenSource.Token.IsCancellationRequested)
                {
                    double temperature = await GetTemperatureAsync();
                    UpdateUI(temperature);
                    await Task.Delay(2000);
                }
            }, _cancellationTokenSource.Token);
        }

        private void StartWirelessTemperatureUpdates()
        {
            Task.Run(async () =>
            {
                await _supabaseService.SubscribeToTemperatureChanges(
                    temperature => UpdateUI(temperature),
                    2000,
                    _cancellationTokenSource.Token
                );
            }, _cancellationTokenSource.Token);
        }

        private void UpdateUI(double temperature)
        {
            MainThread.BeginInvokeOnMainThread(() =>
            {
                if (!double.IsNaN(temperature))
                {
                    temperatureLabel.Text = $"{temperature} °C";
                    UpdateTemperatureUI(temperature);
                }
                else
                {
                    temperatureLabel.Text = "Reading temperature, please wait...";
                }
            });
        }


        private void UpdateTemperatureUI(double temperature)
        {
            if (temperature > 36)
            {
                FanImage.IsVisible = true;
                FanImage.Source = "fann.png";
                HeaterImage.IsVisible = false;
                OptimalImage.IsVisible = false;
                fanLabel.IsVisible = true;
                heaterLabel.IsVisible = false;
                optimalLabel.IsVisible = false;
            }
            else if (temperature < 30)
            {
                HeaterImage.IsVisible = true;
                HeaterImage.Source = "heaterr.png";
                FanImage.IsVisible = false;
                OptimalImage.IsVisible = false;
                fanLabel.IsVisible = false;
                heaterLabel.IsVisible = true;
                optimalLabel.IsVisible = false;
            }
            else
            {
                OptimalImage.IsVisible = true;
                OptimalImage.Source = "optimal.png";
                FanImage.IsVisible = false;
                HeaterImage.IsVisible = false;
                fanLabel.IsVisible = false;
                heaterLabel.IsVisible = false;
                optimalLabel.IsVisible = true;
            }
        }

        private async Task<double> GetTemperatureAsync()
        {
            if (_isWirelessMode)
            {
                try
                {
                    float temperature = await _supabaseService.GetLatestTemperature();

                    if (!float.IsNaN(temperature))
                    {
                        // Round to whole number
                        double roundedTemperature = Math.Round(temperature);

                        MainThread.BeginInvokeOnMainThread(() =>
                        {
                            
                            temperatureLabel.Text = $"{roundedTemperature:F0} °C";
                            UpdateTemperatureUI(roundedTemperature);
                        });

                        return roundedTemperature;
                    }
                    return double.NaN;
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error getting wireless temperature: " + ex.Message);
                    return double.NaN;
                }
            }
            else
            {
                
                MainThread.BeginInvokeOnMainThread(() =>
                {
                    temperatureLabel.Text = "Reading temperature, please wait...";
                });

                return await Task.Run(async () =>
                {
                    try
                    {
                        if (serialPort != null && serialPort.IsOpen)
                        {
                            string data = serialPort.ReadLine(); 
                            if (double.TryParse(data, out double temperature))
                            {
                                
                                int deviceID = 3; 
                                string action = "Optimal Temperature";

                                if (temperature > 36)
                                {
                                    deviceID = 1;
                                    action = "Fan ON";
                                }
                                else if (temperature < 30)
                                {
                                    deviceID = 2; 
                                    action = "Heater ON";
                                }

                               
                                if (temperature > 50 || temperature < 10)
                                {
                                    string userEmail = await GetUserEmailAsync(username);

                                    if (string.IsNullOrEmpty(userEmail))
                                    {
                                        Console.WriteLine("Could not fetch user email");
                                        return double.NaN;
                                    }

                                    string message = temperature > 50
                                        ? $"🔥 ALERT: High Temperature Detected! ({temperature}°C)"
                                        : $"❄️ ALERT: Low Temperature Detected! ({temperature}°C)";

                                    await ShowTemperatureAlert(message);
                                    await _supabaseService.InsertAlert(message);
                                    await _supabaseService.SendTemperatureAlertEmail(
                                        userEmail,
                                        temperature.ToString(),
                                        isHighTemp: temperature > 50
                                    );
                                }

                                // Insert logs
                                int logid = await _supabaseService.InsertTemperatureLog(temperature, action, deviceID);
                                if (logid > 0)
                                {
                                    await _supabaseService.InsertUserLog(logid, username);
                                }

                                return temperature; 
                            }
                        }
                        return double.NaN;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Error reading from serial: " + ex.Message);
                        return double.NaN;
                    }
                });
            }
        }

        //get email
        public async Task<string> GetUserEmailAsync(string username)
        {
            try
            {
                
                var user  = await _supabaseService.Client
                    .From<Users>()
                    .Where(u => u.Username == username)
                    .Get(); // Returns user

                return user.Models.FirstOrDefault()?.Email;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error fetching user email: {ex.Message}");
                return null;
            }
        }


        protected override void OnDisappearing()
        {
            base.OnDisappearing();

            // Cancel the background task
            _cancellationTokenSource?.Cancel();

            // Close the serial port
            if (serialPort != null && serialPort.IsOpen)
            {
                serialPort.Close();
            }
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();

            // Reinitialize the CancellationTokenSource
            if (_cancellationTokenSource == null || _cancellationTokenSource.IsCancellationRequested)
            {
                _cancellationTokenSource = new CancellationTokenSource();
            }

            // Reopen the serial port
            if (serialPort != null && !serialPort.IsOpen)
            {
                try
                {
                    serialPort.Open();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Serial Port Error: " + ex.Message);
                }
            }

            // Restart the background task
            StartTemperatureUpdates();
        }

        // Implement IDisposable to release serial port
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                // Cancel the background task
                _cancellationTokenSource?.Cancel();
                _cancellationTokenSource?.Dispose();

                // Close the serial port
                if (serialPort != null)
                {
                    if (serialPort.IsOpen)
                    {
                        serialPort.Close();
                    }
                    serialPort.Dispose();
                }
            }
        }








       

        // add a report
        public async void OnAddReportClicked(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(username))
            {
                await DisplayAlert("Error", "User not recognized.", "OK");
                return;
            }

            string dataSummary = await Microsoft.Maui.Controls.Application.Current.MainPage.DisplayPromptAsync(
     "Add Report",
     "Enter the report summary:",
     "OK", "Cancel",
     "Summary",
     500,
     Keyboard.Text);

            if (string.IsNullOrEmpty(dataSummary)) return;

            DateTime date = DateTime.UtcNow;
            await SaveReportToDatabase(date, dataSummary, username);  
        }

        //view reports
        private async void OnViewAllReportsClicked(object sender, EventArgs e)
        {
            try
            {
                // Fetch reports from the database
                var reports = await GetReportsFromDatabase();

                
                if (reports == null || reports.Count == 0)
                {
                    await DisplayAlert("No Reports", "There are no reports available.", "OK");
                    return;
                }

                
                string reportDetails = string.Join("\n\n", reports.Select(r =>
                    $"Date: {r.Date:yyyy-MM-dd}\n" +
                    $"Summary: {r.DataSummary}\n" +
                    $"Generated By: {r.GeneratedBy}\n"));

               
                await DisplayAlert("All Reports", reportDetails, "OK");
            }
            catch (Exception ex)
            {
                // popup
                await DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }
        }

        // view alerts
        private async void OnViewAlertsClicked(object sender, EventArgs e)
        {
            try
            {
                // Retrieve alerts from the database
                List<Alert> alerts = await _supabaseService.GetAlerts();

                if (alerts.Count == 0)
                {
                    await DisplayAlert("Alerts", "No recent alerts.", "OK");
                    return;
                }

                // Format the alerts as a message
                string alertMessages = string.Join("\n\n", alerts.Select(a => $"🔥 {a.Message}\n📅 {a.Timestamp}"));

                // popup
                await DisplayAlert("Recent Alerts", alertMessages, "OK");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Error fetching alerts: {ex.Message}");
                await DisplayAlert("Error", "Failed to retrieve alerts. Please try again.", "OK");
            }
        }


        private async void AddStaffButton_Clicked(object sender, EventArgs e)
        {
           
            await Navigation.PushModalAsync(new AddStaffPage(username,role));
        }

        private async void OnViewTrendsClicked(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new TemperatureTrendsPage(username,role));
        }


        private async void OnLogoutClicked(object sender, EventArgs e)
            {
                bool confirm = await DisplayAlert("Logout", "Are you sure you want to log out?", "Yes", "No");
                if (confirm)
                {
                    
                    await Navigation.PushModalAsync(new LogInPage());
                }
            }

        private async Task ShowTemperatureAlert(string message)
        {
            await MainThread.InvokeOnMainThreadAsync(async () =>
            {
                await DisplayAlert("Temperature Alert", message, "OK");
            });
        }


        // save reports
        private async Task SaveReportToDatabase(DateTime date, string dataSummary, string generatedBy)
        {
            try
            {
                var report = new Report
                {
                    Date = date,
                    DataSummary = dataSummary,
                    GeneratedBy = generatedBy
                };

                var response = await _supabaseService.Client
                    .From<Report>()
                    .Insert(report);

                if (response != null)
                {
                    await DisplayAlert("Success", "Report added successfully.", "OK");
                }
                else
                {
                    await DisplayAlert("Error", "Failed to add report.", "OK");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Error: {ex.Message}", "OK");
            }
        }

        
        // reports
        private async Task<List<Report>> GetReportsFromDatabase()
        {
            try
            {
                
                var response = await _supabaseService.Client
                    .From<Report>()
                    .Get();

                
                if (response?.Models != null && response.Models.Count > 0)
                {
                    return response.Models; 
                }

                return new List<Report>(); 
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Failed to fetch reports: {ex.Message}", "OK");
                return null;
            }
        }

        // background reading of port
        public class TemperatureMonitorService : BackgroundService
        {
            private readonly SupabaseService _supabaseService;
            private readonly SerialPort _serialPort;

            public TemperatureMonitorService()
            {
                _supabaseService = new SupabaseService();
                _serialPort = new SerialPort("COM7", 9600);
                _serialPort.Open();
            }

            // to run async with main thread
            protected override async Task ExecuteAsync(CancellationToken stoppingToken)
            {
                while (!stoppingToken.IsCancellationRequested)
                {
                    try
                    {
                        string data = _serialPort.ReadLine();
                        if (double.TryParse(data, out double temperature))
                        {
                            // Determine action based on temperature
                            string action = "Optimal Temperature";
                            int deviceId = 3; 

                            if (temperature > 36) { action = "Fan ON"; deviceId = 1; }
                            else if (temperature < 30) { action = "Heater ON"; deviceId = 2; }

                            // Log to Supabase
                            await _supabaseService.InsertTemperatureLog(temperature, action, deviceId);

                            // Check for alerts
                            if (temperature > 50 || temperature < 10)
                            {
                                string message = temperature > 50
                                    ? $"🔥 ALERT: High Temperature Detected! ({temperature}°C)"
                                    : $"❄️ ALERT: Low Temperature Detected! ({temperature}°C)";

                                await _supabaseService.InsertAlert(message);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Temperature monitoring error: {ex.Message}");
                    }

                    await Task.Delay(2000, stoppingToken);
                }
            }

            public override void Dispose()
            {
                _serialPort?.Close();
                _serialPort?.Dispose();
                base.Dispose();
            }
        }

       
    }

    }
