using Android.App;
using Android.Content;
using Android.Hardware.Usb;
using SmartTempMonApp.Pages;

// Use the raw string for the USB permission
[assembly: UsesPermission("android.permission.USB_PERMISSION")]

namespace SmartTempMonApp.Platforms.Android
{
   /* [BroadcastReceiver(Enabled = true, Exported = true)]
    [IntentFilter(new[] { "android.hardware.usb.action.USB_PERMISSION" })]
    public class UsbPermissionReceiver : BroadcastReceiver
    {
        public override void OnReceive(Context context, Intent intent)
        {
            var device = intent.GetParcelableExtra(UsbManager.ExtraDevice) as UsbDevice;

            if (intent.GetBooleanExtra(UsbManager.ExtraPermissionGranted, false))
            {
                if (device != null && Microsoft.Maui.Controls.Application.Current?.MainPage is DashboardPage dashboard)
                {
                    MainThread.BeginInvokeOnMainThread(() =>
                    {
                        dashboard.OnUsbPermissionGranted();
                    });
                }
            }
        }
    }*/
}