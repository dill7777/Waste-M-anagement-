import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/USER/Splashpage.dart';

import 'ADMIN/AdminHome.dart';
import 'ADMIN/pricelist.dart';
import 'CONSTANT/Colors.dart';
import 'PROVIDER/LoginProvidernew.dart';
import 'PROVIDER/locationPro.dart';
import 'PROVIDER/mainprovider.dart';
import 'USER/Splash2.dart';
import 'USER/dateandtime.dart';
import 'USER/binlocation.dart';
import 'USER/bottomnavigation.dart';
// import 'USER/dateandtime.dart';
import 'USER/collectWaste.dart';
import 'USER/devicelocation.dart';
import 'USER/dustbinlocation.dart';
import 'USER/home.dart';
import 'USER/location.dart';
import 'USER/myOrders.dart';
import 'USER/otppage.dart';
import 'USER/pickup_confirmation.dart';
import 'USER/proceed_pickup.dart';
import 'USER/profile.dart';
import 'USER/reciept.dart';
import 'USER/signup.dart';
import 'USER/login.dart';
// ... other imports ...

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCT6InQ42CdT3s6wSNL7dg0kpfJyzgpUgg',
      appId: '1:398899871750:android:0ea0678de1f5093c824387',
      messagingSenderId: '398899871750',
      projectId: 'trash-buddy-a4d7d',
      storageBucket: "trash-buddy-a4d7d.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override



  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context1) => LocationPro()),
        ChangeNotifierProvider(create: (context) => LoginProviderNew()),
        ChangeNotifierProvider(create: (context) => Mainprovider()),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff033b18)),
          useMaterial3: true,
        ),
        // home: Profile(User_Number: '',User_Name: '',Photo: '',User_Id: '',),
        // home: LoginPage(),
        home: AdminHome(),
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => mainProvider()),
//         ChangeNotifierProvider(create: (context) => LoginProviderNew(),),
//         ChangeNotifierProvider(create: (context) => LocationProvider(),)
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: green1),
//           useMaterial3: true,
//         ),
//         home: LoginPage(),
//       ),
//     );
//   }
// }