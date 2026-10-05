using Microsoft.Maui.Controls;
using Newtonsoft.Json.Linq;
using System;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.Maui.Devices;

namespace SmartTempMonApp.Pages
{
    public partial class LogInPage : ContentPage
    {
        private const string SupabaseUrl = "https://jiekwibcwetqpayzdpwc.supabase.co";
        private const string SupabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImppZWt3aWJjd2V0cXBheXpkcHdjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE3NjUxOTksImV4cCI6MjA1NzM0MTE5OX0.VbksrYmYiTpcQgaH5rDoJ7t3E6ynyY15JoBMf0lNxbo";

        public LogInPage()
        {
            InitializeComponent();
        }

        private async void OnLoginClicked(object sender, EventArgs e)
        {
            string username = usernameEntry.Text;
            string password = passwordEntry.Text;

            if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password))
            {
                await DisplayAlert("Error", "Please enter both username and password.", "OK");
                return;
            }

            await LoginUserAsync(username, password);
        }


        private async Task LoginUserAsync(string username, string password)
        {
            using HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Add("apikey", SupabaseAnonKey);
            client.DefaultRequestHeaders.Add("Authorization", $"Bearer {SupabaseAnonKey}");

            try
            {
                // look for username
                string url = $"{SupabaseUrl}/rest/v1/users?username=eq.{username}&select=username,password,role";
                HttpResponseMessage response = await client.GetAsync(url);
                string jsonResponse = await response.Content.ReadAsStringAsync();

                if (response.IsSuccessStatusCode)
                {
                    var users = JArray.Parse(jsonResponse);

                    if (users.Count > 0)
                    {
                        var user = users[0];

                       
                        if (user["password"] == null || string.IsNullOrEmpty(user["password"].ToString()))
                        {
                            await DisplayAlert("Error", "Server is down. Please try again later.", "OK");
                            return;
                        }

                        string storedUsername = user["username"].ToString();
                        string storedHashedPassword = user["password"].ToString();
                        string role = user["role"].ToString();

                        if (BCrypt.Net.BCrypt.Verify(password, storedHashedPassword))
                        {
                            await DisplayAlert("Success", "Login successful!", "OK");

                            
                            bool isWirelessMode = DeviceInfo.Platform != DevicePlatform.WinUI;

                            
                            await Navigation.PushModalAsync(new DashboardPage(username, role, isWirelessMode));
                        }
                        else
                        {
                            await DisplayAlert("Error", "Invalid username or password.", "OK");
                        }
                    }
                    else
                    {
                        await DisplayAlert("Error", "User not found.", "OK");
                    }
                }
                else
                {
                    await DisplayAlert("Error", "Login failed. Please try again.", "OK");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Error: {ex.Message}", "OK");
            }
        }


        private async void OnSignUpClicked(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new SignUpPage());
        }

      
    }
}