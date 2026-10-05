; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [216 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [432 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 68
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 215
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 77
	i64 160518225272466977, ; 3: Microsoft.Extensions.Hosting.Abstractions => 0x23a4679b5576e21 => 63
	i64 181099460066822533, ; 4: Microcharts.Droid.dll => 0x28364ffda4c4985 => 43
	i64 196720943101637631, ; 5: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 158
	i64 210515253464952879, ; 6: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 107
	i64 232391251801502327, ; 7: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 124
	i64 285036659652810552, ; 8: SmartTempMonApp.dll => 0x3f4a754ee91d738 => 132
	i64 464346026994987652, ; 9: System.Reactive.dll => 0x671b04057e67284 => 99
	i64 502670939551102150, ; 10: System.Management.dll => 0x6f9d88e66daf4c6 => 98
	i64 535107122908063503, ; 11: Microsoft.Extensions.ObjectPool.dll => 0x76d1517d9b7670f => 66
	i64 545109961164950392, ; 12: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 560278790331054453, ; 13: System.Reflection.Primitives => 0x7c6829760de3975 => 182
	i64 648449422406355874, ; 14: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x8ffc15065568ba2 => 57
	i64 718159679911342543, ; 15: FirebaseAdmin.dll => 0x9f76a6c851fb1cf => 36
	i64 750875890346172408, ; 16: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 201
	i64 799765834175365804, ; 17: System.ComponentModel.dll => 0xb1956c9f18442ac => 142
	i64 849051935479314978, ; 18: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 872800313462103108, ; 19: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 112
	i64 1010599046655515943, ; 20: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 182
	i64 1120440138749646132, ; 21: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 128
	i64 1121665720830085036, ; 22: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1268860745194512059, ; 23: System.Drawing.dll => 0x119be62002c19ebb => 151
	i64 1369545283391376210, ; 24: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 120
	i64 1404195534211153682, ; 25: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 155
	i64 1416135423712704079, ; 26: Microcharts => 0x13a71faa343e364f => 44
	i64 1476839205573959279, ; 27: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 166
	i64 1486715745332614827, ; 28: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 74
	i64 1492954217099365037, ; 29: System.Net.HttpListener => 0x14b809f350210aad => 162
	i64 1513467482682125403, ; 30: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 214
	i64 1537168428375924959, ; 31: System.Threading.Thread.dll => 0x15551e8a954ae0df => 201
	i64 1556147632182429976, ; 32: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1559087064654078745, ; 33: BCrypt.Net-Next.dll => 0x15a2fd6cc69ce319 => 35
	i64 1624659445732251991, ; 34: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 104
	i64 1628611045998245443, ; 35: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 117
	i64 1731380447121279447, ; 36: Newtonsoft.Json => 0x18071957e9b889d7 => 81
	i64 1743969030606105336, ; 37: System.Memory.dll => 0x1833d297e88f2af8 => 160
	i64 1767386781656293639, ; 38: System.Private.Uri.dll => 0x188704e9f5582107 => 176
	i64 1795316252682057001, ; 39: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 103
	i64 1825687700144851180, ; 40: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 183
	i64 1835311033149317475, ; 41: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 42: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 124
	i64 1865037103900624886, ; 43: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 53
	i64 1875417405349196092, ; 44: System.Drawing.Primitives => 0x1a06d2319b6c713c => 150
	i64 1881198190668717030, ; 45: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 46: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 75
	i64 1959996714666907089, ; 47: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1972385128188460614, ; 48: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 191
	i64 1981742497975770890, ; 49: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 116
	i64 1983698669889758782, ; 50: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 51: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2040001226662520565, ; 52: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 200
	i64 2080945842184875448, ; 53: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 156
	i64 2102659300918482391, ; 54: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 150
	i64 2133195048986300728, ; 55: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 81
	i64 2152408820173588167, ; 56: Supabase.Functions.dll => 0x1ddee46b01dd46c7 => 87
	i64 2165725771938924357, ; 57: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 105
	i64 2262844636196693701, ; 58: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 112
	i64 2287834202362508563, ; 59: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 135
	i64 2302323944321350744, ; 60: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 61: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 115
	i64 2335503487726329082, ; 62: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 196
	i64 2386647871502675383, ; 63: XamarinUsbDriver => 0x211f139818dbedb7 => 131
	i64 2470498323731680442, ; 64: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 108
	i64 2497223385847772520, ; 65: System.Runtime => 0x22a7eb7046413568 => 189
	i64 2547086958574651984, ; 66: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 102
	i64 2602673633151553063, ; 67: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2612152650457191105, ; 68: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 72
	i64 2624866290265602282, ; 69: mscorlib.dll => 0x246d65fbde2db8ea => 209
	i64 2632269733008246987, ; 70: System.Net.NameResolution => 0x2487b36034f808cb => 163
	i64 2656907746661064104, ; 71: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 58
	i64 2662981627730767622, ; 72: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2706075432581334785, ; 73: System.Net.WebSockets => 0x258de944be6c0701 => 173
	i64 2789714023057451704, ; 74: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 70
	i64 2812926542227278819, ; 75: Google.Apis.Core.dll => 0x270985c960b98be3 => 41
	i64 2895129759130297543, ; 76: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 2926123043691605432, ; 77: Websocket.Client.dll => 0x289bad67ac52adb8 => 101
	i64 3017704767998173186, ; 78: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 128
	i64 3122911337338800527, ; 79: Microcharts.dll => 0x2b56cf50bf1e898f => 44
	i64 3168817962471953758, ; 80: Microsoft.Extensions.Hosting.Abstractions.dll => 0x2bf9e725d304955e => 63
	i64 3243598156317504111, ; 81: XamarinUsbDriver.dll => 0x2d0393567d6ab26f => 131
	i64 3289520064315143713, ; 82: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 114
	i64 3311221304742556517, ; 83: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 174
	i64 3325875462027654285, ; 84: System.Runtime.Numerics => 0x2e27e21c8958b48d => 186
	i64 3328853167529574890, ; 85: System.Net.Sockets.dll => 0x2e327651a008c1ea => 170
	i64 3344514922410554693, ; 86: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 130
	i64 3396143930648122816, ; 87: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 60
	i64 3402534845034375023, ; 88: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 96
	i64 3429672777697402584, ; 89: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 77
	i64 3437845325506641314, ; 90: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 156
	i64 3458902357765780894, ; 91: UsbSerialForAndroid.Net.dll => 0x30007d5e4b63f59e => 100
	i64 3494946837667399002, ; 92: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 54
	i64 3508450208084372758, ; 93: System.Net.Ping => 0x30b084e02d03ad16 => 165
	i64 3522470458906976663, ; 94: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 125
	i64 3551103847008531295, ; 95: System.Private.CoreLib.dll => 0x31480e226177735f => 211
	i64 3567343442040498961, ; 96: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 97: System.Runtime.dll => 0x319037675df7e556 => 189
	i64 3638003163729360188, ; 98: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 55
	i64 3647754201059316852, ; 99: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 205
	i64 3655542548057982301, ; 100: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 54
	i64 3716579019761409177, ; 101: netstandard.dll => 0x3393f0ed5c8c5c99 => 210
	i64 3727469159507183293, ; 102: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 123
	i64 3869221888984012293, ; 103: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 64
	i64 3889433610606858880, ; 104: Microsoft.Extensions.FileProviders.Physical.dll => 0x35fa0b4301afd280 => 61
	i64 3890352374528606784, ; 105: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 75
	i64 3933965368022646939, ; 106: System.Net.Requests => 0x369840a8bfadc09b => 167
	i64 3966267475168208030, ; 107: System.Memory => 0x370b03412596249e => 160
	i64 4009997192427317104, ; 108: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 188
	i64 4056584864658557221, ; 109: Google.Apis.Auth => 0x384be27113330925 => 40
	i64 4073500526318903918, ; 110: System.Private.Xml.dll => 0x3887fb25779ae26e => 178
	i64 4084167866418059728, ; 111: Supabase.Postgrest.dll => 0x38ade10920e9d9d0 => 89
	i64 4120493066591692148, ; 112: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 113: System.ComponentModel => 0x39a7562737acb67e => 142
	i64 4168469861834746866, ; 114: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 190
	i64 4187479170553454871, ; 115: System.Linq.Expressions => 0x3a1cea1e912fa117 => 158
	i64 4205801962323029395, ; 116: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 141
	i64 4243591448627561453, ; 117: Microsoft.AspNetCore.Http.Extensions.dll => 0x3ae443f06354c3ed => 50
	i64 4250192876909962317, ; 118: Microsoft.AspNetCore.Hosting.Abstractions => 0x3afbb7e72f1d244d => 46
	i64 4356591372459378815, ; 119: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4373617458794931033, ; 120: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 157
	i64 4477672992252076438, ; 121: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 203
	i64 4672453897036726049, ; 122: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 155
	i64 4679594760078841447, ; 123: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4716677666592453464, ; 124: System.Xml.XmlSerializer => 0x417501590542f358 => 207
	i64 4794310189461587505, ; 125: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 102
	i64 4795410492532947900, ; 126: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 125
	i64 4809057822547766521, ; 127: System.Drawing => 0x42bd349c3145ecf9 => 151
	i64 4814660307502931973, ; 128: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 163
	i64 4853321196694829351, ; 129: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 185
	i64 5103417709280584325, ; 130: System.Collections.Specialized => 0x46d2fb5e161b6285 => 138
	i64 5112836352847824253, ; 131: Microsoft.AspNetCore.WebUtilities.dll => 0x46f47192ee32c57d => 52
	i64 5177565741364132164, ; 132: Microsoft.AspNetCore.Http => 0x47da689c1f3db944 => 48
	i64 5182934613077526976, ; 133: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 138
	i64 5290786973231294105, ; 134: System.Runtime.Loader => 0x496ca6b869b72699 => 185
	i64 5332349484191854038, ; 135: Syncfusion.Maui.Core.dll => 0x4a004f9a977e2dd6 => 94
	i64 5423376490970181369, ; 136: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 183
	i64 5471532531798518949, ; 137: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5507995362134886206, ; 138: System.Core.dll => 0x4c705499688c873e => 144
	i64 5522859530602327440, ; 139: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 140: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 153
	i64 5573260873512690141, ; 141: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 194
	i64 5650097808083101034, ; 142: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 191
	i64 5665389054145784248, ; 143: Google.Apis.Core => 0x4e9f815406bee9b8 => 41
	i64 5692067934154308417, ; 144: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 127
	i64 5748194408492950188, ; 145: Supabase.Storage.dll => 0x4fc5b05bfa1be2ac => 91
	i64 5979151488806146654, ; 146: System.Formats.Asn1 => 0x52fa3699a489d25e => 152
	i64 5984759512290286505, ; 147: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 192
	i64 6068057819846744445, ; 148: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6200764641006662125, ; 149: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 150: System.Text.Json.dll => 0x565a67a0ffe264a7 => 197
	i64 6284145129771520194, ; 151: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 179
	i64 6357457916754632952, ; 152: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 153: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 115
	i64 6478287442656530074, ; 154: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6504860066809920875, ; 155: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 105
	i64 6548213210057960872, ; 156: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 111
	i64 6560151584539558821, ; 157: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 67
	i64 6671798237668743565, ; 158: SkiaSharp => 0x5c96fd260152998d => 83
	i64 6724398223859243234, ; 159: Supabase.Postgrest => 0x5d51dc8ea565d8e2 => 89
	i64 6743165466166707109, ; 160: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6763861193558508191, ; 161: System.IO.Ports => 0x5dde0feb481ac29f => 97
	i64 6777482997383978746, ; 162: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 163: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 148
	i64 6814185388980153342, ; 164: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 206
	i64 6876862101832370452, ; 165: System.Xml.Linq => 0x5f6f85a57d108914 => 204
	i64 6894844156784520562, ; 166: System.Numerics.Vectors => 0x5faf683aead1ad72 => 174
	i64 6911788284027924527, ; 167: Microsoft.AspNetCore.Hosting.Server.Abstractions => 0x5feb9ad2f830f02f => 47
	i64 6934772601320367100, ; 168: Google.Api.Gax.Rest => 0x603d42f05bcfe3fc => 38
	i64 6987056692196838363, ; 169: System.Management => 0x60f7030ae3e88bdb => 98
	i64 7083547580668757502, ; 170: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 177
	i64 7220009545223068405, ; 171: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7254710547733943885, ; 172: UsbSerialForAndroid.Net => 0x64ade8ce59f6164d => 100
	i64 7270811800166795866, ; 173: System.Linq => 0x64e71ccf51a90a5a => 159
	i64 7331765743953618630, ; 174: Microsoft.AspNetCore.Http.dll => 0x65bfaa1948bba6c6 => 48
	i64 7377312882064240630, ; 175: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 141
	i64 7488575175965059935, ; 176: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 204
	i64 7489048572193775167, ; 177: System.ObjectModel => 0x67ee71ff6b419e3f => 175
	i64 7496222613193209122, ; 178: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 96
	i64 7577110251533360315, ; 179: UsbSerialForAndroid.dll => 0x69274da0e69ddcbb => 42
	i64 7592577537120840276, ; 180: System.Diagnostics.Process => 0x695e410af5b2aa54 => 147
	i64 7602111570124318452, ; 181: System.Reactive => 0x698020320025a6f4 => 99
	i64 7654504624184590948, ; 182: System.Net.Http => 0x6a3a4366801b8264 => 161
	i64 7708790323521193081, ; 183: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 184: System.Private.CoreLib => 0x6b0ff375198b9c17 => 211
	i64 7735176074855944702, ; 185: Microsoft.CSharp => 0x6b58dda848e391fe => 133
	i64 7735352534559001595, ; 186: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 129
	i64 7836164640616011524, ; 187: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 104
	i64 7868980864444657808, ; 188: Supabase.Realtime.dll => 0x6d343c679191f090 => 90
	i64 7927939710195668715, ; 189: SkiaSharp.Views.Android.dll => 0x6e05b32992ed16eb => 84
	i64 8064050204834738623, ; 190: System.Collections.dll => 0x6fe942efa61731bf => 139
	i64 8083354569033831015, ; 191: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 114
	i64 8087206902342787202, ; 192: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 146
	i64 8167236081217502503, ; 193: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 212
	i64 8185542183669246576, ; 194: System.Collections => 0x7198e33f4794aa70 => 139
	i64 8246048515196606205, ; 195: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 78
	i64 8264926008854159966, ; 196: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 147
	i64 8351079414817805247, ; 197: UsbSerialForAndroid => 0x73e4fe7b5b4ad3bf => 42
	i64 8368701292315763008, ; 198: System.Security.Cryptography => 0x7423997c6fd56140 => 194
	i64 8400357532724379117, ; 199: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 122
	i64 8410671156615598628, ; 200: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 180
	i64 8476828615142258695, ; 201: BCrypt.Net-Next => 0x75a3beb69b6bb807 => 35
	i64 8518412311883997971, ; 202: System.Collections.Immutable => 0x76377add7c28e313 => 136
	i64 8563666267364444763, ; 203: System.Private.Uri => 0x76d841191140ca5b => 176
	i64 8611142787134128904, ; 204: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 0x7780ecbdb94c0308 => 47
	i64 8614108721271900878, ; 205: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 206: Java.Interop => 0x77b654e585b55834 => 212
	i64 8638972117149407195, ; 207: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 133
	i64 8639588376636138208, ; 208: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 121
	i64 8677882282824630478, ; 209: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 210: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 146
	i64 8758604146903086415, ; 211: Supabase.Realtime => 0x798cd011086bf54f => 90
	i64 8941376889969657626, ; 212: System.Xml.XDocument => 0x7c1626e87187471a => 206
	i64 9045785047181495996, ; 213: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9312692141327339315, ; 214: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 127
	i64 9324707631942237306, ; 215: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 103
	i64 9413000421947348542, ; 216: Microsoft.AspNetCore.Hosting.Abstractions.dll => 0x82a1b202f4c6163e => 46
	i64 9427266486299436557, ; 217: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 71
	i64 9659729154652888475, ; 218: System.Text.RegularExpressions => 0x860e407c9991dd9b => 198
	i64 9678050649315576968, ; 219: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 108
	i64 9702891218465930390, ; 220: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 137
	i64 9808709177481450983, ; 221: Mono.Android.dll => 0x881f890734e555e7 => 215
	i64 9836529246295212050, ; 222: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 181
	i64 9956195530459977388, ; 223: Microsoft.Maui => 0x8a2b8315b36616ac => 76
	i64 9959489431142554298, ; 224: System.CodeDom => 0x8a3736deb7825aba => 95
	i64 9991543690424095600, ; 225: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 226: System.Net.Http.dll => 0x8b50e941206af13b => 161
	i64 10051358222726253779, ; 227: System.Private.Xml => 0x8b7d990c97ccccd3 => 178
	i64 10078727084704864206, ; 228: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 172
	i64 10092835686693276772, ; 229: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 74
	i64 10143853363526200146, ; 230: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10200072684231079950, ; 231: System.IO.Ports.dll => 0x8d8df01062c2380e => 97
	i64 10220684565739810458, ; 232: FirebaseAdmin => 0x8dd72a76063d2e9a => 36
	i64 10229024438826829339, ; 233: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 111
	i64 10236703004850800690, ; 234: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 169
	i64 10243523786148452761, ; 235: Microsoft.AspNetCore.Http.Abstractions => 0x8e284e9c69a49999 => 49
	i64 10245369515835430794, ; 236: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 180
	i64 10347464889647514442, ; 237: Supabase.Gotrue => 0x8f99947e7144434a => 88
	i64 10364469296367737616, ; 238: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 179
	i64 10406448008575299332, ; 239: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 130
	i64 10430153318873392755, ; 240: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 109
	i64 10447083246144586668, ; 241: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 53
	i64 10506226065143327199, ; 242: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10785150219063592792, ; 243: System.Net.Primitives => 0x95ac8cfb68830758 => 166
	i64 10823124638835005028, ; 244: Google.Api.Gax.dll => 0x963376840189d664 => 37
	i64 10964653383833615866, ; 245: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 149
	i64 11002576679268595294, ; 246: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 65
	i64 11009005086950030778, ; 247: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 76
	i64 11023048688141570732, ; 248: System.Core => 0x98f9bc61168392ac => 144
	i64 11050168729868392624, ; 249: Microsoft.AspNetCore.Http.Features => 0x995a15e9dbef58b0 => 51
	i64 11103970607964515343, ; 250: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 251: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 126
	i64 11220793807500858938, ; 252: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 253: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 67
	i64 11340910727871153756, ; 254: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 110
	i64 11347436699239206956, ; 255: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 207
	i64 11446671985764974897, ; 256: Mono.Android.Export => 0x9edabf8623efc131 => 213
	i64 11485890710487134646, ; 257: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 184
	i64 11490187920715478288, ; 258: Syncfusion.Maui.Charts.dll => 0x9f75590948baf510 => 93
	i64 11517440453979132662, ; 259: Microsoft.IdentityModel.Abstractions.dll => 0x9fd62b122523d2f6 => 69
	i64 11518296021396496455, ; 260: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 261: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 126
	i64 11530571088791430846, ; 262: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 64
	i64 11597940890313164233, ; 263: netstandard => 0xa0f429ca8d1805c9 => 210
	i64 11705530742807338875, ; 264: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11868377108928577036, ; 265: MimeMapping.dll => 0xa4b4f2196610be0c => 80
	i64 12040886584167504988, ; 266: System.Net.ServicePoint => 0xa719d28d8e121c5c => 169
	i64 12048689113179125827, ; 267: Microsoft.Extensions.FileProviders.Physical => 0xa7358ae968287843 => 61
	i64 12058074296353848905, ; 268: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 62
	i64 12102847907131387746, ; 269: System.Buffers => 0xa7f5f40c43256f62 => 134
	i64 12145679461940342714, ; 270: System.Text.Json => 0xa88e1f1ebcb62fba => 197
	i64 12201331334810686224, ; 271: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 188
	i64 12269460666702402136, ; 272: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 136
	i64 12437742355241350664, ; 273: Google.Apis.dll => 0xac9bbcc62bfdb608 => 39
	i64 12439275739440478309, ; 274: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 70
	i64 12451044538927396471, ; 275: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 113
	i64 12466513435562512481, ; 276: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 118
	i64 12475113361194491050, ; 277: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 278: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 148
	i64 12538491095302438457, ; 279: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 106
	i64 12550732019250633519, ; 280: System.IO.Compression => 0xae2d28465e8e1b2f => 154
	i64 12592638192531389988, ; 281: SmartTempMonApp => 0xaec209b7aad9be24 => 132
	i64 12681088699309157496, ; 282: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 283: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 107
	i64 12708922737231849740, ; 284: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 195
	i64 12722065664929968482, ; 285: Google.Api.Gax.Rest.dll => 0xb08ddb515f583162 => 38
	i64 12808066478489537992, ; 286: Websocket.Client => 0xb1bf649a25f50dc8 => 101
	i64 12823819093633476069, ; 287: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12835242264250840079, ; 288: System.IO.Pipes => 0xb21ff0d5d6c0740f => 157
	i64 12843321153144804894, ; 289: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 68
	i64 12859557719246324186, ; 290: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 171
	i64 12888876061296924636, ; 291: Supabase.Core.dll => 0xb2de7c7d53a397dc => 86
	i64 12958614573187252691, ; 292: Google.Apis => 0xb3d63f4bf006c1d3 => 39
	i64 13068258254871114833, ; 293: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 187
	i64 13221551921002590604, ; 294: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 295: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13310112861600168646, ; 296: Supabase.Storage => 0xb8b70520ac093ac6 => 91
	i64 13343850469010654401, ; 297: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 214
	i64 13381594904270902445, ; 298: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13403416310143541304, ; 299: Microcharts.Droid => 0xba02801ea6c86038 => 43
	i64 13404984788036896679, ; 300: Microsoft.AspNetCore.Http.Abstractions.dll => 0xba0812a45e7447a7 => 49
	i64 13465488254036897740, ; 301: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 129
	i64 13467053111158216594, ; 302: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 303: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 304: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13550417756503177631, ; 305: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 60
	i64 13572454107664307259, ; 306: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 123
	i64 13717397318615465333, ; 307: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 140
	i64 13755568601956062840, ; 308: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13782512541859110153, ; 309: Google.Apis.Auth.dll => 0xbf45522249e0dd09 => 40
	i64 13814445057219246765, ; 310: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 311: System.Console.dll => 0xc0a5f3cade5c6774 => 143
	i64 13921917134693230900, ; 312: Microsoft.AspNetCore.WebUtilities => 0xc13495df5dd06934 => 52
	i64 13959074834287824816, ; 313: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 113
	i64 13970307180132182141, ; 314: Syncfusion.Licensing => 0xc1e0805ccade287d => 92
	i64 14100563506285742564, ; 315: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 316: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 106
	i64 14125464355221830302, ; 317: System.Threading.dll => 0xc407bafdbc707a9e => 202
	i64 14254574811015963973, ; 318: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 195
	i64 14327709162229390963, ; 319: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 193
	i64 14346402571976470310, ; 320: System.Net.Ping.dll => 0xc718a920f3686f26 => 165
	i64 14438260825521943376, ; 321: RestSharp.dll => 0xc85f01b93fac7350 => 82
	i64 14461014870687870182, ; 322: System.Net.Requests.dll => 0xc8afd8683afdece6 => 167
	i64 14464374589798375073, ; 323: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 324: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14538127318538747197, ; 325: Syncfusion.Licensing.dll => 0xc9c1cdc518e77d3d => 92
	i64 14551742072151931844, ; 326: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 196
	i64 14561513370130550166, ; 327: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 192
	i64 14622043554576106986, ; 328: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 187
	i64 14625816794512409936, ; 329: Supabase.Gotrue.dll => 0xcaf956e23adac550 => 88
	i64 14669215534098758659, ; 330: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 58
	i64 14690985099581930927, ; 331: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 203
	i64 14705122255218365489, ; 332: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 333: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14744453227118192070, ; 334: MimeMapping => 0xcc9ed21731bde5c6 => 80
	i64 14832630590065248058, ; 335: System.Security.Claims => 0xcdd816ef5d6e873a => 190
	i64 14852515768018889994, ; 336: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 110
	i64 14892012299694389861, ; 337: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 338: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 339: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 59
	i64 14984936317414011727, ; 340: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 171
	i64 14987728460634540364, ; 341: System.IO.Compression.dll => 0xcfff1ba06622494c => 154
	i64 15015154896917945444, ; 342: System.Net.Security.dll => 0xd0608bd33642dc64 => 168
	i64 15076659072870671916, ; 343: System.ObjectModel.dll => 0xd13b0d8c1620662c => 175
	i64 15111608613780139878, ; 344: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 345: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 153
	i64 15133485256822086103, ; 346: System.Linq.dll => 0xd204f0a9127dd9d7 => 159
	i64 15138356091203993725, ; 347: Microsoft.IdentityModel.Abstractions => 0xd2163ea89395c07d => 69
	i64 15154054061132759083, ; 348: Supabase => 0xd24e03e104e2402b => 85
	i64 15227001540531775957, ; 349: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 55
	i64 15370334346939861994, ; 350: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 109
	i64 15391712275433856905, ; 351: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 59
	i64 15527772828719725935, ; 352: System.Console => 0xd77dbb1e38cd3d6f => 143
	i64 15530465045505749832, ; 353: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 162
	i64 15536481058354060254, ; 354: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15541854775306130054, ; 355: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 193
	i64 15557562860424774966, ; 356: System.Net.Sockets => 0xd7e790fe7a6dc536 => 170
	i64 15565247197164990907, ; 357: Microsoft.AspNetCore.Http.Extensions => 0xd802dddb8c29f1bb => 50
	i64 15582737692548360875, ; 358: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 117
	i64 15609085926864131306, ; 359: System.dll => 0xd89e9cf3334914ea => 208
	i64 15661133872274321916, ; 360: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 205
	i64 15664356999916475676, ; 361: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15740194843642038038, ; 362: Microsoft.AspNetCore.Hosting.dll => 0xda7067d0aeb80716 => 45
	i64 15743187114543869802, ; 363: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15745825835632158716, ; 364: Syncfusion.Maui.Core => 0xda84692c2c05e7fc => 94
	i64 15783653065526199428, ; 365: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15787731167047084694, ; 366: Syncfusion.Maui.Charts => 0xdb1949d975346a96 => 93
	i64 15847085070278954535, ; 367: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 199
	i64 15852824340364052161, ; 368: Microsoft.AspNetCore.Http.Features.dll => 0xdc008bbee610c6c1 => 51
	i64 15915482068648965105, ; 369: Microsoft.Extensions.Configuration.EnvironmentVariables => 0xdcdf269e1aebb3f1 => 56
	i64 15959458866502526117, ; 370: Microsoft.Extensions.Configuration.EnvironmentVariables.dll => 0xdd7b6348415764a5 => 56
	i64 15963349826457351533, ; 371: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 200
	i64 16018552496348375205, ; 372: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 164
	i64 16046481083542319511, ; 373: Microsoft.Extensions.ObjectPool => 0xdeb08d870f90b197 => 66
	i64 16096046022795562262, ; 374: Microsoft.AspNetCore.Hosting => 0xdf60a493c5118d16 => 45
	i64 16154507427712707110, ; 375: System => 0xe03056ea4e39aa26 => 208
	i64 16219561732052121626, ; 376: System.Net.Security => 0xe1177575db7c781a => 168
	i64 16288847719894691167, ; 377: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 378: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 65
	i64 16324796876805858114, ; 379: SkiaSharp.dll => 0xe28d5444586b6342 => 83
	i64 16454459195343277943, ; 380: System.Net.NetworkInformation => 0xe459fb756d988f77 => 164
	i64 16496768397145114574, ; 381: Mono.Android.Export.dll => 0xe4f04b741db987ce => 213
	i64 16649148416072044166, ; 382: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 78
	i64 16677317093839702854, ; 383: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 122
	i64 16833383113903931215, ; 384: mscorlib => 0xe99c30c1484d7f4f => 209
	i64 16856067890322379635, ; 385: System.Data.Common.dll => 0xe9ecc87060889373 => 145
	i64 16890310621557459193, ; 386: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 198
	i64 16942731696432749159, ; 387: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16955525858597485057, ; 388: Google.Api.Gax => 0xeb4e20ef25a73a01 => 37
	i64 16998075588627545693, ; 389: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 120
	i64 17008137082415910100, ; 390: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 137
	i64 17031351772568316411, ; 391: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 119
	i64 17047433665992082296, ; 392: Microsoft.Extensions.Configuration.FileExtensions => 0xec94a699197e4378 => 57
	i64 17062143951396181894, ; 393: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 140
	i64 17089008752050867324, ; 394: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17118171214553292978, ; 395: System.Threading.Channels => 0xed8ff6060fc420b2 => 199
	i64 17126545051278881272, ; 396: Microsoft.Net.Http.Headers.dll => 0xedadb5fbdb33b1f8 => 79
	i64 17137864900836977098, ; 397: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 72
	i64 17151170952569239713, ; 398: RestSharp => 0xee05331c4de338a1 => 82
	i64 17205988430934219272, ; 399: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 62
	i64 17230721278011714856, ; 400: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 177
	i64 17260702271250283638, ; 401: System.Data.Common => 0xef8a5543bba6bc76 => 145
	i64 17333249706306540043, ; 402: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 149
	i64 17338386382517543202, ; 403: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 172
	i64 17342750010158924305, ; 404: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17438153253682247751, ; 405: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17509662556995089465, ; 406: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 173
	i64 17514990004910432069, ; 407: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17576078694130054946, ; 408: Supabase.dll => 0xf3eac67343eef722 => 85
	i64 17608862831326185980, ; 409: Microsoft.IO.RecyclableMemoryStream.dll => 0xf45f3f7307c6c9fc => 73
	i64 17623389608345532001, ; 410: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17671790519499593115, ; 411: SkiaSharp.Views.Android => 0xf53ecfd92be3959b => 84
	i64 17702523067201099846, ; 412: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 413: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 118
	i64 17710060891934109755, ; 414: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 116
	i64 17712670374920797664, ; 415: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 184
	i64 17743407583038752114, ; 416: System.CodeDom.dll => 0xf63d3f302bff4572 => 95
	i64 17777860260071588075, ; 417: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 186
	i64 17790600151040787804, ; 418: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 71
	i64 17838668724098252521, ; 419: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 134
	i64 17911643751311784505, ; 420: Microsoft.Net.Http.Headers => 0xf892f1178448ba39 => 79
	i64 17958341848870185232, ; 421: Microsoft.IO.RecyclableMemoryStream => 0xf938d8c3a0f06910 => 73
	i64 18025913125965088385, ; 422: System.Threading => 0xfa28e87b91334681 => 202
	i64 18099568558057551825, ; 423: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18099689198537119569, ; 424: Supabase.Functions => 0xfb2f036e07c79751 => 87
	i64 18121036031235206392, ; 425: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 119
	i64 18146411883821974900, ; 426: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 152
	i64 18226465428055663763, ; 427: Supabase.Core => 0xfcf169bd26322493 => 86
	i64 18245806341561545090, ; 428: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 135
	i64 18305135509493619199, ; 429: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 121
	i64 18324163916253801303, ; 430: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18439108438687598470 ; 431: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 181
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [432 x i32] [
	i32 68, ; 0
	i32 215, ; 1
	i32 77, ; 2
	i32 63, ; 3
	i32 43, ; 4
	i32 158, ; 5
	i32 107, ; 6
	i32 124, ; 7
	i32 132, ; 8
	i32 99, ; 9
	i32 98, ; 10
	i32 66, ; 11
	i32 7, ; 12
	i32 182, ; 13
	i32 57, ; 14
	i32 36, ; 15
	i32 201, ; 16
	i32 142, ; 17
	i32 10, ; 18
	i32 112, ; 19
	i32 182, ; 20
	i32 128, ; 21
	i32 18, ; 22
	i32 151, ; 23
	i32 120, ; 24
	i32 155, ; 25
	i32 44, ; 26
	i32 166, ; 27
	i32 74, ; 28
	i32 162, ; 29
	i32 214, ; 30
	i32 201, ; 31
	i32 16, ; 32
	i32 35, ; 33
	i32 104, ; 34
	i32 117, ; 35
	i32 81, ; 36
	i32 160, ; 37
	i32 176, ; 38
	i32 103, ; 39
	i32 183, ; 40
	i32 6, ; 41
	i32 124, ; 42
	i32 53, ; 43
	i32 150, ; 44
	i32 28, ; 45
	i32 75, ; 46
	i32 28, ; 47
	i32 191, ; 48
	i32 116, ; 49
	i32 2, ; 50
	i32 20, ; 51
	i32 200, ; 52
	i32 156, ; 53
	i32 150, ; 54
	i32 81, ; 55
	i32 87, ; 56
	i32 105, ; 57
	i32 112, ; 58
	i32 135, ; 59
	i32 24, ; 60
	i32 115, ; 61
	i32 196, ; 62
	i32 131, ; 63
	i32 108, ; 64
	i32 189, ; 65
	i32 102, ; 66
	i32 27, ; 67
	i32 72, ; 68
	i32 209, ; 69
	i32 163, ; 70
	i32 58, ; 71
	i32 2, ; 72
	i32 173, ; 73
	i32 70, ; 74
	i32 41, ; 75
	i32 7, ; 76
	i32 101, ; 77
	i32 128, ; 78
	i32 44, ; 79
	i32 63, ; 80
	i32 131, ; 81
	i32 114, ; 82
	i32 174, ; 83
	i32 186, ; 84
	i32 170, ; 85
	i32 130, ; 86
	i32 60, ; 87
	i32 96, ; 88
	i32 77, ; 89
	i32 156, ; 90
	i32 100, ; 91
	i32 54, ; 92
	i32 165, ; 93
	i32 125, ; 94
	i32 211, ; 95
	i32 22, ; 96
	i32 189, ; 97
	i32 55, ; 98
	i32 205, ; 99
	i32 54, ; 100
	i32 210, ; 101
	i32 123, ; 102
	i32 64, ; 103
	i32 61, ; 104
	i32 75, ; 105
	i32 167, ; 106
	i32 160, ; 107
	i32 188, ; 108
	i32 40, ; 109
	i32 178, ; 110
	i32 89, ; 111
	i32 33, ; 112
	i32 142, ; 113
	i32 190, ; 114
	i32 158, ; 115
	i32 141, ; 116
	i32 50, ; 117
	i32 46, ; 118
	i32 30, ; 119
	i32 157, ; 120
	i32 203, ; 121
	i32 155, ; 122
	i32 0, ; 123
	i32 207, ; 124
	i32 102, ; 125
	i32 125, ; 126
	i32 151, ; 127
	i32 163, ; 128
	i32 185, ; 129
	i32 138, ; 130
	i32 52, ; 131
	i32 48, ; 132
	i32 138, ; 133
	i32 185, ; 134
	i32 94, ; 135
	i32 183, ; 136
	i32 26, ; 137
	i32 144, ; 138
	i32 29, ; 139
	i32 153, ; 140
	i32 194, ; 141
	i32 191, ; 142
	i32 41, ; 143
	i32 127, ; 144
	i32 91, ; 145
	i32 152, ; 146
	i32 192, ; 147
	i32 23, ; 148
	i32 23, ; 149
	i32 197, ; 150
	i32 179, ; 151
	i32 34, ; 152
	i32 115, ; 153
	i32 11, ; 154
	i32 105, ; 155
	i32 111, ; 156
	i32 67, ; 157
	i32 83, ; 158
	i32 89, ; 159
	i32 19, ; 160
	i32 97, ; 161
	i32 22, ; 162
	i32 148, ; 163
	i32 206, ; 164
	i32 204, ; 165
	i32 174, ; 166
	i32 47, ; 167
	i32 38, ; 168
	i32 98, ; 169
	i32 177, ; 170
	i32 26, ; 171
	i32 100, ; 172
	i32 159, ; 173
	i32 48, ; 174
	i32 141, ; 175
	i32 204, ; 176
	i32 175, ; 177
	i32 96, ; 178
	i32 42, ; 179
	i32 147, ; 180
	i32 99, ; 181
	i32 161, ; 182
	i32 17, ; 183
	i32 211, ; 184
	i32 133, ; 185
	i32 129, ; 186
	i32 104, ; 187
	i32 90, ; 188
	i32 84, ; 189
	i32 139, ; 190
	i32 114, ; 191
	i32 146, ; 192
	i32 212, ; 193
	i32 139, ; 194
	i32 78, ; 195
	i32 147, ; 196
	i32 42, ; 197
	i32 194, ; 198
	i32 122, ; 199
	i32 180, ; 200
	i32 35, ; 201
	i32 136, ; 202
	i32 176, ; 203
	i32 47, ; 204
	i32 21, ; 205
	i32 212, ; 206
	i32 133, ; 207
	i32 121, ; 208
	i32 21, ; 209
	i32 146, ; 210
	i32 90, ; 211
	i32 206, ; 212
	i32 31, ; 213
	i32 127, ; 214
	i32 103, ; 215
	i32 46, ; 216
	i32 71, ; 217
	i32 198, ; 218
	i32 108, ; 219
	i32 137, ; 220
	i32 215, ; 221
	i32 181, ; 222
	i32 76, ; 223
	i32 95, ; 224
	i32 6, ; 225
	i32 161, ; 226
	i32 178, ; 227
	i32 172, ; 228
	i32 74, ; 229
	i32 3, ; 230
	i32 97, ; 231
	i32 36, ; 232
	i32 111, ; 233
	i32 169, ; 234
	i32 49, ; 235
	i32 180, ; 236
	i32 88, ; 237
	i32 179, ; 238
	i32 130, ; 239
	i32 109, ; 240
	i32 53, ; 241
	i32 1, ; 242
	i32 166, ; 243
	i32 37, ; 244
	i32 149, ; 245
	i32 65, ; 246
	i32 76, ; 247
	i32 144, ; 248
	i32 51, ; 249
	i32 12, ; 250
	i32 126, ; 251
	i32 15, ; 252
	i32 67, ; 253
	i32 110, ; 254
	i32 207, ; 255
	i32 213, ; 256
	i32 184, ; 257
	i32 93, ; 258
	i32 69, ; 259
	i32 13, ; 260
	i32 126, ; 261
	i32 64, ; 262
	i32 210, ; 263
	i32 9, ; 264
	i32 80, ; 265
	i32 169, ; 266
	i32 61, ; 267
	i32 62, ; 268
	i32 134, ; 269
	i32 197, ; 270
	i32 188, ; 271
	i32 136, ; 272
	i32 39, ; 273
	i32 70, ; 274
	i32 113, ; 275
	i32 118, ; 276
	i32 34, ; 277
	i32 148, ; 278
	i32 106, ; 279
	i32 154, ; 280
	i32 132, ; 281
	i32 14, ; 282
	i32 107, ; 283
	i32 195, ; 284
	i32 38, ; 285
	i32 101, ; 286
	i32 27, ; 287
	i32 157, ; 288
	i32 68, ; 289
	i32 171, ; 290
	i32 86, ; 291
	i32 39, ; 292
	i32 187, ; 293
	i32 1, ; 294
	i32 15, ; 295
	i32 91, ; 296
	i32 214, ; 297
	i32 9, ; 298
	i32 43, ; 299
	i32 49, ; 300
	i32 129, ; 301
	i32 29, ; 302
	i32 30, ; 303
	i32 13, ; 304
	i32 60, ; 305
	i32 123, ; 306
	i32 140, ; 307
	i32 8, ; 308
	i32 40, ; 309
	i32 11, ; 310
	i32 143, ; 311
	i32 52, ; 312
	i32 113, ; 313
	i32 92, ; 314
	i32 3, ; 315
	i32 106, ; 316
	i32 202, ; 317
	i32 195, ; 318
	i32 193, ; 319
	i32 165, ; 320
	i32 82, ; 321
	i32 167, ; 322
	i32 24, ; 323
	i32 5, ; 324
	i32 92, ; 325
	i32 196, ; 326
	i32 192, ; 327
	i32 187, ; 328
	i32 88, ; 329
	i32 58, ; 330
	i32 203, ; 331
	i32 16, ; 332
	i32 32, ; 333
	i32 80, ; 334
	i32 190, ; 335
	i32 110, ; 336
	i32 33, ; 337
	i32 0, ; 338
	i32 59, ; 339
	i32 171, ; 340
	i32 154, ; 341
	i32 168, ; 342
	i32 175, ; 343
	i32 17, ; 344
	i32 153, ; 345
	i32 159, ; 346
	i32 69, ; 347
	i32 85, ; 348
	i32 55, ; 349
	i32 109, ; 350
	i32 59, ; 351
	i32 143, ; 352
	i32 162, ; 353
	i32 4, ; 354
	i32 193, ; 355
	i32 170, ; 356
	i32 50, ; 357
	i32 117, ; 358
	i32 208, ; 359
	i32 205, ; 360
	i32 4, ; 361
	i32 45, ; 362
	i32 12, ; 363
	i32 94, ; 364
	i32 5, ; 365
	i32 93, ; 366
	i32 199, ; 367
	i32 51, ; 368
	i32 56, ; 369
	i32 56, ; 370
	i32 200, ; 371
	i32 164, ; 372
	i32 66, ; 373
	i32 45, ; 374
	i32 208, ; 375
	i32 168, ; 376
	i32 18, ; 377
	i32 65, ; 378
	i32 83, ; 379
	i32 164, ; 380
	i32 213, ; 381
	i32 78, ; 382
	i32 122, ; 383
	i32 209, ; 384
	i32 145, ; 385
	i32 198, ; 386
	i32 25, ; 387
	i32 37, ; 388
	i32 120, ; 389
	i32 137, ; 390
	i32 119, ; 391
	i32 57, ; 392
	i32 140, ; 393
	i32 32, ; 394
	i32 199, ; 395
	i32 79, ; 396
	i32 72, ; 397
	i32 82, ; 398
	i32 62, ; 399
	i32 177, ; 400
	i32 145, ; 401
	i32 149, ; 402
	i32 172, ; 403
	i32 10, ; 404
	i32 25, ; 405
	i32 173, ; 406
	i32 8, ; 407
	i32 85, ; 408
	i32 73, ; 409
	i32 20, ; 410
	i32 84, ; 411
	i32 31, ; 412
	i32 118, ; 413
	i32 116, ; 414
	i32 184, ; 415
	i32 95, ; 416
	i32 186, ; 417
	i32 71, ; 418
	i32 134, ; 419
	i32 79, ; 420
	i32 73, ; 421
	i32 202, ; 422
	i32 19, ; 423
	i32 87, ; 424
	i32 119, ; 425
	i32 152, ; 426
	i32 86, ; 427
	i32 135, ; 428
	i32 121, ; 429
	i32 14, ; 430
	i32 181 ; 431
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ cdb777a0c306e3e0668f847433f82144d7ca745f"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
