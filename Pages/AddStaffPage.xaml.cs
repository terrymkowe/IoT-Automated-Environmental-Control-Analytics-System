
using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Text;
using Supabase;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;
using System.Data;
using System.IO.Ports;
using Microsoft.Maui.Devices;

namespace SmartTempMonApp.Pages
{
    public partial class AddStaffPage : ContentPage
    {
        private string username;
        private float _currentTemperature;
        private readonly SupabaseService _supabaseService;
        private SerialPort serialPort;
        private string role;
        private const string SupabaseUrl = "https://jiekwibcwetqpayzdpwc.supabase.co";
        private const string SupabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImppZWt3aWJjd2V0cXBheXpkcHdjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE3NjUxOTksImV4cCI6MjA1NzM0MTE5OX0.VbksrYmYiTpcQgaH5rDoJ7t3E6ynyY15JoBMf0lNxbo";

        public AddStaffPage(string username, string role)
        {
            InitializeComponent();
            this.username = username;
            this.role = role;
            RolePicker.ItemsSource = new List<string> { "admin", "staff" };
        }

        private async void AddStaffButton_Clicked(object sender, EventArgs e)
        {
            string username = UsernameEntry.Text;
            string firstName = firstnameEntry.Text;
            string surname = surnameEntry.Text;
            string email = emailEntry.Text;
            string password = PasswordEntry.Text;
            string role = RolePicker.SelectedItem?.ToString();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(surname) || string.IsNullOrEmpty(role))
            {
                await DisplayAlert("Error", "Please fill in all fields", "OK");
                return;
            }


            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password);

            try
            {
                using HttpClient client = new HttpClient();
                client.DefaultRequestHeaders.Add("apikey", SupabaseAnonKey);
                client.DefaultRequestHeaders.Add("Authorization", $"Bearer {SupabaseAnonKey}");

               
                string url = $"{SupabaseUrl}/rest/v1/users";

                var staffData = new
                {
                    username = username,
                    password = hashedPassword,
                    firstname = firstName,
                    email = email,
                    surname = surname,
                    role = role 
                };

                var content = new StringContent(JsonConvert.SerializeObject(staffData), Encoding.UTF8, "application/json");
                HttpResponseMessage response = await client.PostAsync(url, content);

                if (response.IsSuccessStatusCode)
                {
                    await DisplayAlert("Success", "Staff member added successfully.", "OK");
                    await Navigation.PopModalAsync(); // back to dashboard
                }
                else
                {
                    string errorMessage = await response.Content.ReadAsStringAsync();
                    await DisplayAlert("Error", $"Failed to add staff member: {errorMessage}", "OK");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Error: {ex.Message}", "OK");
            }


        }

        private async void Home(object sender, EventArgs e)
        {
            
            bool isWirelessMode = DeviceInfo.Platform != DevicePlatform.WinUI;

            await Navigation.PushModalAsync(new DashboardPage(username, role, isWirelessMode));
        }
    }
}