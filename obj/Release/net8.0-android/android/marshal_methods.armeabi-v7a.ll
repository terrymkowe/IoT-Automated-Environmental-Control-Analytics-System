; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [216 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [432 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 164
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 163
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 81
	i32 39485524, ; 3: System.Net.WebSockets.dll => 0x25a8054 => 173
	i32 42639949, ; 4: System.Threading.Thread => 0x28aa24d => 201
	i32 67008169, ; 5: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 68219467, ; 6: System.Security.Cryptography.Primitives => 0x410f24b => 192
	i32 72070932, ; 7: Microsoft.Maui.Graphics.dll => 0x44bb714 => 78
	i32 95598293, ; 8: Supabase.dll => 0x5b2b6d5 => 85
	i32 109166225, ; 9: UsbSerialForAndroid.Net => 0x681be91 => 100
	i32 117431740, ; 10: System.Runtime.InteropServices => 0x6ffddbc => 184
	i32 122350210, ; 11: System.Threading.Channels.dll => 0x74aea82 => 199
	i32 142721839, ; 12: System.Net.WebHeaderCollection => 0x881c32f => 171
	i32 149972175, ; 13: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 192
	i32 162612358, ; 14: MimeMapping => 0x9b14486 => 80
	i32 165246403, ; 15: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 107
	i32 172961045, ; 16: Syncfusion.Maui.Core.dll => 0xa4f2d15 => 94
	i32 176714968, ; 17: Microsoft.AspNetCore.WebUtilities.dll => 0xa8874d8 => 52
	i32 182336117, ; 18: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 125
	i32 195452805, ; 19: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 20: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 21: System.ComponentModel => 0xc38ff48 => 142
	i32 209399409, ; 22: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 105
	i32 230752869, ; 23: Microsoft.CSharp.dll => 0xdc10265 => 133
	i32 246610117, ; 24: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 180
	i32 259487786, ; 25: Syncfusion.Maui.Charts => 0xf77782a => 93
	i32 280992041, ; 26: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 298918909, ; 27: System.Net.Ping.dll => 0x11d123fd => 165
	i32 317674968, ; 28: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 29: Xamarin.AndroidX.Activity.dll => 0x13031348 => 102
	i32 336156722, ; 30: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 31: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 114
	i32 356389973, ; 32: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 367780167, ; 33: System.IO.Pipes => 0x15ebe147 => 157
	i32 375677976, ; 34: System.Net.ServicePoint.dll => 0x16646418 => 169
	i32 379916513, ; 35: System.Threading.Thread.dll => 0x16a510e1 => 201
	i32 385762202, ; 36: System.Memory.dll => 0x16fe439a => 160
	i32 395744057, ; 37: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 424412647, ; 38: UsbSerialForAndroid.Net.dll => 0x194c05e7 => 100
	i32 435591531, ; 39: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 40: System.Collections => 0x1a61054f => 139
	i32 450948140, ; 41: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 113
	i32 451504562, ; 42: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 193
	i32 456227837, ; 43: System.Web.HttpUtility.dll => 0x1b317bfd => 203
	i32 459347974, ; 44: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 188
	i32 465846621, ; 45: mscorlib => 0x1bc4415d => 209
	i32 469710990, ; 46: System.dll => 0x1bff388e => 208
	i32 485463106, ; 47: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 69
	i32 490002678, ; 48: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 0x1d34d8f6 => 47
	i32 498788369, ; 49: System.ObjectModel => 0x1dbae811 => 175
	i32 500358224, ; 50: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 51: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 52: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 68
	i32 525008092, ; 53: SkiaSharp.dll => 0x1f4afcdc => 83
	i32 539058512, ; 54: Microsoft.Extensions.Logging => 0x20216150 => 64
	i32 548916678, ; 55: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 53
	i32 592146354, ; 56: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 610194910, ; 57: System.Reactive.dll => 0x245ed5de => 99
	i32 613668793, ; 58: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 191
	i32 627609679, ; 59: Xamarin.AndroidX.CustomView => 0x2568904f => 111
	i32 627931235, ; 60: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 61: System.Text.Encodings.Web.dll => 0x27787397 => 196
	i32 672442732, ; 62: System.Collections.Concurrent => 0x2814a96c => 135
	i32 683518922, ; 63: System.Net.Security => 0x28bdabca => 168
	i32 688181140, ; 64: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 65: System.Xml.Linq.dll => 0x29293ff5 => 204
	i32 706645707, ; 66: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 67: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 68: System.Runtime.Loader.dll => 0x2b15ed29 => 185
	i32 759454413, ; 69: System.Net.Requests => 0x2d445acd => 167
	i32 762598435, ; 70: System.IO.Pipes.dll => 0x2d745423 => 157
	i32 763346851, ; 71: Websocket.Client => 0x2d7fbfa3 => 101
	i32 772621961, ; 72: Supabase.Core.dll => 0x2e0d4689 => 86
	i32 775507847, ; 73: System.IO.Compression => 0x2e394f87 => 154
	i32 777317022, ; 74: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 75: Microsoft.Extensions.Options => 0x2f0980eb => 67
	i32 804715423, ; 76: System.Data.Common => 0x2ff6fb9f => 145
	i32 823281589, ; 77: System.Private.Uri.dll => 0x311247b5 => 176
	i32 830298997, ; 78: System.IO.Compression.Brotli => 0x317d5b75 => 153
	i32 886248193, ; 79: Microcharts.Droid => 0x34d31301 => 43
	i32 904024072, ; 80: System.ComponentModel.Primitives.dll => 0x35e25008 => 140
	i32 911108515, ; 81: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 156
	i32 920281169, ; 82: Supabase.Functions => 0x36da6051 => 87
	i32 926902833, ; 83: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 955402788, ; 84: Newtonsoft.Json => 0x38f24a24 => 81
	i32 967690846, ; 85: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 114
	i32 975236339, ; 86: System.Diagnostics.Tracing => 0x3a20ecf3 => 149
	i32 975874589, ; 87: System.Xml.XDocument => 0x3a2aaa1d => 206
	i32 992768348, ; 88: System.Collections.dll => 0x3b2c715c => 139
	i32 999186168, ; 89: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 62
	i32 1012816738, ; 90: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 124
	i32 1019214401, ; 91: System.Drawing => 0x3cbffa41 => 151
	i32 1028951442, ; 92: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 59
	i32 1029334545, ; 93: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 94: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 103
	i32 1036536393, ; 95: System.Drawing.Primitives.dll => 0x3dc84a49 => 150
	i32 1036714073, ; 96: UsbSerialForAndroid => 0x3dcb0059 => 42
	i32 1044663988, ; 97: System.Linq.Expressions.dll => 0x3e444eb4 => 158
	i32 1052210849, ; 98: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 116
	i32 1082857460, ; 99: System.ComponentModel.TypeConverter => 0x408b17f4 => 141
	i32 1084122840, ; 100: Xamarin.Kotlin.StdLib => 0x409e66d8 => 129
	i32 1089187994, ; 101: Websocket.Client.dll => 0x40ebb09a => 101
	i32 1098259244, ; 102: System => 0x41761b2c => 208
	i32 1106973742, ; 103: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 57
	i32 1110309514, ; 104: Microsoft.Extensions.Hosting.Abstractions => 0x422dfa8a => 63
	i32 1118262833, ; 105: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 106: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1173126369, ; 107: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 60
	i32 1178241025, ; 108: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 121
	i32 1203215381, ; 109: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1208641965, ; 110: System.Diagnostics.Process => 0x480a69ad => 147
	i32 1216849306, ; 111: Supabase.Realtime.dll => 0x4887a59a => 90
	i32 1219540809, ; 112: Supabase.Functions.dll => 0x48b0b749 => 87
	i32 1220193633, ; 113: Microsoft.Net.Http.Headers => 0x48baad61 => 79
	i32 1234928153, ; 114: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1236289705, ; 115: Microsoft.AspNetCore.Hosting.Server.Abstractions => 0x49b048a9 => 47
	i32 1260983243, ; 116: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 117: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 112
	i32 1324164729, ; 118: System.Linq => 0x4eed2679 => 159
	i32 1336984896, ; 119: Supabase.Core => 0x4fb0c540 => 86
	i32 1357010908, ; 120: System.IO.Ports.dll => 0x50e257dc => 97
	i32 1373134921, ; 121: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 122: Xamarin.AndroidX.SavedState => 0x52114ed3 => 124
	i32 1406073936, ; 123: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 108
	i32 1408764838, ; 124: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 187
	i32 1430672901, ; 125: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1452070440, ; 126: System.Formats.Asn1.dll => 0x568cd628 => 152
	i32 1458022317, ; 127: System.Net.Security.dll => 0x56e7a7ad => 168
	i32 1460893475, ; 128: System.IdentityModel.Tokens.Jwt => 0x57137723 => 96
	i32 1461004990, ; 129: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 130: System.Collections.Immutable.dll => 0x5718a9ef => 136
	i32 1462112819, ; 131: System.IO.Compression.dll => 0x57261233 => 154
	i32 1469204771, ; 132: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 104
	i32 1470490898, ; 133: Microsoft.Extensions.Primitives => 0x57a5e912 => 68
	i32 1479771757, ; 134: System.Collections.Immutable => 0x5833866d => 136
	i32 1480492111, ; 135: System.IO.Compression.Brotli.dll => 0x583e844f => 153
	i32 1493001747, ; 136: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1498168481, ; 137: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 70
	i32 1514721132, ; 138: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1516168485, ; 139: Supabase.Gotrue => 0x5a5ee525 => 88
	i32 1521091094, ; 140: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 62
	i32 1543031311, ; 141: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 198
	i32 1551623176, ; 142: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1551954004, ; 143: Microsoft.IO.RecyclableMemoryStream.dll => 0x5c80f054 => 73
	i32 1618516317, ; 144: System.Net.WebSockets.Client.dll => 0x6078995d => 172
	i32 1622152042, ; 145: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 118
	i32 1624863272, ; 146: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 127
	i32 1636350590, ; 147: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 110
	i32 1639515021, ; 148: System.Net.Http.dll => 0x61b9038d => 161
	i32 1639986890, ; 149: System.Text.RegularExpressions => 0x61c036ca => 198
	i32 1657153582, ; 150: System.Runtime => 0x62c6282e => 189
	i32 1658251792, ; 151: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 128
	i32 1677501392, ; 152: System.Net.Primitives.dll => 0x63fca3d0 => 166
	i32 1678508291, ; 153: System.Net.WebSockets => 0x640c0103 => 173
	i32 1679769178, ; 154: System.Security.Cryptography => 0x641f3e5a => 194
	i32 1691477237, ; 155: System.Reflection.Metadata => 0x64d1e4f5 => 181
	i32 1729485958, ; 156: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 106
	i32 1736233607, ; 157: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 158: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1746316138, ; 159: Mono.Android.Export => 0x6816ab6a => 213
	i32 1763938596, ; 160: System.Diagnostics.TraceSource.dll => 0x69239124 => 148
	i32 1766324549, ; 161: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 125
	i32 1770582343, ; 162: Microsoft.Extensions.Logging.dll => 0x6988f147 => 64
	i32 1776026572, ; 163: System.Core.dll => 0x69dc03cc => 144
	i32 1780572499, ; 164: Mono.Android.Runtime.dll => 0x6a216153 => 214
	i32 1782862114, ; 165: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 166: Xamarin.AndroidX.Fragment => 0x6a96652d => 113
	i32 1793755602, ; 167: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1796167890, ; 168: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 53
	i32 1808609942, ; 169: Xamarin.AndroidX.Loader => 0x6bcd3296 => 118
	i32 1813058853, ; 170: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 129
	i32 1813201214, ; 171: Xamarin.Google.Android.Material => 0x6c13413e => 128
	i32 1818569960, ; 172: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 122
	i32 1819327070, ; 173: Microsoft.AspNetCore.Http.Features.dll => 0x6c70ba5e => 51
	i32 1824175904, ; 174: System.Text.Encoding.Extensions => 0x6cbab720 => 195
	i32 1824722060, ; 175: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 187
	i32 1828688058, ; 176: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 65
	i32 1842015223, ; 177: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 178: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 179: System.Linq.Expressions => 0x6ec71a65 => 158
	i32 1870277092, ; 180: System.Reflection.Primitives => 0x6f7a29e4 => 182
	i32 1875935024, ; 181: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1889954781, ; 182: System.Reflection.Metadata.dll => 0x70a66bdd => 181
	i32 1910275211, ; 183: System.Collections.NonGeneric.dll => 0x71dc7c8b => 137
	i32 1927897671, ; 184: System.CodeDom.dll => 0x72e96247 => 95
	i32 1928288591, ; 185: Microsoft.AspNetCore.Http.Abstractions => 0x72ef594f => 49
	i32 1939592360, ; 186: System.Private.Xml.Linq => 0x739bd4a8 => 177
	i32 1968388702, ; 187: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 54
	i32 1986222447, ; 188: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 72
	i32 2003115576, ; 189: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2011961780, ; 190: System.Buffers.dll => 0x77ec19b4 => 134
	i32 2018526534, ; 191: Supabase.Gotrue.dll => 0x78504546 => 88
	i32 2019465201, ; 192: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 116
	i32 2025202353, ; 193: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 194: System.Private.Xml => 0x79eb68ee => 178
	i32 2055257422, ; 195: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 115
	i32 2066184531, ; 196: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 197: System.Diagnostics.TraceSource => 0x7b6f419e => 148
	i32 2072397586, ; 198: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 61
	i32 2075706075, ; 199: Microsoft.AspNetCore.Http.Abstractions.dll => 0x7bb8c2db => 49
	i32 2079903147, ; 200: System.Runtime.dll => 0x7bf8cdab => 189
	i32 2090596640, ; 201: System.Numerics.Vectors => 0x7c9bf920 => 174
	i32 2127167465, ; 202: System.Console => 0x7ec9ffe9 => 143
	i32 2128198166, ; 203: Supabase.Realtime => 0x7ed9ba16 => 90
	i32 2128240319, ; 204: SmartTempMonApp => 0x7eda5ebf => 132
	i32 2138252982, ; 205: Supabase => 0x7f7326b6 => 85
	i32 2142473426, ; 206: System.Collections.Specialized => 0x7fb38cd2 => 138
	i32 2143465592, ; 207: Microsoft.IO.RecyclableMemoryStream => 0x7fc2b078 => 73
	i32 2143790110, ; 208: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 207
	i32 2159891885, ; 209: Microsoft.Maui => 0x80bd55ad => 76
	i32 2169148018, ; 210: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2178612968, ; 211: System.CodeDom => 0x81dafee8 => 95
	i32 2181898931, ; 212: Microsoft.Extensions.Options.dll => 0x820d22b3 => 67
	i32 2192057212, ; 213: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 65
	i32 2193016926, ; 214: System.ObjectModel.dll => 0x82b6c85e => 175
	i32 2193681939, ; 215: Microsoft.Extensions.Configuration.EnvironmentVariables.dll => 0x82c0ee13 => 56
	i32 2201107256, ; 216: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 130
	i32 2201231467, ; 217: System.Net.Http => 0x8334206b => 161
	i32 2204417087, ; 218: Microsoft.Extensions.ObjectPool => 0x8364bc3f => 66
	i32 2207618523, ; 219: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2242871324, ; 220: Microsoft.AspNetCore.Http.dll => 0x85af801c => 48
	i32 2266799131, ; 221: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 55
	i32 2270573516, ; 222: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 223: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 123
	i32 2295906218, ; 224: System.Net.Sockets => 0x88d8bfaa => 170
	i32 2303942373, ; 225: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 226: System.Private.CoreLib.dll => 0x896b7878 => 211
	i32 2340441535, ; 227: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 183
	i32 2353062107, ; 228: System.Net.Primitives => 0x8c40e0db => 166
	i32 2354730003, ; 229: Syncfusion.Licensing => 0x8c5a5413 => 92
	i32 2368005991, ; 230: System.Xml.ReaderWriter.dll => 0x8d24e767 => 205
	i32 2369706906, ; 231: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 71
	i32 2371007202, ; 232: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 54
	i32 2395872292, ; 233: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 234: System.Web.HttpUtility => 0x8f24faee => 203
	i32 2427813419, ; 235: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 236: System.Console.dll => 0x912896e5 => 143
	i32 2458678730, ; 237: System.Net.Sockets.dll => 0x928c75ca => 170
	i32 2471841756, ; 238: netstandard.dll => 0x93554fdc => 210
	i32 2475788418, ; 239: Java.Interop.dll => 0x93918882 => 212
	i32 2480646305, ; 240: Microsoft.Maui.Controls => 0x93dba8a1 => 74
	i32 2484371297, ; 241: System.Net.ServicePoint => 0x94147f61 => 169
	i32 2486847491, ; 242: Google.Api.Gax => 0x943a4803 => 37
	i32 2538310050, ; 243: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 180
	i32 2550873716, ; 244: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 245: Microsoft.CSharp => 0x98ba5a04 => 133
	i32 2570120770, ; 246: System.Text.Encodings.Web => 0x9930ee42 => 196
	i32 2585220780, ; 247: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 195
	i32 2585805581, ; 248: System.Net.Ping => 0x9a20430d => 165
	i32 2592341985, ; 249: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 60
	i32 2593496499, ; 250: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2594125473, ; 251: Microsoft.AspNetCore.Hosting.Abstractions => 0x9a9f36a1 => 46
	i32 2595928349, ; 252: FirebaseAdmin => 0x9abab91d => 36
	i32 2597088119, ; 253: XamarinUsbDriver => 0x9acc6b77 => 131
	i32 2605712449, ; 254: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 130
	i32 2617129537, ; 255: System.Private.Xml.dll => 0x9bfe3a41 => 178
	i32 2620871830, ; 256: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 110
	i32 2626831493, ; 257: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2629053246, ; 258: Google.Api.Gax.Rest => 0x9cb42b3e => 38
	i32 2633959305, ; 259: Microsoft.AspNetCore.Http.Extensions.dll => 0x9cff0789 => 50
	i32 2640290731, ; 260: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 71
	i32 2663698177, ; 261: System.Runtime.Loader => 0x9ec4cf01 => 185
	i32 2664396074, ; 262: System.Xml.XDocument.dll => 0x9ecf752a => 206
	i32 2665622720, ; 263: System.Drawing.Primitives => 0x9ee22cc0 => 150
	i32 2676780864, ; 264: System.Data.Common.dll => 0x9f8c6f40 => 145
	i32 2717744543, ; 265: System.Security.Claims => 0xa1fd7d9f => 190
	i32 2724373263, ; 266: System.Runtime.Numerics.dll => 0xa262a30f => 186
	i32 2732626843, ; 267: Xamarin.AndroidX.Activity => 0xa2e0939b => 102
	i32 2735172069, ; 268: System.Threading.Channels => 0xa30769e5 => 199
	i32 2737747696, ; 269: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 104
	i32 2752995522, ; 270: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 271: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 75
	i32 2764765095, ; 272: Microsoft.Maui.dll => 0xa4caf7a7 => 76
	i32 2778768386, ; 273: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 126
	i32 2785988530, ; 274: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2795602088, ; 275: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 84
	i32 2801831435, ; 276: Microsoft.Maui.Graphics => 0xa7008e0b => 78
	i32 2806116107, ; 277: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 278: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 108
	i32 2831556043, ; 279: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2836739085, ; 280: Microsoft.AspNetCore.Hosting => 0xa915340d => 45
	i32 2850549256, ; 281: Microsoft.AspNetCore.Http.Features => 0xa9e7ee08 => 51
	i32 2853208004, ; 282: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 126
	i32 2861098320, ; 283: Mono.Android.Export.dll => 0xaa88e550 => 213
	i32 2861189240, ; 284: Microsoft.Maui.Essentials => 0xaa8a4878 => 77
	i32 2868557005, ; 285: Syncfusion.Licensing.dll => 0xaafab4cd => 92
	i32 2893550578, ; 286: Google.Apis.Core => 0xac7813f2 => 41
	i32 2898407901, ; 287: System.Management => 0xacc231dd => 98
	i32 2905242038, ; 288: mscorlib.dll => 0xad2a79b6 => 209
	i32 2909740682, ; 289: System.Private.CoreLib => 0xad6f1e8a => 211
	i32 2911054922, ; 290: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 61
	i32 2912489636, ; 291: SkiaSharp.Views.Android => 0xad9910a4 => 84
	i32 2916838712, ; 292: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 127
	i32 2919462931, ; 293: System.Numerics.Vectors.dll => 0xae037813 => 174
	i32 2959614098, ; 294: System.ComponentModel.dll => 0xb0682092 => 142
	i32 2970759306, ; 295: BCrypt.Net-Next.dll => 0xb112308a => 35
	i32 2972252294, ; 296: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 191
	i32 2978368250, ; 297: Microsoft.AspNetCore.Hosting.Abstractions.dll => 0xb1864afa => 46
	i32 2978675010, ; 298: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 112
	i32 2990604888, ; 299: Google.Apis => 0xb2410258 => 39
	i32 2996646946, ; 300: Microsoft.AspNetCore.Http => 0xb29d3422 => 48
	i32 3036068679, ; 301: Microcharts.Droid.dll => 0xb4f6bb47 => 43
	i32 3036999524, ; 302: Microsoft.AspNetCore.Http.Extensions => 0xb504ef64 => 50
	i32 3038032645, ; 303: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 304: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 119
	i32 3059408633, ; 305: Mono.Android.Runtime => 0xb65adef9 => 214
	i32 3059793426, ; 306: System.ComponentModel.Primitives => 0xb660be12 => 140
	i32 3077302341, ; 307: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3084678329, ; 308: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 72
	i32 3090735792, ; 309: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 193
	i32 3099081453, ; 310: MimeMapping.dll => 0xb8b83aed => 80
	i32 3099732863, ; 311: System.Security.Claims.dll => 0xb8c22b7f => 190
	i32 3103600923, ; 312: System.Formats.Asn1 => 0xb8fd311b => 152
	i32 3124832203, ; 313: System.Threading.Tasks.Extensions => 0xba4127cb => 200
	i32 3138360719, ; 314: Supabase.Postgrest.dll => 0xbb0f958f => 89
	i32 3147165239, ; 315: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 149
	i32 3147228406, ; 316: Syncfusion.Maui.Core => 0xbb96e4f6 => 94
	i32 3159123045, ; 317: System.Reflection.Primitives.dll => 0xbc4c6465 => 182
	i32 3160747431, ; 318: System.IO.MemoryMappedFiles => 0xbc652da7 => 156
	i32 3178803400, ; 319: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 120
	i32 3188578740, ; 320: Microsoft.Extensions.Configuration.EnvironmentVariables => 0xbe0dd9b4 => 56
	i32 3203277885, ; 321: Google.Api.Gax.dll => 0xbeee243d => 37
	i32 3220365878, ; 322: System.Threading => 0xbff2e236 => 202
	i32 3245644316, ; 323: Syncfusion.Maui.Charts.dll => 0xc1749a1c => 93
	i32 3249260365, ; 324: RestSharp.dll => 0xc1abc74d => 82
	i32 3258312781, ; 325: Xamarin.AndroidX.CardView => 0xc235e84d => 106
	i32 3265893370, ; 326: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 200
	i32 3300764913, ; 327: Microsoft.AspNetCore.WebUtilities => 0xc4bdacf1 => 52
	i32 3305363605, ; 328: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3306135358, ; 329: System.IO.Ports => 0xc50f9f3e => 97
	i32 3312457198, ; 330: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 70
	i32 3316684772, ; 331: System.Net.Requests.dll => 0xc5b097e4 => 167
	i32 3317135071, ; 332: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 111
	i32 3340387945, ; 333: SkiaSharp => 0xc71a4669 => 83
	i32 3346324047, ; 334: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 121
	i32 3357674450, ; 335: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 336: System.Text.Json => 0xc82afec1 => 197
	i32 3362522851, ; 337: Xamarin.AndroidX.Core => 0xc86c06e3 => 109
	i32 3366347497, ; 338: Java.Interop => 0xc8a662e9 => 212
	i32 3374999561, ; 339: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 123
	i32 3381016424, ; 340: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 341: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 58
	i32 3430777524, ; 342: netstandard => 0xcc7d82b4 => 210
	i32 3453592554, ; 343: Google.Apis.Core.dll => 0xcdd9a3ea => 41
	i32 3455791806, ; 344: Microcharts => 0xcdfb32be => 44
	i32 3459797609, ; 345: SmartTempMonApp.dll => 0xce385269 => 132
	i32 3463511458, ; 346: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 347: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 141
	i32 3472012038, ; 348: BCrypt.Net-Next => 0xcef2b306 => 35
	i32 3476120550, ; 349: Mono.Android => 0xcf3163e6 => 215
	i32 3479583265, ; 350: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 351: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 352: System.Text.Json.dll => 0xcfbaacae => 197
	i32 3509114376, ; 353: System.Xml.Linq => 0xd128d608 => 204
	i32 3539954161, ; 354: System.Net.HttpListener => 0xd2ff69f1 => 162
	i32 3580758918, ; 355: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3598340787, ; 356: System.Net.WebSockets.Client => 0xd67a52b3 => 172
	i32 3607666123, ; 357: Supabase.Postgrest => 0xd7089dcb => 89
	i32 3608519521, ; 358: System.Linq.dll => 0xd715a361 => 159
	i32 3611087749, ; 359: Microsoft.AspNetCore.Hosting.dll => 0xd73cd385 => 45
	i32 3612435020, ; 360: System.Management.dll => 0xd751624c => 98
	i32 3621458322, ; 361: Google.Api.Gax.Rest.dll => 0xd7db1192 => 38
	i32 3624195450, ; 362: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 183
	i32 3641597786, ; 363: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 115
	i32 3643446276, ; 364: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 365: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 120
	i32 3657292374, ; 366: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 55
	i32 3660523487, ; 367: System.Net.NetworkInformation => 0xda2f27df => 164
	i32 3668042751, ; 368: Microcharts.dll => 0xdaa1e3ff => 44
	i32 3672681054, ; 369: Mono.Android.dll => 0xdae8aa5e => 215
	i32 3682565725, ; 370: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 105
	i32 3697841164, ; 371: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3700591436, ; 372: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 69
	i32 3724971120, ; 373: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 119
	i32 3731644420, ; 374: System.Reactive => 0xde6c6004 => 99
	i32 3732100267, ; 375: System.Net.NameResolution => 0xde7354ab => 163
	i32 3748608112, ; 376: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 146
	i32 3758424670, ; 377: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 57
	i32 3765508441, ; 378: Microsoft.Extensions.ObjectPool.dll => 0xe0711959 => 66
	i32 3786282454, ; 379: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 107
	i32 3792276235, ; 380: System.Collections.NonGeneric => 0xe2098b0b => 137
	i32 3793997468, ; 381: Google.Apis.Auth.dll => 0xe223ce9c => 40
	i32 3802395368, ; 382: System.Collections.Specialized.dll => 0xe2a3f2e8 => 138
	i32 3816437471, ; 383: RestSharp => 0xe37a36df => 82
	i32 3823082795, ; 384: System.Security.Cryptography.dll => 0xe3df9d2b => 194
	i32 3841636137, ; 385: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 59
	i32 3849253459, ; 386: System.Runtime.InteropServices.dll => 0xe56ef253 => 184
	i32 3870376305, ; 387: System.Net.HttpListener.dll => 0xe6b14171 => 162
	i32 3885497537, ; 388: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 171
	i32 3889960447, ; 389: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 390: System.Collections.Concurrent.dll => 0xe839deed => 135
	i32 3896760992, ; 391: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 109
	i32 3906640997, ; 392: Supabase.Storage.dll => 0xe8da9c65 => 91
	i32 3928044579, ; 393: System.Xml.ReaderWriter => 0xea213423 => 205
	i32 3931092270, ; 394: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 122
	i32 3955647286, ; 395: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 103
	i32 3980364293, ; 396: Supabase.Storage => 0xed3f8a05 => 91
	i32 3980434154, ; 397: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 398: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 3994283630, ; 399: XamarinUsbDriver.dll => 0xee13ee6e => 131
	i32 4003436829, ; 400: System.Diagnostics.Process.dll => 0xee9f991d => 147
	i32 4025784931, ; 401: System.Memory => 0xeff49a63 => 160
	i32 4044155772, ; 402: Microsoft.Net.Http.Headers.dll => 0xf10ceb7c => 79
	i32 4046471985, ; 403: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 75
	i32 4054681211, ; 404: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 179
	i32 4059682726, ; 405: Google.Apis.dll => 0xf1f9d7a6 => 39
	i32 4068434129, ; 406: System.Private.Xml.Linq.dll => 0xf27f60d1 => 177
	i32 4073602200, ; 407: System.Threading.dll => 0xf2ce3c98 => 202
	i32 4078967171, ; 408: Microsoft.Extensions.Hosting.Abstractions.dll => 0xf3201983 => 63
	i32 4082882467, ; 409: Google.Apis.Auth => 0xf35bd7a3 => 40
	i32 4094352644, ; 410: Microsoft.Maui.Essentials.dll => 0xf40add04 => 77
	i32 4099507663, ; 411: System.Drawing.dll => 0xf45985cf => 151
	i32 4100113165, ; 412: System.Private.Uri => 0xf462c30d => 176
	i32 4102112229, ; 413: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4103870601, ; 414: UsbSerialForAndroid.dll => 0xf49c1889 => 42
	i32 4125707920, ; 415: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 416: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 58
	i32 4127667938, ; 417: System.IO.FileSystem.Watcher => 0xf60736e2 => 155
	i32 4147896353, ; 418: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 179
	i32 4150914736, ; 419: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4151237749, ; 420: System.Core => 0xf76edc75 => 144
	i32 4159265925, ; 421: System.Xml.XmlSerializer => 0xf7e95c85 => 207
	i32 4164802419, ; 422: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 155
	i32 4177102269, ; 423: FirebaseAdmin.dll => 0xf8f985bd => 36
	i32 4181436372, ; 424: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 188
	i32 4182413190, ; 425: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 117
	i32 4213026141, ; 426: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 146
	i32 4260525087, ; 427: System.Buffers => 0xfdf2741f => 134
	i32 4263231520, ; 428: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 96
	i32 4271975918, ; 429: Microsoft.Maui.Controls.dll => 0xfea12dee => 74
	i32 4274976490, ; 430: System.Runtime.Numerics => 0xfecef6ea => 186
	i32 4292120959 ; 431: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 117
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [432 x i32] [
	i32 164, ; 0
	i32 163, ; 1
	i32 81, ; 2
	i32 173, ; 3
	i32 201, ; 4
	i32 33, ; 5
	i32 192, ; 6
	i32 78, ; 7
	i32 85, ; 8
	i32 100, ; 9
	i32 184, ; 10
	i32 199, ; 11
	i32 171, ; 12
	i32 192, ; 13
	i32 80, ; 14
	i32 107, ; 15
	i32 94, ; 16
	i32 52, ; 17
	i32 125, ; 18
	i32 30, ; 19
	i32 31, ; 20
	i32 142, ; 21
	i32 105, ; 22
	i32 133, ; 23
	i32 180, ; 24
	i32 93, ; 25
	i32 2, ; 26
	i32 165, ; 27
	i32 30, ; 28
	i32 102, ; 29
	i32 15, ; 30
	i32 114, ; 31
	i32 14, ; 32
	i32 157, ; 33
	i32 169, ; 34
	i32 201, ; 35
	i32 160, ; 36
	i32 34, ; 37
	i32 100, ; 38
	i32 26, ; 39
	i32 139, ; 40
	i32 113, ; 41
	i32 193, ; 42
	i32 203, ; 43
	i32 188, ; 44
	i32 209, ; 45
	i32 208, ; 46
	i32 69, ; 47
	i32 47, ; 48
	i32 175, ; 49
	i32 13, ; 50
	i32 7, ; 51
	i32 68, ; 52
	i32 83, ; 53
	i32 64, ; 54
	i32 53, ; 55
	i32 21, ; 56
	i32 99, ; 57
	i32 191, ; 58
	i32 111, ; 59
	i32 19, ; 60
	i32 196, ; 61
	i32 135, ; 62
	i32 168, ; 63
	i32 1, ; 64
	i32 204, ; 65
	i32 16, ; 66
	i32 4, ; 67
	i32 185, ; 68
	i32 167, ; 69
	i32 157, ; 70
	i32 101, ; 71
	i32 86, ; 72
	i32 154, ; 73
	i32 25, ; 74
	i32 67, ; 75
	i32 145, ; 76
	i32 176, ; 77
	i32 153, ; 78
	i32 43, ; 79
	i32 140, ; 80
	i32 156, ; 81
	i32 87, ; 82
	i32 28, ; 83
	i32 81, ; 84
	i32 114, ; 85
	i32 149, ; 86
	i32 206, ; 87
	i32 139, ; 88
	i32 62, ; 89
	i32 124, ; 90
	i32 151, ; 91
	i32 59, ; 92
	i32 3, ; 93
	i32 103, ; 94
	i32 150, ; 95
	i32 42, ; 96
	i32 158, ; 97
	i32 116, ; 98
	i32 141, ; 99
	i32 129, ; 100
	i32 101, ; 101
	i32 208, ; 102
	i32 57, ; 103
	i32 63, ; 104
	i32 16, ; 105
	i32 22, ; 106
	i32 60, ; 107
	i32 121, ; 108
	i32 20, ; 109
	i32 147, ; 110
	i32 90, ; 111
	i32 87, ; 112
	i32 79, ; 113
	i32 18, ; 114
	i32 47, ; 115
	i32 2, ; 116
	i32 112, ; 117
	i32 159, ; 118
	i32 86, ; 119
	i32 97, ; 120
	i32 32, ; 121
	i32 124, ; 122
	i32 108, ; 123
	i32 187, ; 124
	i32 0, ; 125
	i32 152, ; 126
	i32 168, ; 127
	i32 96, ; 128
	i32 6, ; 129
	i32 136, ; 130
	i32 154, ; 131
	i32 104, ; 132
	i32 68, ; 133
	i32 136, ; 134
	i32 153, ; 135
	i32 10, ; 136
	i32 70, ; 137
	i32 5, ; 138
	i32 88, ; 139
	i32 62, ; 140
	i32 198, ; 141
	i32 25, ; 142
	i32 73, ; 143
	i32 172, ; 144
	i32 118, ; 145
	i32 127, ; 146
	i32 110, ; 147
	i32 161, ; 148
	i32 198, ; 149
	i32 189, ; 150
	i32 128, ; 151
	i32 166, ; 152
	i32 173, ; 153
	i32 194, ; 154
	i32 181, ; 155
	i32 106, ; 156
	i32 23, ; 157
	i32 1, ; 158
	i32 213, ; 159
	i32 148, ; 160
	i32 125, ; 161
	i32 64, ; 162
	i32 144, ; 163
	i32 214, ; 164
	i32 17, ; 165
	i32 113, ; 166
	i32 9, ; 167
	i32 53, ; 168
	i32 118, ; 169
	i32 129, ; 170
	i32 128, ; 171
	i32 122, ; 172
	i32 51, ; 173
	i32 195, ; 174
	i32 187, ; 175
	i32 65, ; 176
	i32 29, ; 177
	i32 26, ; 178
	i32 158, ; 179
	i32 182, ; 180
	i32 8, ; 181
	i32 181, ; 182
	i32 137, ; 183
	i32 95, ; 184
	i32 49, ; 185
	i32 177, ; 186
	i32 54, ; 187
	i32 72, ; 188
	i32 5, ; 189
	i32 134, ; 190
	i32 88, ; 191
	i32 116, ; 192
	i32 0, ; 193
	i32 178, ; 194
	i32 115, ; 195
	i32 4, ; 196
	i32 148, ; 197
	i32 61, ; 198
	i32 49, ; 199
	i32 189, ; 200
	i32 174, ; 201
	i32 143, ; 202
	i32 90, ; 203
	i32 132, ; 204
	i32 85, ; 205
	i32 138, ; 206
	i32 73, ; 207
	i32 207, ; 208
	i32 76, ; 209
	i32 12, ; 210
	i32 95, ; 211
	i32 67, ; 212
	i32 65, ; 213
	i32 175, ; 214
	i32 56, ; 215
	i32 130, ; 216
	i32 161, ; 217
	i32 66, ; 218
	i32 14, ; 219
	i32 48, ; 220
	i32 55, ; 221
	i32 8, ; 222
	i32 123, ; 223
	i32 170, ; 224
	i32 18, ; 225
	i32 211, ; 226
	i32 183, ; 227
	i32 166, ; 228
	i32 92, ; 229
	i32 205, ; 230
	i32 71, ; 231
	i32 54, ; 232
	i32 13, ; 233
	i32 203, ; 234
	i32 10, ; 235
	i32 143, ; 236
	i32 170, ; 237
	i32 210, ; 238
	i32 212, ; 239
	i32 74, ; 240
	i32 169, ; 241
	i32 37, ; 242
	i32 180, ; 243
	i32 11, ; 244
	i32 133, ; 245
	i32 196, ; 246
	i32 195, ; 247
	i32 165, ; 248
	i32 60, ; 249
	i32 20, ; 250
	i32 46, ; 251
	i32 36, ; 252
	i32 131, ; 253
	i32 130, ; 254
	i32 178, ; 255
	i32 110, ; 256
	i32 15, ; 257
	i32 38, ; 258
	i32 50, ; 259
	i32 71, ; 260
	i32 185, ; 261
	i32 206, ; 262
	i32 150, ; 263
	i32 145, ; 264
	i32 190, ; 265
	i32 186, ; 266
	i32 102, ; 267
	i32 199, ; 268
	i32 104, ; 269
	i32 21, ; 270
	i32 75, ; 271
	i32 76, ; 272
	i32 126, ; 273
	i32 27, ; 274
	i32 84, ; 275
	i32 78, ; 276
	i32 6, ; 277
	i32 108, ; 278
	i32 19, ; 279
	i32 45, ; 280
	i32 51, ; 281
	i32 126, ; 282
	i32 213, ; 283
	i32 77, ; 284
	i32 92, ; 285
	i32 41, ; 286
	i32 98, ; 287
	i32 209, ; 288
	i32 211, ; 289
	i32 61, ; 290
	i32 84, ; 291
	i32 127, ; 292
	i32 174, ; 293
	i32 142, ; 294
	i32 35, ; 295
	i32 191, ; 296
	i32 46, ; 297
	i32 112, ; 298
	i32 39, ; 299
	i32 48, ; 300
	i32 43, ; 301
	i32 50, ; 302
	i32 34, ; 303
	i32 119, ; 304
	i32 214, ; 305
	i32 140, ; 306
	i32 12, ; 307
	i32 72, ; 308
	i32 193, ; 309
	i32 80, ; 310
	i32 190, ; 311
	i32 152, ; 312
	i32 200, ; 313
	i32 89, ; 314
	i32 149, ; 315
	i32 94, ; 316
	i32 182, ; 317
	i32 156, ; 318
	i32 120, ; 319
	i32 56, ; 320
	i32 37, ; 321
	i32 202, ; 322
	i32 93, ; 323
	i32 82, ; 324
	i32 106, ; 325
	i32 200, ; 326
	i32 52, ; 327
	i32 7, ; 328
	i32 97, ; 329
	i32 70, ; 330
	i32 167, ; 331
	i32 111, ; 332
	i32 83, ; 333
	i32 121, ; 334
	i32 24, ; 335
	i32 197, ; 336
	i32 109, ; 337
	i32 212, ; 338
	i32 123, ; 339
	i32 3, ; 340
	i32 58, ; 341
	i32 210, ; 342
	i32 41, ; 343
	i32 44, ; 344
	i32 132, ; 345
	i32 11, ; 346
	i32 141, ; 347
	i32 35, ; 348
	i32 215, ; 349
	i32 24, ; 350
	i32 23, ; 351
	i32 197, ; 352
	i32 204, ; 353
	i32 162, ; 354
	i32 31, ; 355
	i32 172, ; 356
	i32 89, ; 357
	i32 159, ; 358
	i32 45, ; 359
	i32 98, ; 360
	i32 38, ; 361
	i32 183, ; 362
	i32 115, ; 363
	i32 28, ; 364
	i32 120, ; 365
	i32 55, ; 366
	i32 164, ; 367
	i32 44, ; 368
	i32 215, ; 369
	i32 105, ; 370
	i32 33, ; 371
	i32 69, ; 372
	i32 119, ; 373
	i32 99, ; 374
	i32 163, ; 375
	i32 146, ; 376
	i32 57, ; 377
	i32 66, ; 378
	i32 107, ; 379
	i32 137, ; 380
	i32 40, ; 381
	i32 138, ; 382
	i32 82, ; 383
	i32 194, ; 384
	i32 59, ; 385
	i32 184, ; 386
	i32 162, ; 387
	i32 171, ; 388
	i32 32, ; 389
	i32 135, ; 390
	i32 109, ; 391
	i32 91, ; 392
	i32 205, ; 393
	i32 122, ; 394
	i32 103, ; 395
	i32 91, ; 396
	i32 27, ; 397
	i32 9, ; 398
	i32 131, ; 399
	i32 147, ; 400
	i32 160, ; 401
	i32 79, ; 402
	i32 75, ; 403
	i32 179, ; 404
	i32 39, ; 405
	i32 177, ; 406
	i32 202, ; 407
	i32 63, ; 408
	i32 40, ; 409
	i32 77, ; 410
	i32 151, ; 411
	i32 176, ; 412
	i32 22, ; 413
	i32 42, ; 414
	i32 17, ; 415
	i32 58, ; 416
	i32 155, ; 417
	i32 179, ; 418
	i32 29, ; 419
	i32 144, ; 420
	i32 207, ; 421
	i32 155, ; 422
	i32 36, ; 423
	i32 188, ; 424
	i32 117, ; 425
	i32 146, ; 426
	i32 134, ; 427
	i32 96, ; 428
	i32 74, ; 429
	i32 186, ; 430
	i32 117 ; 431
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

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
!7 = !{i32 1, !"min_enum_size", i32 4}
