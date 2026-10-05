using SmartTempMonApp.Pages;

namespace SmartTempMonApp
{
    public partial class App : Application
    {
        public App()
        {
            try
            {
                InitializeComponent();
                MainPage = new LogInPage(); // the main page
            }
            catch (Exception ex)
            {
                Console.WriteLine("App Crash: " + ex.Message);
                MainPage = new ContentPage
                {
                    Content = new Label { Text = "An error occurred: " + ex.Message }
                };
            }
        }
    }
    }
