using System;
using Microsoft.Maui.Controls;
using Syncfusion.Maui.Charts;
using Syncfusion.Maui.Core.Hosting;

namespace SmartTempMonApp
{
    public partial class MainPage : ContentPage
    {
        private float _currentTemperature;
        private readonly SupabaseService _supabaseService;

        public MainPage()
        {
            InitializeComponent();
            _supabaseService = new SupabaseService();
            _currentTemperature = 25.0f; // Simulated initial temperature
            temperatureLabel.Text = $"Temperature: {_currentTemperature}°C";
        }

        private async void OnRefreshTemperatureClicked(object sender, EventArgs e)
        {
            // Simulating getting the current temperature
            double temperature = await GetTemperatureAsync();

            // Display the temperature
            temperatureLabel.Text = $"{temperature} °C";

            // Check if the fan or heater needs to be turned on
            if (temperature > 36)
            {
                fanHeaterStatusLabel.Text = "Fan: ON";
                fanHeaterStatusLabel.TextColor = Microsoft.Maui.Graphics.Color.FromArgb("#0000FF"); // Blue
            }
            else if (temperature < 25)
            {
                fanHeaterStatusLabel.Text = "Heater: ON";
                fanHeaterStatusLabel.TextColor = Microsoft.Maui.Graphics.Color.FromArgb("#FF0000"); // Red
            }
            else
            {
                fanHeaterStatusLabel.Text = "Temperature is normal.";
                fanHeaterStatusLabel.TextColor = Microsoft.Maui.Graphics.Color.FromArgb("#008000"); // Green
            }
        }

        // Simulate getting the temperature from a sensor (can be replaced with actual sensor data)
        private Task<double> GetTemperatureAsync()
        {
            // For now, returning a random temperature between 20 and 40 degrees as a double
            Random random = new Random();
            double temperature = random.Next(20, 41) + random.NextDouble(); // Adding a fraction for the double value
            return Task.FromResult(temperature);
        }

        /* private async void OnRefreshTemperatureClicked(object sender, EventArgs e)
         {
             // Simulate getting temperature data (can replace with actual sensor data later)
             _currentTemperature = await GetTemperatureFromArduinoAsync();
             temperatureLabel.Text = $"Temperature: {_currentTemperature}°C";

             // Save the temperature to Supabase
             await _supabaseService.InsertTemperatureDataAsync(_currentTemperature);

             // Update status label
             statusLabel.Text = "Temperature refreshed and saved to database.";
         }

         // Simulate getting temperature data (this will be replaced with real data)
         private Task<float> GetTemperatureFromArduinoAsync()
         {
             Random rand = new Random();
             return Task.FromResult((float)(rand.Next(1500, 3000) / 100));  // Simulating random values between 15.00 and 30.00
         }



        // private async void OnSignUpClicked(object sender, EventArgs e)
         //{
         //    await Shell.Current.GoToAsync("///SignUpPage");
         //}*/

        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                });

            // Register Syncfusion Controls
            builder.ConfigureSyncfusionCore();

            return builder.Build();
        }
    }
}