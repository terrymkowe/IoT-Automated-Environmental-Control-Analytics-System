; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [369 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [732 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 285
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 319
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 6: Newtonsoft.Json.dll => 0x254c520 => 223
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 10: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 361
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 220
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 95598293, ; 14: Supabase.dll => 0x5b2b6d5 => 227
	i32 98325684, ; 15: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 199
	i32 101534019, ; 16: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 303
	i32 109166225, ; 17: UsbSerialForAndroid.Net => 0x681be91 => 242
	i32 117431740, ; 18: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 19: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 303
	i32 122350210, ; 20: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 21: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 323
	i32 142721839, ; 22: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 23: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 24: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 162612358, ; 25: MimeMapping => 0x9b14486 => 222
	i32 165246403, ; 26: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 259
	i32 172961045, ; 27: Syncfusion.Maui.Core.dll => 0xa4f2d15 => 236
	i32 176265551, ; 28: System.ServiceProcess => 0xa81994f => 132
	i32 176714968, ; 29: Microsoft.AspNetCore.WebUtilities.dll => 0xa8874d8 => 191
	i32 182336117, ; 30: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 305
	i32 184328833, ; 31: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 32: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 358
	i32 199333315, ; 33: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 359
	i32 205061960, ; 34: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 35: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 257
	i32 220171995, ; 36: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 37: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 279
	i32 230752869, ; 38: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 39: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 40: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 41: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 259487786, ; 42: Syncfusion.Maui.Charts => 0xf77782a => 235
	i32 261689757, ; 43: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 262
	i32 276479776, ; 44: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 45: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 281
	i32 280482487, ; 46: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 278
	i32 280992041, ; 47: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 330
	i32 291076382, ; 48: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 49: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 50: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 358
	i32 318968648, ; 51: Xamarin.AndroidX.Activity.dll => 0x13031348 => 248
	i32 321597661, ; 52: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 53: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 343
	i32 342366114, ; 54: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 280
	i32 356389973, ; 55: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 342
	i32 360082299, ; 56: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 57: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 58: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 59: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 60: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 61: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 62: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 63: _Microsoft.Android.Resource.Designer => 0x17969339 => 365
	i32 403441872, ; 64: WindowsBase => 0x180c08d0 => 165
	i32 424412647, ; 65: UsbSerialForAndroid.Net.dll => 0x194c05e7 => 242
	i32 435591531, ; 66: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 354
	i32 441335492, ; 67: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 263
	i32 442565967, ; 68: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 69: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 276
	i32 451504562, ; 70: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 71: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 72: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 73: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 74: System.dll => 0x1bff388e => 164
	i32 476646585, ; 75: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 278
	i32 485463106, ; 76: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 210
	i32 486930444, ; 77: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 291
	i32 490002678, ; 78: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 0x1d34d8f6 => 186
	i32 498788369, ; 79: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 80: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 341
	i32 503918385, ; 81: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 335
	i32 513247710, ; 82: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 209
	i32 525008092, ; 83: SkiaSharp.dll => 0x1f4afcdc => 225
	i32 526420162, ; 84: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 85: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 323
	i32 530272170, ; 86: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 87: Microsoft.Extensions.Logging => 0x20216150 => 204
	i32 540030774, ; 88: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 89: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 90: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 548916678, ; 91: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 192
	i32 549171840, ; 92: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 93: Jsr305Binding => 0x213954e7 => 316
	i32 569601784, ; 94: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 314
	i32 577335427, ; 95: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 96: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 349
	i32 601371474, ; 97: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 98: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 610194910, ; 99: System.Reactive.dll => 0x245ed5de => 241
	i32 613668793, ; 100: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 101: Xamarin.AndroidX.CustomView => 0x2568904f => 268
	i32 627931235, ; 102: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 347
	i32 639843206, ; 103: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 274
	i32 643868501, ; 104: System.Net => 0x2660a755 => 81
	i32 662205335, ; 105: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 106: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 310
	i32 666292255, ; 107: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 255
	i32 672442732, ; 108: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 109: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 110: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 329
	i32 690569205, ; 111: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 112: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 325
	i32 693804605, ; 113: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 114: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 115: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 320
	i32 700358131, ; 116: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 117: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 344
	i32 709557578, ; 118: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 332
	i32 720511267, ; 119: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 324
	i32 722857257, ; 120: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 121: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 122: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 123: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 245
	i32 759454413, ; 124: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 125: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 763346851, ; 126: Websocket.Client => 0x2d7fbfa3 => 243
	i32 772621961, ; 127: Supabase.Core.dll => 0x2e0d4689 => 228
	i32 775507847, ; 128: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 129: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 353
	i32 789151979, ; 130: Microsoft.Extensions.Options => 0x2f0980eb => 208
	i32 790371945, ; 131: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 269
	i32 804715423, ; 132: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 133: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 283
	i32 823281589, ; 134: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 135: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 136: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 137: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 138: Xamarin.AndroidX.Print => 0x3246f6cd => 296
	i32 873119928, ; 139: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 140: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 141: System.Net.Http.Json => 0x3463c971 => 63
	i32 886248193, ; 142: Microcharts.Droid => 0x34d31301 => 182
	i32 904024072, ; 143: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 144: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 920281169, ; 145: Supabase.Functions => 0x36da6051 => 229
	i32 926902833, ; 146: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 356
	i32 928116545, ; 147: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 319
	i32 952186615, ; 148: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 149: Newtonsoft.Json => 0x38f24a24 => 223
	i32 956575887, ; 150: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 324
	i32 966729478, ; 151: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 317
	i32 967690846, ; 152: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 280
	i32 975236339, ; 153: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 154: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 155: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 156: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 157: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 158: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 159: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 202
	i32 1001831731, ; 160: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 161: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 300
	i32 1019214401, ; 162: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 163: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 198
	i32 1029334545, ; 164: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 331
	i32 1031528504, ; 165: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 318
	i32 1035644815, ; 166: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 253
	i32 1036536393, ; 167: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1036714073, ; 168: UsbSerialForAndroid => 0x3dcb0059 => 181
	i32 1044663988, ; 169: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1048992957, ; 170: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 199
	i32 1052210849, ; 171: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 287
	i32 1067306892, ; 172: GoogleGson => 0x3f9dcf8c => 180
	i32 1082857460, ; 173: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 174: Xamarin.Kotlin.StdLib => 0x409e66d8 => 321
	i32 1089187994, ; 175: Websocket.Client.dll => 0x40ebb09a => 243
	i32 1098259244, ; 176: System => 0x41761b2c => 164
	i32 1106973742, ; 177: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 196
	i32 1110309514, ; 178: Microsoft.Extensions.Hosting.Abstractions => 0x422dfa8a => 203
	i32 1118262833, ; 179: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 344
	i32 1121599056, ; 180: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 286
	i32 1127624469, ; 181: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 206
	i32 1149092582, ; 182: Xamarin.AndroidX.Window => 0x447dc2e6 => 313
	i32 1168523401, ; 183: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 350
	i32 1170634674, ; 184: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 185: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 200
	i32 1175144683, ; 186: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 309
	i32 1178241025, ; 187: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 294
	i32 1203215381, ; 188: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 348
	i32 1204270330, ; 189: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 255
	i32 1208641965, ; 190: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1216849306, ; 191: Supabase.Realtime.dll => 0x4887a59a => 232
	i32 1219128291, ; 192: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1219540809, ; 193: Supabase.Functions.dll => 0x48b0b749 => 229
	i32 1220193633, ; 194: Microsoft.Net.Http.Headers => 0x48baad61 => 221
	i32 1234928153, ; 195: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 346
	i32 1236289705, ; 196: Microsoft.AspNetCore.Hosting.Server.Abstractions => 0x49b048a9 => 186
	i32 1243150071, ; 197: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 314
	i32 1253011324, ; 198: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 199: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 330
	i32 1264511973, ; 200: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 304
	i32 1267360935, ; 201: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 308
	i32 1273260888, ; 202: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 260
	i32 1275534314, ; 203: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 325
	i32 1278448581, ; 204: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 252
	i32 1293217323, ; 205: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 271
	i32 1309188875, ; 206: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 207: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 313
	i32 1324164729, ; 208: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 209: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1336984896, ; 210: Supabase.Core => 0x4fb0c540 => 228
	i32 1357010908, ; 211: System.IO.Ports.dll => 0x50e257dc => 239
	i32 1364015309, ; 212: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 213: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 360
	i32 1376866003, ; 214: Xamarin.AndroidX.SavedState => 0x52114ed3 => 300
	i32 1379779777, ; 215: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 216: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 217: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 264
	i32 1408764838, ; 218: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 219: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 220: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 221: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 328
	i32 1434145427, ; 222: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 223: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 317
	i32 1439761251, ; 224: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 225: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 226: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 227: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 228: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 229: System.IdentityModel.Tokens.Jwt => 0x57137723 => 238
	i32 1461004990, ; 230: es\Microsoft.Maui.Controls.resources => 0x57152abe => 334
	i32 1461234159, ; 231: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 232: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 233: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 234: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 254
	i32 1470490898, ; 235: Microsoft.Extensions.Primitives => 0x57a5e912 => 209
	i32 1479771757, ; 236: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 237: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 238: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 239: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 301
	i32 1493001747, ; 240: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 338
	i32 1498168481, ; 241: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 211
	i32 1514721132, ; 242: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 333
	i32 1516168485, ; 243: Supabase.Gotrue => 0x5a5ee525 => 230
	i32 1521091094, ; 244: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 202
	i32 1536373174, ; 245: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 246: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 247: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 248: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 249: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 353
	i32 1551954004, ; 250: Microsoft.IO.RecyclableMemoryStream.dll => 0x5c80f054 => 214
	i32 1565862583, ; 251: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 252: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 253: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 254: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 255: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 270
	i32 1592978981, ; 256: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 257: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 318
	i32 1601112923, ; 258: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1603525486, ; 259: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x5f93db6e => 362
	i32 1604827217, ; 260: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 261: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 262: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 290
	i32 1622358360, ; 263: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 264: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 312
	i32 1635184631, ; 265: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 274
	i32 1636350590, ; 266: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 267
	i32 1639515021, ; 267: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 268: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 269: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 270: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 271: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 306
	i32 1658251792, ; 272: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 315
	i32 1670060433, ; 273: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 262
	i32 1675553242, ; 274: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 275: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 276: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 277: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 278: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 279: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 280: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 322
	i32 1701541528, ; 281: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 282: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 283
	i32 1726116996, ; 283: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 284: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 285: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 258
	i32 1736233607, ; 286: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 351
	i32 1743415430, ; 287: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 329
	i32 1744735666, ; 288: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 289: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 290: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 291: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 292: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 293: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 294: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 305
	i32 1770582343, ; 295: Microsoft.Extensions.Logging.dll => 0x6988f147 => 204
	i32 1776026572, ; 296: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 297: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 298: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 299: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 345
	i32 1788241197, ; 300: Xamarin.AndroidX.Fragment => 0x6a96652d => 276
	i32 1793755602, ; 301: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 337
	i32 1796167890, ; 302: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 192
	i32 1808609942, ; 303: Xamarin.AndroidX.Loader => 0x6bcd3296 => 290
	i32 1813058853, ; 304: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 321
	i32 1813201214, ; 305: Xamarin.Google.Android.Material => 0x6c13413e => 315
	i32 1818569960, ; 306: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 295
	i32 1818787751, ; 307: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1819327070, ; 308: Microsoft.AspNetCore.Http.Features.dll => 0x6c70ba5e => 190
	i32 1824175904, ; 309: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 310: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1827303595, ; 311: Microsoft.VisualStudio.DesignTools.TapContract => 0x6cea70ab => 364
	i32 1828688058, ; 312: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 205
	i32 1842015223, ; 313: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 357
	i32 1847515442, ; 314: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 245
	i32 1853025655, ; 315: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 354
	i32 1858542181, ; 316: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 317: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 318: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 336
	i32 1879696579, ; 319: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 320: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 256
	i32 1885918049, ; 321: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0x7068d361 => 364
	i32 1888955245, ; 322: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 323: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 324: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 325: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 326: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1927897671, ; 327: System.CodeDom.dll => 0x72e96247 => 237
	i32 1928288591, ; 328: Microsoft.AspNetCore.Http.Abstractions => 0x72ef594f => 188
	i32 1939592360, ; 329: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 330: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 331: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 302
	i32 1968388702, ; 332: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 193
	i32 1983156543, ; 333: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 322
	i32 1985761444, ; 334: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 247
	i32 1986222447, ; 335: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 213
	i32 2003115576, ; 336: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 333
	i32 2011961780, ; 337: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2018526534, ; 338: Supabase.Gotrue.dll => 0x78504546 => 230
	i32 2019465201, ; 339: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 287
	i32 2025202353, ; 340: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 328
	i32 2031763787, ; 341: Xamarin.Android.Glide => 0x791a414b => 244
	i32 2045470958, ; 342: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 343: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 282
	i32 2060060697, ; 344: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 345: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 332
	i32 2070888862, ; 346: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 347: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 201
	i32 2075706075, ; 348: Microsoft.AspNetCore.Http.Abstractions.dll => 0x7bb8c2db => 188
	i32 2079903147, ; 349: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 350: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 351: System.Console => 0x7ec9ffe9 => 20
	i32 2128198166, ; 352: Supabase.Realtime => 0x7ed9ba16 => 232
	i32 2128240319, ; 353: SmartTempMonApp => 0x7eda5ebf => 0
	i32 2138252982, ; 354: Supabase => 0x7f7326b6 => 227
	i32 2142473426, ; 355: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143465592, ; 356: Microsoft.IO.RecyclableMemoryStream => 0x7fc2b078 => 214
	i32 2143790110, ; 357: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 358: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 359: Microsoft.Maui => 0x80bd55ad => 218
	i32 2169148018, ; 360: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 340
	i32 2178612968, ; 361: System.CodeDom => 0x81dafee8 => 237
	i32 2181898931, ; 362: Microsoft.Extensions.Options.dll => 0x820d22b3 => 208
	i32 2192057212, ; 363: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 205
	i32 2193016926, ; 364: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2193681939, ; 365: Microsoft.Extensions.Configuration.EnvironmentVariables.dll => 0x82c0ee13 => 195
	i32 2201107256, ; 366: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 326
	i32 2201231467, ; 367: System.Net.Http => 0x8334206b => 64
	i32 2204417087, ; 368: Microsoft.Extensions.ObjectPool => 0x8364bc3f => 207
	i32 2207618523, ; 369: it\Microsoft.Maui.Controls.resources => 0x839595db => 342
	i32 2217644978, ; 370: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 309
	i32 2222056684, ; 371: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2242871324, ; 372: Microsoft.AspNetCore.Http.dll => 0x85af801c => 187
	i32 2244775296, ; 373: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 291
	i32 2252106437, ; 374: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 375: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 376: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 377: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 194
	i32 2267999099, ; 378: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 246
	i32 2270573516, ; 379: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 336
	i32 2279755925, ; 380: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 298
	i32 2293034957, ; 381: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 382: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 383: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 384: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 346
	i32 2305521784, ; 385: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 386: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 250
	i32 2320631194, ; 387: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 388: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 389: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 390: System.Net.Primitives => 0x8c40e0db => 70
	i32 2354730003, ; 391: Syncfusion.Licensing => 0x8c5a5413 => 234
	i32 2368005991, ; 392: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 393: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 212
	i32 2371007202, ; 394: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 193
	i32 2378619854, ; 395: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 396: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 397: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 341
	i32 2401565422, ; 398: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 399: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 273
	i32 2409983638, ; 400: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x8fa56e96 => 363
	i32 2421380589, ; 401: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 402: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 260
	i32 2427813419, ; 403: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 338
	i32 2435356389, ; 404: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 405: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 406: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 407: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 408: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 409: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 263
	i32 2471841756, ; 410: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 411: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 412: Microsoft.Maui.Controls => 0x93dba8a1 => 216
	i32 2483903535, ; 413: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 414: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2486847491, ; 415: Google.Api.Gax => 0x943a4803 => 175
	i32 2490993605, ; 416: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 417: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 418: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 285
	i32 2522472828, ; 419: Xamarin.Android.Glide.dll => 0x9659e17c => 244
	i32 2538310050, ; 420: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 421: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 339
	i32 2562349572, ; 422: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 423: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 424: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 286
	i32 2581819634, ; 425: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 308
	i32 2585220780, ; 426: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 427: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 428: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 429: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 200
	i32 2593496499, ; 430: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 348
	i32 2594125473, ; 431: Microsoft.AspNetCore.Hosting.Abstractions => 0x9a9f36a1 => 185
	i32 2595928349, ; 432: FirebaseAdmin => 0x9abab91d => 174
	i32 2597088119, ; 433: XamarinUsbDriver => 0x9acc6b77 => 327
	i32 2605712449, ; 434: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 326
	i32 2615233544, ; 435: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 277
	i32 2616218305, ; 436: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 206
	i32 2617129537, ; 437: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 438: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 439: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 267
	i32 2624644809, ; 440: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 272
	i32 2626831493, ; 441: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 343
	i32 2627185994, ; 442: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629053246, ; 443: Google.Api.Gax.Rest => 0x9cb42b3e => 176
	i32 2629843544, ; 444: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 445: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 281
	i32 2633959305, ; 446: Microsoft.AspNetCore.Http.Extensions.dll => 0x9cff0789 => 189
	i32 2640290731, ; 447: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 212
	i32 2663391936, ; 448: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 246
	i32 2663698177, ; 449: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 450: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 451: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 452: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 453: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 454: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 455: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 306
	i32 2715334215, ; 456: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 457: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 458: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 459: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 460: Xamarin.AndroidX.Activity => 0xa2e0939b => 248
	i32 2735172069, ; 461: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 462: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 254
	i32 2740948882, ; 463: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 464: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 465: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 349
	i32 2758225723, ; 466: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 217
	i32 2764765095, ; 467: Microsoft.Maui.dll => 0xa4caf7a7 => 218
	i32 2765824710, ; 468: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 469: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 320
	i32 2778768386, ; 470: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 311
	i32 2779977773, ; 471: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 299
	i32 2785988530, ; 472: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 355
	i32 2788224221, ; 473: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 277
	i32 2795602088, ; 474: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 226
	i32 2801831435, ; 475: Microsoft.Maui.Graphics => 0xa7008e0b => 220
	i32 2803228030, ; 476: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 477: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 334
	i32 2810250172, ; 478: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 264
	i32 2819470561, ; 479: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 480: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 481: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 299
	i32 2824502124, ; 482: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 483: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 347
	i32 2836739085, ; 484: Microsoft.AspNetCore.Hosting => 0xa915340d => 184
	i32 2838993487, ; 485: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 288
	i32 2849599387, ; 486: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2850549256, ; 487: Microsoft.AspNetCore.Http.Features => 0xa9e7ee08 => 190
	i32 2853208004, ; 488: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 311
	i32 2855708567, ; 489: Xamarin.AndroidX.Transition => 0xaa36a797 => 307
	i32 2861098320, ; 490: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 491: Microsoft.Maui.Essentials => 0xaa8a4878 => 219
	i32 2868557005, ; 492: Syncfusion.Licensing.dll => 0xaafab4cd => 234
	i32 2870099610, ; 493: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 249
	i32 2875164099, ; 494: Jsr305Binding.dll => 0xab5f85c3 => 316
	i32 2875220617, ; 495: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 496: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 275
	i32 2887636118, ; 497: System.Net.dll => 0xac1dd496 => 81
	i32 2893550578, ; 498: Google.Apis.Core => 0xac7813f2 => 179
	i32 2898407901, ; 499: System.Management => 0xacc231dd => 240
	i32 2899753641, ; 500: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 501: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 502: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 503: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 504: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 505: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 201
	i32 2912489636, ; 506: SkiaSharp.Views.Android => 0xad9910a4 => 226
	i32 2916838712, ; 507: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 312
	i32 2919462931, ; 508: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 509: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 251
	i32 2936416060, ; 510: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 511: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 512: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 513: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 514: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2970759306, ; 515: BCrypt.Net-Next.dll => 0xb112308a => 173
	i32 2972252294, ; 516: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978368250, ; 517: Microsoft.AspNetCore.Hosting.Abstractions.dll => 0xb1864afa => 185
	i32 2978675010, ; 518: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 271
	i32 2987532451, ; 519: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 302
	i32 2990604888, ; 520: Google.Apis => 0xb2410258 => 177
	i32 2996646946, ; 521: Microsoft.AspNetCore.Http => 0xb29d3422 => 187
	i32 2996846495, ; 522: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 284
	i32 3016983068, ; 523: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 304
	i32 3023353419, ; 524: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 525: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 279
	i32 3036068679, ; 526: Microcharts.Droid.dll => 0xb4f6bb47 => 182
	i32 3036999524, ; 527: Microsoft.AspNetCore.Http.Extensions => 0xb504ef64 => 189
	i32 3038032645, ; 528: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 365
	i32 3056245963, ; 529: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 301
	i32 3057625584, ; 530: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 292
	i32 3059408633, ; 531: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 532: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 533: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 534: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 340
	i32 3084678329, ; 535: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 213
	i32 3090735792, ; 536: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099081453, ; 537: MimeMapping.dll => 0xb8b83aed => 222
	i32 3099732863, ; 538: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 539: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 540: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 541: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 542: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 543: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3138360719, ; 544: Supabase.Postgrest.dll => 0xbb0f958f => 231
	i32 3147165239, ; 545: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3147228406, ; 546: Syncfusion.Maui.Core => 0xbb96e4f6 => 236
	i32 3148237826, ; 547: GoogleGson.dll => 0xbba64c02 => 180
	i32 3159123045, ; 548: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 549: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 550: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 293
	i32 3188578740, ; 551: Microsoft.Extensions.Configuration.EnvironmentVariables => 0xbe0dd9b4 => 195
	i32 3192346100, ; 552: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 553: System.Web => 0xbe592c0c => 153
	i32 3203277885, ; 554: Google.Api.Gax.dll => 0xbeee243d => 175
	i32 3204380047, ; 555: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 556: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 557: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 270
	i32 3220365878, ; 558: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 559: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3245644316, ; 560: Syncfusion.Maui.Charts.dll => 0xc1749a1c => 235
	i32 3249260365, ; 561: RestSharp.dll => 0xc1abc74d => 224
	i32 3251039220, ; 562: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 563: Xamarin.AndroidX.CardView => 0xc235e84d => 258
	i32 3265493905, ; 564: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 565: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 566: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 567: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 568: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 569: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 570: System.Text.Encoding => 0xc4a8494a => 135
	i32 3300764913, ; 571: Microsoft.AspNetCore.WebUtilities => 0xc4bdacf1 => 191
	i32 3303498502, ; 572: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 573: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 335
	i32 3306135358, ; 574: System.IO.Ports => 0xc50f9f3e => 239
	i32 3312457198, ; 575: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 211
	i32 3316684772, ; 576: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 577: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 268
	i32 3317144872, ; 578: System.Data => 0xc5b79d28 => 24
	i32 3340387945, ; 579: SkiaSharp => 0xc71a4669 => 225
	i32 3340431453, ; 580: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 256
	i32 3345895724, ; 581: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 297
	i32 3346324047, ; 582: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 294
	i32 3357674450, ; 583: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 352
	i32 3358260929, ; 584: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 585: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 249
	i32 3362522851, ; 586: Xamarin.AndroidX.Core => 0xc86c06e3 => 265
	i32 3366347497, ; 587: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 588: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 298
	i32 3381016424, ; 589: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 331
	i32 3395150330, ; 590: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 591: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 592: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 269
	i32 3428513518, ; 593: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 197
	i32 3429136800, ; 594: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 595: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 596: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 272
	i32 3445260447, ; 597: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 598: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 215
	i32 3453592554, ; 599: Google.Apis.Core.dll => 0xcdd9a3ea => 179
	i32 3455791806, ; 600: Microcharts => 0xcdfb32be => 183
	i32 3459797609, ; 601: SmartTempMonApp.dll => 0xce385269 => 0
	i32 3463511458, ; 602: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 339
	i32 3471940407, ; 603: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3472012038, ; 604: BCrypt.Net-Next => 0xcef2b306 => 173
	i32 3476120550, ; 605: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 606: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 352
	i32 3484440000, ; 607: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 351
	i32 3485117614, ; 608: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 609: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 610: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 261
	i32 3509114376, ; 611: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 612: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 613: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 614: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 615: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 616: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 617: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 359
	i32 3597029428, ; 618: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 247
	i32 3598340787, ; 619: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3607666123, ; 620: Supabase.Postgrest => 0xd7089dcb => 231
	i32 3608519521, ; 621: System.Linq.dll => 0xd715a361 => 61
	i32 3611087749, ; 622: Microsoft.AspNetCore.Hosting.dll => 0xd73cd385 => 184
	i32 3612435020, ; 623: System.Management.dll => 0xd751624c => 240
	i32 3621458322, ; 624: Google.Api.Gax.Rest.dll => 0xd7db1192 => 176
	i32 3624195450, ; 625: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 626: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 296
	i32 3633644679, ; 627: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 251
	i32 3638274909, ; 628: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 629: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 282
	i32 3643446276, ; 630: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 356
	i32 3643854240, ; 631: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 293
	i32 3645089577, ; 632: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 633: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 194
	i32 3660523487, ; 634: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3668042751, ; 635: Microcharts.dll => 0xdaa1e3ff => 183
	i32 3672681054, ; 636: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3676670898, ; 637: Microsoft.Maui.Controls.HotReload.Forms => 0xdb258bb2 => 362
	i32 3682565725, ; 638: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 257
	i32 3684561358, ; 639: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 261
	i32 3697841164, ; 640: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 361
	i32 3700591436, ; 641: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 210
	i32 3700866549, ; 642: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 643: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 266
	i32 3716563718, ; 644: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 645: Xamarin.AndroidX.Annotation => 0xdda814c6 => 250
	i32 3724971120, ; 646: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 292
	i32 3731644420, ; 647: System.Reactive => 0xde6c6004 => 241
	i32 3732100267, ; 648: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 649: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 650: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 651: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3758424670, ; 652: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 196
	i32 3765508441, ; 653: Microsoft.Extensions.ObjectPool.dll => 0xe0711959 => 207
	i32 3786282454, ; 654: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 259
	i32 3792276235, ; 655: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3793997468, ; 656: Google.Apis.Auth.dll => 0xe223ce9c => 178
	i32 3800979733, ; 657: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 215
	i32 3802395368, ; 658: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3816437471, ; 659: RestSharp => 0xe37a36df => 224
	i32 3819260425, ; 660: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 661: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 662: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 663: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 198
	i32 3844307129, ; 664: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 665: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 666: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 667: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 668: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 669: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 670: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 307
	i32 3888767677, ; 671: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 297
	i32 3889960447, ; 672: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 360
	i32 3896106733, ; 673: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 674: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 265
	i32 3901907137, ; 675: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3906640997, ; 676: Supabase.Storage.dll => 0xe8da9c65 => 233
	i32 3920810846, ; 677: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 678: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 310
	i32 3928044579, ; 679: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 680: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 681: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 295
	i32 3945713374, ; 682: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 683: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 684: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 253
	i32 3959773229, ; 685: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 284
	i32 3980364293, ; 686: Supabase.Storage => 0xed3f8a05 => 233
	i32 3980434154, ; 687: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 355
	i32 3987592930, ; 688: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 337
	i32 3994283630, ; 689: XamarinUsbDriver.dll => 0xee13ee6e => 327
	i32 4003436829, ; 690: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 691: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 252
	i32 4025784931, ; 692: System.Memory => 0xeff49a63 => 62
	i32 4044155772, ; 693: Microsoft.Net.Http.Headers.dll => 0xf10ceb7c => 221
	i32 4046471985, ; 694: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 217
	i32 4054681211, ; 695: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4059682726, ; 696: Google.Apis.dll => 0xf1f9d7a6 => 177
	i32 4068434129, ; 697: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 698: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4078967171, ; 699: Microsoft.Extensions.Hosting.Abstractions.dll => 0xf3201983 => 203
	i32 4082882467, ; 700: Google.Apis.Auth => 0xf35bd7a3 => 178
	i32 4094352644, ; 701: Microsoft.Maui.Essentials.dll => 0xf40add04 => 219
	i32 4099507663, ; 702: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 703: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 704: Xamarin.AndroidX.Emoji2 => 0xf479582c => 273
	i32 4102112229, ; 705: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 350
	i32 4103870601, ; 706: UsbSerialForAndroid.dll => 0xf49c1889 => 181
	i32 4125707920, ; 707: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 345
	i32 4126470640, ; 708: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 197
	i32 4127667938, ; 709: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 710: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 711: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 712: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 357
	i32 4151237749, ; 713: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 714: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 715: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 716: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4177102269, ; 717: FirebaseAdmin.dll => 0xf8f985bd => 174
	i32 4181436372, ; 718: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 719: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 289
	i32 4182880526, ; 720: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0xf951b10e => 363
	i32 4185676441, ; 721: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 722: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 723: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 724: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 266
	i32 4258378803, ; 725: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 288
	i32 4260525087, ; 726: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 727: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 238
	i32 4271975918, ; 728: Microsoft.Maui.Controls.dll => 0xfea12dee => 216
	i32 4274976490, ; 729: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 730: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 289
	i32 4294763496 ; 731: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 275
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [732 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 285, ; 3
	i32 319, ; 4
	i32 48, ; 5
	i32 223, ; 6
	i32 80, ; 7
	i32 145, ; 8
	i32 30, ; 9
	i32 361, ; 10
	i32 124, ; 11
	i32 220, ; 12
	i32 102, ; 13
	i32 227, ; 14
	i32 199, ; 15
	i32 303, ; 16
	i32 242, ; 17
	i32 107, ; 18
	i32 303, ; 19
	i32 139, ; 20
	i32 323, ; 21
	i32 77, ; 22
	i32 124, ; 23
	i32 13, ; 24
	i32 222, ; 25
	i32 259, ; 26
	i32 236, ; 27
	i32 132, ; 28
	i32 191, ; 29
	i32 305, ; 30
	i32 151, ; 31
	i32 358, ; 32
	i32 359, ; 33
	i32 18, ; 34
	i32 257, ; 35
	i32 26, ; 36
	i32 279, ; 37
	i32 1, ; 38
	i32 59, ; 39
	i32 42, ; 40
	i32 91, ; 41
	i32 235, ; 42
	i32 262, ; 43
	i32 147, ; 44
	i32 281, ; 45
	i32 278, ; 46
	i32 330, ; 47
	i32 54, ; 48
	i32 69, ; 49
	i32 358, ; 50
	i32 248, ; 51
	i32 83, ; 52
	i32 343, ; 53
	i32 280, ; 54
	i32 342, ; 55
	i32 131, ; 56
	i32 55, ; 57
	i32 149, ; 58
	i32 74, ; 59
	i32 145, ; 60
	i32 62, ; 61
	i32 146, ; 62
	i32 365, ; 63
	i32 165, ; 64
	i32 242, ; 65
	i32 354, ; 66
	i32 263, ; 67
	i32 12, ; 68
	i32 276, ; 69
	i32 125, ; 70
	i32 152, ; 71
	i32 113, ; 72
	i32 166, ; 73
	i32 164, ; 74
	i32 278, ; 75
	i32 210, ; 76
	i32 291, ; 77
	i32 186, ; 78
	i32 84, ; 79
	i32 341, ; 80
	i32 335, ; 81
	i32 209, ; 82
	i32 225, ; 83
	i32 150, ; 84
	i32 323, ; 85
	i32 60, ; 86
	i32 204, ; 87
	i32 51, ; 88
	i32 103, ; 89
	i32 114, ; 90
	i32 192, ; 91
	i32 40, ; 92
	i32 316, ; 93
	i32 314, ; 94
	i32 120, ; 95
	i32 349, ; 96
	i32 52, ; 97
	i32 44, ; 98
	i32 241, ; 99
	i32 119, ; 100
	i32 268, ; 101
	i32 347, ; 102
	i32 274, ; 103
	i32 81, ; 104
	i32 136, ; 105
	i32 310, ; 106
	i32 255, ; 107
	i32 8, ; 108
	i32 73, ; 109
	i32 329, ; 110
	i32 155, ; 111
	i32 325, ; 112
	i32 154, ; 113
	i32 92, ; 114
	i32 320, ; 115
	i32 45, ; 116
	i32 344, ; 117
	i32 332, ; 118
	i32 324, ; 119
	i32 109, ; 120
	i32 129, ; 121
	i32 25, ; 122
	i32 245, ; 123
	i32 72, ; 124
	i32 55, ; 125
	i32 243, ; 126
	i32 228, ; 127
	i32 46, ; 128
	i32 353, ; 129
	i32 208, ; 130
	i32 269, ; 131
	i32 22, ; 132
	i32 283, ; 133
	i32 86, ; 134
	i32 43, ; 135
	i32 160, ; 136
	i32 71, ; 137
	i32 296, ; 138
	i32 3, ; 139
	i32 42, ; 140
	i32 63, ; 141
	i32 182, ; 142
	i32 16, ; 143
	i32 53, ; 144
	i32 229, ; 145
	i32 356, ; 146
	i32 319, ; 147
	i32 105, ; 148
	i32 223, ; 149
	i32 324, ; 150
	i32 317, ; 151
	i32 280, ; 152
	i32 34, ; 153
	i32 158, ; 154
	i32 85, ; 155
	i32 32, ; 156
	i32 12, ; 157
	i32 51, ; 158
	i32 202, ; 159
	i32 56, ; 160
	i32 300, ; 161
	i32 36, ; 162
	i32 198, ; 163
	i32 331, ; 164
	i32 318, ; 165
	i32 253, ; 166
	i32 35, ; 167
	i32 181, ; 168
	i32 58, ; 169
	i32 199, ; 170
	i32 287, ; 171
	i32 180, ; 172
	i32 17, ; 173
	i32 321, ; 174
	i32 243, ; 175
	i32 164, ; 176
	i32 196, ; 177
	i32 203, ; 178
	i32 344, ; 179
	i32 286, ; 180
	i32 206, ; 181
	i32 313, ; 182
	i32 350, ; 183
	i32 153, ; 184
	i32 200, ; 185
	i32 309, ; 186
	i32 294, ; 187
	i32 348, ; 188
	i32 255, ; 189
	i32 29, ; 190
	i32 232, ; 191
	i32 52, ; 192
	i32 229, ; 193
	i32 221, ; 194
	i32 346, ; 195
	i32 186, ; 196
	i32 314, ; 197
	i32 5, ; 198
	i32 330, ; 199
	i32 304, ; 200
	i32 308, ; 201
	i32 260, ; 202
	i32 325, ; 203
	i32 252, ; 204
	i32 271, ; 205
	i32 85, ; 206
	i32 313, ; 207
	i32 61, ; 208
	i32 112, ; 209
	i32 228, ; 210
	i32 239, ; 211
	i32 57, ; 212
	i32 360, ; 213
	i32 300, ; 214
	i32 99, ; 215
	i32 19, ; 216
	i32 264, ; 217
	i32 111, ; 218
	i32 101, ; 219
	i32 102, ; 220
	i32 328, ; 221
	i32 104, ; 222
	i32 317, ; 223
	i32 71, ; 224
	i32 38, ; 225
	i32 32, ; 226
	i32 103, ; 227
	i32 73, ; 228
	i32 238, ; 229
	i32 334, ; 230
	i32 9, ; 231
	i32 123, ; 232
	i32 46, ; 233
	i32 254, ; 234
	i32 209, ; 235
	i32 9, ; 236
	i32 43, ; 237
	i32 4, ; 238
	i32 301, ; 239
	i32 338, ; 240
	i32 211, ; 241
	i32 333, ; 242
	i32 230, ; 243
	i32 202, ; 244
	i32 31, ; 245
	i32 138, ; 246
	i32 92, ; 247
	i32 93, ; 248
	i32 353, ; 249
	i32 214, ; 250
	i32 49, ; 251
	i32 141, ; 252
	i32 112, ; 253
	i32 140, ; 254
	i32 270, ; 255
	i32 115, ; 256
	i32 318, ; 257
	i32 157, ; 258
	i32 362, ; 259
	i32 76, ; 260
	i32 79, ; 261
	i32 290, ; 262
	i32 37, ; 263
	i32 312, ; 264
	i32 274, ; 265
	i32 267, ; 266
	i32 64, ; 267
	i32 138, ; 268
	i32 15, ; 269
	i32 116, ; 270
	i32 306, ; 271
	i32 315, ; 272
	i32 262, ; 273
	i32 48, ; 274
	i32 70, ; 275
	i32 80, ; 276
	i32 126, ; 277
	i32 94, ; 278
	i32 121, ; 279
	i32 322, ; 280
	i32 26, ; 281
	i32 283, ; 282
	i32 97, ; 283
	i32 28, ; 284
	i32 258, ; 285
	i32 351, ; 286
	i32 329, ; 287
	i32 149, ; 288
	i32 169, ; 289
	i32 4, ; 290
	i32 98, ; 291
	i32 33, ; 292
	i32 93, ; 293
	i32 305, ; 294
	i32 204, ; 295
	i32 21, ; 296
	i32 41, ; 297
	i32 170, ; 298
	i32 345, ; 299
	i32 276, ; 300
	i32 337, ; 301
	i32 192, ; 302
	i32 290, ; 303
	i32 321, ; 304
	i32 315, ; 305
	i32 295, ; 306
	i32 2, ; 307
	i32 190, ; 308
	i32 134, ; 309
	i32 111, ; 310
	i32 364, ; 311
	i32 205, ; 312
	i32 357, ; 313
	i32 245, ; 314
	i32 354, ; 315
	i32 58, ; 316
	i32 95, ; 317
	i32 336, ; 318
	i32 39, ; 319
	i32 256, ; 320
	i32 364, ; 321
	i32 25, ; 322
	i32 94, ; 323
	i32 89, ; 324
	i32 99, ; 325
	i32 10, ; 326
	i32 237, ; 327
	i32 188, ; 328
	i32 87, ; 329
	i32 100, ; 330
	i32 302, ; 331
	i32 193, ; 332
	i32 322, ; 333
	i32 247, ; 334
	i32 213, ; 335
	i32 333, ; 336
	i32 7, ; 337
	i32 230, ; 338
	i32 287, ; 339
	i32 328, ; 340
	i32 244, ; 341
	i32 88, ; 342
	i32 282, ; 343
	i32 154, ; 344
	i32 332, ; 345
	i32 33, ; 346
	i32 201, ; 347
	i32 188, ; 348
	i32 116, ; 349
	i32 82, ; 350
	i32 20, ; 351
	i32 232, ; 352
	i32 0, ; 353
	i32 227, ; 354
	i32 11, ; 355
	i32 214, ; 356
	i32 162, ; 357
	i32 3, ; 358
	i32 218, ; 359
	i32 340, ; 360
	i32 237, ; 361
	i32 208, ; 362
	i32 205, ; 363
	i32 84, ; 364
	i32 195, ; 365
	i32 326, ; 366
	i32 64, ; 367
	i32 207, ; 368
	i32 342, ; 369
	i32 309, ; 370
	i32 143, ; 371
	i32 187, ; 372
	i32 291, ; 373
	i32 157, ; 374
	i32 41, ; 375
	i32 117, ; 376
	i32 194, ; 377
	i32 246, ; 378
	i32 336, ; 379
	i32 298, ; 380
	i32 131, ; 381
	i32 75, ; 382
	i32 66, ; 383
	i32 346, ; 384
	i32 172, ; 385
	i32 250, ; 386
	i32 143, ; 387
	i32 106, ; 388
	i32 151, ; 389
	i32 70, ; 390
	i32 234, ; 391
	i32 156, ; 392
	i32 212, ; 393
	i32 193, ; 394
	i32 121, ; 395
	i32 127, ; 396
	i32 341, ; 397
	i32 152, ; 398
	i32 273, ; 399
	i32 363, ; 400
	i32 141, ; 401
	i32 260, ; 402
	i32 338, ; 403
	i32 20, ; 404
	i32 14, ; 405
	i32 135, ; 406
	i32 75, ; 407
	i32 59, ; 408
	i32 263, ; 409
	i32 167, ; 410
	i32 168, ; 411
	i32 216, ; 412
	i32 15, ; 413
	i32 74, ; 414
	i32 175, ; 415
	i32 6, ; 416
	i32 23, ; 417
	i32 285, ; 418
	i32 244, ; 419
	i32 91, ; 420
	i32 339, ; 421
	i32 1, ; 422
	i32 136, ; 423
	i32 286, ; 424
	i32 308, ; 425
	i32 134, ; 426
	i32 69, ; 427
	i32 146, ; 428
	i32 200, ; 429
	i32 348, ; 430
	i32 185, ; 431
	i32 174, ; 432
	i32 327, ; 433
	i32 326, ; 434
	i32 277, ; 435
	i32 206, ; 436
	i32 88, ; 437
	i32 96, ; 438
	i32 267, ; 439
	i32 272, ; 440
	i32 343, ; 441
	i32 31, ; 442
	i32 176, ; 443
	i32 45, ; 444
	i32 281, ; 445
	i32 189, ; 446
	i32 212, ; 447
	i32 246, ; 448
	i32 109, ; 449
	i32 158, ; 450
	i32 35, ; 451
	i32 22, ; 452
	i32 114, ; 453
	i32 57, ; 454
	i32 306, ; 455
	i32 144, ; 456
	i32 118, ; 457
	i32 120, ; 458
	i32 110, ; 459
	i32 248, ; 460
	i32 139, ; 461
	i32 254, ; 462
	i32 54, ; 463
	i32 105, ; 464
	i32 349, ; 465
	i32 217, ; 466
	i32 218, ; 467
	i32 133, ; 468
	i32 320, ; 469
	i32 311, ; 470
	i32 299, ; 471
	i32 355, ; 472
	i32 277, ; 473
	i32 226, ; 474
	i32 220, ; 475
	i32 159, ; 476
	i32 334, ; 477
	i32 264, ; 478
	i32 163, ; 479
	i32 132, ; 480
	i32 299, ; 481
	i32 161, ; 482
	i32 347, ; 483
	i32 184, ; 484
	i32 288, ; 485
	i32 140, ; 486
	i32 190, ; 487
	i32 311, ; 488
	i32 307, ; 489
	i32 169, ; 490
	i32 219, ; 491
	i32 234, ; 492
	i32 249, ; 493
	i32 316, ; 494
	i32 40, ; 495
	i32 275, ; 496
	i32 81, ; 497
	i32 179, ; 498
	i32 240, ; 499
	i32 56, ; 500
	i32 37, ; 501
	i32 97, ; 502
	i32 166, ; 503
	i32 172, ; 504
	i32 201, ; 505
	i32 226, ; 506
	i32 312, ; 507
	i32 82, ; 508
	i32 251, ; 509
	i32 98, ; 510
	i32 30, ; 511
	i32 159, ; 512
	i32 18, ; 513
	i32 127, ; 514
	i32 173, ; 515
	i32 119, ; 516
	i32 185, ; 517
	i32 271, ; 518
	i32 302, ; 519
	i32 177, ; 520
	i32 187, ; 521
	i32 284, ; 522
	i32 304, ; 523
	i32 165, ; 524
	i32 279, ; 525
	i32 182, ; 526
	i32 189, ; 527
	i32 365, ; 528
	i32 301, ; 529
	i32 292, ; 530
	i32 170, ; 531
	i32 16, ; 532
	i32 144, ; 533
	i32 340, ; 534
	i32 213, ; 535
	i32 125, ; 536
	i32 222, ; 537
	i32 118, ; 538
	i32 38, ; 539
	i32 115, ; 540
	i32 47, ; 541
	i32 142, ; 542
	i32 117, ; 543
	i32 231, ; 544
	i32 34, ; 545
	i32 236, ; 546
	i32 180, ; 547
	i32 95, ; 548
	i32 53, ; 549
	i32 293, ; 550
	i32 195, ; 551
	i32 129, ; 552
	i32 153, ; 553
	i32 175, ; 554
	i32 24, ; 555
	i32 161, ; 556
	i32 270, ; 557
	i32 148, ; 558
	i32 104, ; 559
	i32 235, ; 560
	i32 224, ; 561
	i32 89, ; 562
	i32 258, ; 563
	i32 60, ; 564
	i32 142, ; 565
	i32 100, ; 566
	i32 5, ; 567
	i32 13, ; 568
	i32 122, ; 569
	i32 135, ; 570
	i32 191, ; 571
	i32 28, ; 572
	i32 335, ; 573
	i32 239, ; 574
	i32 211, ; 575
	i32 72, ; 576
	i32 268, ; 577
	i32 24, ; 578
	i32 225, ; 579
	i32 256, ; 580
	i32 297, ; 581
	i32 294, ; 582
	i32 352, ; 583
	i32 137, ; 584
	i32 249, ; 585
	i32 265, ; 586
	i32 168, ; 587
	i32 298, ; 588
	i32 331, ; 589
	i32 101, ; 590
	i32 123, ; 591
	i32 269, ; 592
	i32 197, ; 593
	i32 163, ; 594
	i32 167, ; 595
	i32 272, ; 596
	i32 39, ; 597
	i32 215, ; 598
	i32 179, ; 599
	i32 183, ; 600
	i32 0, ; 601
	i32 339, ; 602
	i32 17, ; 603
	i32 173, ; 604
	i32 171, ; 605
	i32 352, ; 606
	i32 351, ; 607
	i32 137, ; 608
	i32 150, ; 609
	i32 261, ; 610
	i32 155, ; 611
	i32 130, ; 612
	i32 19, ; 613
	i32 65, ; 614
	i32 147, ; 615
	i32 47, ; 616
	i32 359, ; 617
	i32 247, ; 618
	i32 79, ; 619
	i32 231, ; 620
	i32 61, ; 621
	i32 184, ; 622
	i32 240, ; 623
	i32 176, ; 624
	i32 106, ; 625
	i32 296, ; 626
	i32 251, ; 627
	i32 49, ; 628
	i32 282, ; 629
	i32 356, ; 630
	i32 293, ; 631
	i32 14, ; 632
	i32 194, ; 633
	i32 68, ; 634
	i32 183, ; 635
	i32 171, ; 636
	i32 362, ; 637
	i32 257, ; 638
	i32 261, ; 639
	i32 361, ; 640
	i32 210, ; 641
	i32 78, ; 642
	i32 266, ; 643
	i32 108, ; 644
	i32 250, ; 645
	i32 292, ; 646
	i32 241, ; 647
	i32 67, ; 648
	i32 63, ; 649
	i32 27, ; 650
	i32 160, ; 651
	i32 196, ; 652
	i32 207, ; 653
	i32 259, ; 654
	i32 10, ; 655
	i32 178, ; 656
	i32 215, ; 657
	i32 11, ; 658
	i32 224, ; 659
	i32 78, ; 660
	i32 126, ; 661
	i32 83, ; 662
	i32 198, ; 663
	i32 66, ; 664
	i32 107, ; 665
	i32 65, ; 666
	i32 128, ; 667
	i32 122, ; 668
	i32 77, ; 669
	i32 307, ; 670
	i32 297, ; 671
	i32 360, ; 672
	i32 8, ; 673
	i32 265, ; 674
	i32 2, ; 675
	i32 233, ; 676
	i32 44, ; 677
	i32 310, ; 678
	i32 156, ; 679
	i32 128, ; 680
	i32 295, ; 681
	i32 23, ; 682
	i32 133, ; 683
	i32 253, ; 684
	i32 284, ; 685
	i32 233, ; 686
	i32 355, ; 687
	i32 337, ; 688
	i32 327, ; 689
	i32 29, ; 690
	i32 252, ; 691
	i32 62, ; 692
	i32 221, ; 693
	i32 217, ; 694
	i32 90, ; 695
	i32 177, ; 696
	i32 87, ; 697
	i32 148, ; 698
	i32 203, ; 699
	i32 178, ; 700
	i32 219, ; 701
	i32 36, ; 702
	i32 86, ; 703
	i32 273, ; 704
	i32 350, ; 705
	i32 181, ; 706
	i32 345, ; 707
	i32 197, ; 708
	i32 50, ; 709
	i32 6, ; 710
	i32 90, ; 711
	i32 357, ; 712
	i32 21, ; 713
	i32 162, ; 714
	i32 96, ; 715
	i32 50, ; 716
	i32 174, ; 717
	i32 113, ; 718
	i32 289, ; 719
	i32 363, ; 720
	i32 130, ; 721
	i32 76, ; 722
	i32 27, ; 723
	i32 266, ; 724
	i32 288, ; 725
	i32 7, ; 726
	i32 238, ; 727
	i32 216, ; 728
	i32 110, ; 729
	i32 289, ; 730
	i32 275 ; 731
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ cdb777a0c306e3e0668f847433f82144d7ca745f"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
