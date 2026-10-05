using Supabase;
using RestSharp;
using System.Text.RegularExpressions;
using System.Net.Mail;
using BCrypt.Net;
using Microsoft.Maui.Storage;
using System.Net.Http;
using Newtonsoft.Json;
using System.Text;
using Microsoft.Maui.Devices;

namespace SmartTempMonApp.Pages
{

    public partial class SignUpPage : ContentPage
    {
        private const string SupabaseUrl = "https://jiekwibcwetqpayzdpwc.supabase.co";
        private const string SupabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImppZWt3aWJjd2V0cXBheXpkcHdjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE3NjUxOTksImV4cCI6MjA1NzM0MTE5OX0.VbksrYmYiTpcQgaH5rDoJ7t3E6ynyY15JoBMf0lNxbo";

        private Client _supabaseClient;

        public SignUpPage()
        {
            InitializeComponent();
            _supabaseClient = new Client(SupabaseUrl, SupabaseAnonKey);
        }

        private async void OnSignUpClicked(object sender, EventArgs e)
        {
            string username = usernameEntry.Text;
            string firstname = firstnameEntry.Text;
            string surname = surnameEntry.Text;
            string role = "staff";  
            string email = emailEntry.Text;
            string password = passwordEntry.Text;

            if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password) || string.IsNullOrWhiteSpace(firstname) ||
                string.IsNullOrWhiteSpace(surname))
            {
                await DisplayAlert("Error", "All fields are required.", "OK");
                return;
            }

           
            string hashedPassword = HashPassword(password);

            await RegisterUserAsync(username, firstname, surname, role, email, hashedPassword);
        }

        private async Task RegisterUserAsync(string username, string firstname, string surname, string role, string email, string hashedPassword)
        {
            using HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Add("apikey", SupabaseAnonKey);
            client.DefaultRequestHeaders.Add("Authorization", $"Bearer {SupabaseAnonKey}");

            var userData = new
            {
                username,
                firstname,
                surname,
                role,  // Always "Staff"
                email,
                password = hashedPassword  // Store hashed password
            };

            string jsonUser = JsonConvert.SerializeObject(userData);
            var content = new StringContent(jsonUser, Encoding.UTF8, "application/json");

            string url = $"{SupabaseUrl}/rest/v1/users";
            HttpResponseMessage response = await client.PostAsync(url, content);
            string jsonResponse = await response.Content.ReadAsStringAsync();

            if (response.IsSuccessStatusCode)
            {
                await DisplayAlert("Success", "Account created successfully!", "OK");

               
                bool isWirelessMode = DeviceInfo.Platform != DevicePlatform.WinUI;

               
                await Navigation.PushModalAsync(new DashboardPage(username, role, isWirelessMode));
            }
            else
            {
                await DisplayAlert("Error", "Registration failed: " + jsonResponse, "OK");
            }
        }

        private string HashPassword(string password)
        {
            return BCrypt.Net.BCrypt.HashPassword(password);
        }


        private async void OnLoginClicked(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new LogInPage());
        }

       

    }
}