using Microcharts;
using System;
using SkiaSharp;
using Microsoft.Maui.Controls;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using SmartTempMonApp.Models;
using System.Data;
using System.IO.Ports;
using Microsoft.Maui.Devices;

namespace SmartTempMonApp.Pages;

public partial class TemperatureTrendsPage : ContentPage
{
    private string username;
    private float _currentTemperature;
    
    private SerialPort serialPort;
    private string role;
    private readonly SupabaseService _supabaseService;
    public ObservableCollection<TemperatureDataPoint> TemperatureData { get; set; }

    public TemperatureTrendsPage(string username, string role)
    {
        try
        {
            InitializeComponent();
            this.username = username;
            this.role = role;
            _supabaseService = new SupabaseService();
            TemperatureData = new ObservableCollection<TemperatureDataPoint>();
            BindingContext = this;
            LoadTemperatureData();
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error in TemperatureTrendsPage: " + ex.Message);
        }


    }

    private async void LoadTemperatureData()
    {
        var data = await _supabaseService.GetTemperatureHistory();

        // Clear existing data and add new data
        TemperatureData.Clear();
        foreach (var entry in data)
        {
            TemperatureData.Add(new TemperatureDataPoint(entry.Item2, entry.Item1)); // Swapped order
        }
    }
   
    private async void OnViewMonthlyTemperatureClicked(object sender, EventArgs e)
    {
        try
        {
            // Retrieve temperature data for the last month
            List<(float, string)> temperatureData = await _supabaseService.GetTemperatureDataForLastMonth();

            if (temperatureData.Count == 0)
            {
                await DisplayAlert("Temperature Data", "No temperature records found for the past month.", "OK");
                return;
            }

            // Format the temperature data as a message
            string temperatureMessages = string.Join("\n\n", temperatureData.Select(t => $"🌡 Temp: {t.Item1}°C\n📅 {t.Item2}"));

           
            await DisplayAlert("Temperature Trends (Last Month)", temperatureMessages, "OK");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"❌ Error fetching temperature data: {ex.Message}");
            await DisplayAlert("Error", "Failed to retrieve temperature data. Please try again.", "OK");
        }
    }
    private async void Home(object sender, EventArgs e)
    {
      
        bool isWirelessMode = DeviceInfo.Platform != DevicePlatform.WinUI;

        await Navigation.PushModalAsync(new DashboardPage(username, role, isWirelessMode));
    }
}




public class TemperatureDataPoint
{
    public string Timestamp { get; set; }
    public float Temperature { get; set; }

    public TemperatureDataPoint(string timestamp, float temperature)
    {
        Timestamp = timestamp;
        Temperature = temperature;
    }
}
   
