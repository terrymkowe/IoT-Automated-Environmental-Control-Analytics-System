using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Supabase;
using Supabase.Interfaces;
using Supabase.Postgrest.Models;
using SmartTempMonApp.Models;
using Supabase.Postgrest;
using SmartTempMonApp.Pages;
using Microsoft.Maui.Animations;
using System.Reactive.Subjects;
using System.Net.Http.Json;
using RestSharp;
using Newtonsoft.Json;
using Supabase.Gotrue;
using Constants = Supabase.Postgrest.Constants;

namespace SmartTempMonApp
{
    public class SupabaseService
    {
        private readonly string _supabaseUrl = "https://jiekwibcwetqpayzdpwc.supabase.co"; 
        private readonly string _supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImppZWt3aWJjd2V0cXBheXpkcHdjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE3NjUxOTksImV4cCI6MjA1NzM0MTE5OX0.VbksrYmYiTpcQgaH5rDoJ7t3E6ynyY15JoBMf0lNxbo";
        private readonly Supabase.Client _supabaseClient;
        public Supabase.Client Client => _supabaseClient;

        public SupabaseService()
    {
        // Initialization
        _supabaseClient = new Supabase.Client(_supabaseUrl, _supabaseKey);
    }




        public async Task<int> InsertTemperatureLog(double temperature, string action, int deviceID)
        {
            try
            {
                var newEntry = new TemperatureLog
                {
                    Temperature = (decimal)temperature, // Converting double to decimal
                    Action = action,
                    DeviceID = deviceID,
                    Timestamp = DateTime.UtcNow
                };

                // Insert the data
                var response = await _supabaseClient
                    .From<TemperatureLog>()
                    .Insert(newEntry);

                if (response.Models.Count > 0)
                {
                    // Fetch the latest inserted logID manually
                    var latestLog = await _supabaseClient
                        .From<TemperatureLog>()
                        .Order("logid", Constants.Ordering.Descending)
                        .Limit(1)
                        .Single();

                    if (latestLog != null)
                    {
                        Console.WriteLine($"✅ Temperature Log Inserted: ID {latestLog.LogID}");
                        return latestLog.LogID;
                    }
                }
                Console.WriteLine("⚠️ No log inserted.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Error inserting temperature log: {ex.Message}");
            }
            return -1;
        }

        // Inserting into userLog table
        public async Task InsertUserLog(int logID, string username)
        {
            try
            {
                if (string.IsNullOrEmpty(username))
                {
                    Console.WriteLine("⚠️ Error: Username is null or empty.");
                    return;
                }

                var newUserLog = new UserLog
                {
                    Username = username,
                    LogID = logID
                };

                var response = await _supabaseClient
                    .From<UserLog>()
                    .Insert(newUserLog);

                if (response.Models.Count > 0) // Check if insertion was successful
                {
                    Console.WriteLine($"✅ User Log Inserted for {username}");
                }
                else
                {
                    Console.WriteLine("⚠️ No user log inserted.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Error inserting user log: {ex.Message}");
            }
        }

        // 10
        public async Task<List<(float, string)>> GetTemperatureHistory()
        {
            var result = await _supabaseClient
                .From<TemperatureLog>()
                .Select("temperature, timestamp")
                .Order("timestamp", Supabase.Postgrest.Constants.Ordering.Ascending)
                .Limit(10) // get last 10 readings
                .Get();

            var temperatureList = new List<(float, string)>();
            foreach (var record in result.Models)
            {
                float temp = (float)record.Temperature; 
                string timestamp = record.Timestamp.ToString("yyyy-MM-dd HH:mm:ss"); 
                temperatureList.Add((temp, timestamp));
            }

            return temperatureList;
        }

        // monthly
        public async Task<List<(float, string)>> GetTemperatureDataForLastMonth()
        {
            
            DateTime endDate = DateTime.UtcNow; // Current time
            DateTime startDate = endDate.AddMonths(-1); // One month ago

            
            string startDateStr = startDate.ToString("yyyy-MM-dd");
            string endDateStr = endDate.ToString("yyyy-MM-dd");

            // Query for data within the last month
            var result = await _supabaseClient
                .From<TemperatureLog>()
                .Select("temperature, timestamp")
                .Filter("timestamp", Supabase.Postgrest.Constants.Operator.GreaterThanOrEqual, startDateStr)  
                .Filter("timestamp", Supabase.Postgrest.Constants.Operator.LessThanOrEqual, endDateStr)     
                .Order("timestamp", Supabase.Postgrest.Constants.Ordering.Ascending)
                .Get();

            var temperatureList = new List<(float, string)>();
            foreach (var record in result.Models)
            {
                float temp = (float)record.Temperature; // Ensure correct casting to float
                string timestamp = record.Timestamp.ToString("yyyy-MM-dd HH:mm:ss");
                temperatureList.Add((temp, timestamp));
            }

            return temperatureList;
        }



        public async Task SendTemperatureAlertEmail(string toEmail, string temperature, bool isHighTemp)
        {
            const string ResendApiKey = "re_Dys5yWAt_btAddTHZ1mkjqRjKqRMt7saH"; // key
            const string FromEmail = "onboarding@resend.dev"; // domain

            try
            {
                using var client = new RestClient("https://api.resend.com");
                var request = new RestRequest("/emails", Method.Post)
                {
                    RequestFormat = DataFormat.Json
                };

                // Headers
                request.AddHeader("Authorization", $"Bearer {ResendApiKey}");
                request.AddHeader("Content-Type", "application/json");

                // content
                string subject = isHighTemp ? "🔥 Critical: High Temperature Alert!" : "❄️ Critical: Low Temperature Alert!";
                string htmlContent = $@"
            <div style='font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; border: 1px solid #eaeaea; padding: 20px;'>
                <h2 style='color: {(isHighTemp ? "#d63031" : "#0984e3")};'>{subject}</h2>
                <p><strong>Temperature Reading:</strong> {temperature}°C</p>
                <p><strong>Time Detected:</strong> {DateTime.Now.ToString("f")}</p>
                <div style='background-color: #f8f9fa; padding: 15px; margin: 15px 0; border-radius: 4px;'>
                    <p>Immediate action required! Please check your temperature control system.</p>
                </div>
                <p style='font-size: 0.8em; color: #7f8c8d;'>
                    Sent from your temperature monitoring system at {FromEmail}
                </p>
            </div>";

                
                request.AddJsonBody(new
                {
                    from = $"Temperature Monitor <{FromEmail}>", 
                    to = toEmail,
                    subject,
                    html = htmlContent
                });

                var response = await client.ExecuteAsync(request);

                if (!response.IsSuccessful)
                {
                    Console.WriteLine($"Email failed ({(int)response.StatusCode}): {response.Content}");
                    
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Email send error: {ex.Message}");
            }
        }

        // for andoid
        public async Task<float> GetLatestTemperature()
        {
            try
            {
                var result = await _supabaseClient
                    .From<TemperatureLog>()
                    .Select("temperature")
                    .Order("timestamp", Constants.Ordering.Descending)
                    .Limit(1)
                    .Get();

                if (result.Models.Count > 0)
                {
                  
                    float temp = (float)result.Models[0].Temperature;
                    return (float)Math.Round(temp);
                }
                return float.NaN;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error getting latest temperature: {ex.Message}");
                return float.NaN;
            }
        }

        public async Task SubscribeToTemperatureChanges(Action<float> callback, int pollInterval = 2000, CancellationToken cancellationToken = default)
        {
            float lastTemperature = float.NaN;

            while (!cancellationToken.IsCancellationRequested)
            {
                try
                {
                    var currentTemp = await GetLatestTemperature();
                    if (currentTemp != lastTemperature && !float.IsNaN(currentTemp))
                    {
                        callback(currentTemp);
                        lastTemperature = currentTemp;
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error in temperature subscription: {ex.Message}");
                }

                await Task.Delay(pollInterval, cancellationToken);
            }
        }

        // alerts
        public async Task InsertAlert(string message)
        {
            try
            {
                if (string.IsNullOrEmpty(message))
                {
                    Console.WriteLine("⚠️ Error: Alert message is empty.");
                    return;
                }

                var newAlert = new Alert
                {
                    Message = message,
                    Timestamp = DateTime.UtcNow 
                };

                var response = await _supabaseClient
                    .From<Alert>()
                    .Insert(newAlert);

                if (response.Models.Count > 0) // Check if successful
                {
                    Console.WriteLine($"✅ Alert Inserted: {message}");
                }
                else
                {
                    Console.WriteLine("⚠️ No alert inserted.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Error inserting alert: {ex.Message}");
            }
        }

        // retrieve
        public async Task<List<Alert>> GetAlerts()
        {
            try
            {
                var response = await _supabaseClient
                    .From<Alert>()
                    .Order("timestamp", Supabase.Postgrest.Constants.Ordering.Descending) 
                    .Limit(10) 
                    .Get();

                return response.Models;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Error retrieving alerts: {ex.Message}");
                return new List<Alert>(); // Return empty list if there's an error
            }
        }

        /*public async Task<bool> InsertUserAsync(User user)
        {
            try
            {
                var insertResponse = await _supabaseClient
                    .From<User>()
                    .Insert(user);

                return insertResponse.ResponseMessage.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error inserting user: {ex.Message}");
                return false;
            }
        }*/
    }
    }
