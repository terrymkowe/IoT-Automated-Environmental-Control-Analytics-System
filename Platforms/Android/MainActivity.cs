using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.OS;
using SmartTempMonApp.Platforms.Android;

namespace SmartTempMonApp
{
    [Activity(Theme = "@style/Maui.SplashTheme", MainLauncher = true, LaunchMode = LaunchMode.SingleTop, ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation | ConfigChanges.UiMode | ConfigChanges.ScreenLayout | ConfigChanges.SmallestScreenSize | ConfigChanges.Density)]
    public class MainActivity : MauiAppCompatActivity
    {
       /* protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Register the USB receiver
            var filter = new IntentFilter("android.hardware.usb.action.USB_PERMISSION");
            RegisterReceiver(new UsbPermissionReceiver(), filter);
        }*/
    }
}
