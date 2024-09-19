//
// import 'package:flutter/material.dart';
//
// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:trashbuddy/CONSTANT/Colors.dart';
// import 'package:trashbuddy/USER/login.dart';
//
// import '../PROVIDER/loginProvider.dart';
// import '../PROVIDER/mainProvider.dart';
//
// // class SplashPage extends StatelessWidget {
// //   const SplashPage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var width = MediaQuery.of(context).size.width;
// //     var height = MediaQuery.of(context).size.height;
// //     return SafeArea(
// //       child: Scaffold(
// // backgroundColor: brown3,
// //       body: Column(crossAxisAlignment: CrossAxisAlignment.start,
// // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Center(
// //               child: Padding(
// //                 padding: const EdgeInsets.only(top: 180),
// //                 child: Image(
// //                   image: AssetImage("assets/img.png",),
// //                     height:300,width: 300,
// //                 ),
// //               ),
// //             ),
// //         ],
// //       ),
// //       ),
// //     );
// //   }
// // }
//
//
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//
//     // print("codee id here");
//
//     Timer? _timer;
//     final FirebaseFirestore db = FirebaseFirestore.instance;
//     String type= '';
//
//     FirebaseAuth auth = FirebaseAuth.instance;
//     var loginUser = auth.currentUser;
//
//     super.initState();
//
//     loginprovider loginProvider = Provider.of<loginprovider>(context, listen: false);
//     mainProvider mainProv = Provider.of<mainProvider>(context, listen: false);
//
//
//
//     Timer(const Duration(seconds: 3), () {
//       if (loginUser == null) {
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
//       }
//       else {
//         loginProvider.userAuthorized(loginUser.phoneNumber, context);
//       }
//     });
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     mainProvider provider = Provider.of<mainProvider>(context, listen: true);
//
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle(
//         statusBarColor: const Color(0xfffff1e2),
//         systemNavigationBarColor: Color(0xfffff1e2),
//         statusBarIconBrightness: Brightness.dark,
//         systemNavigationBarIconBrightness: Brightness.dark,
//         systemNavigationBarContrastEnforced: true,
//         systemStatusBarContrastEnforced: true,
//       ),
//       child: Scaffold(
//         backgroundColor: green1,
//         body: Center(child: Image.asset("assets/img.png",scale: 2,)),
//
//       ),
//     );
//   }
// }
//
// // import 'dart:async';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:provider/provider.dart';
// // import 'package:trashbuddy/USER/login.dart';
// //
// //
// // import '../PROVIDER/loginprovider.dart';
// // import '../PROVIDER/mainProvider.dart';
// //
// //
// // class SplashScreen extends StatefulWidget {
// //   const SplashScreen({super.key});
// //
// //   @override
// //   State<SplashScreen> createState() => _SplashScreenState();
// // }
// //
// // class _SplashScreenState extends State<SplashScreen> {
// //   @override
// //   void initState() {
// //
// //     // print("codee id here");
// //
// //     Timer? _timer;
// //     final FirebaseFirestore db = FirebaseFirestore.instance;
// //     String type= '';
// //
// //     FirebaseAuth auth = FirebaseAuth.instance;
// //     var loginUser = auth.currentUser;
// //
// //     super.initState();
// //
// //     loginprovider loginProvider = Provider.of<loginprovider>(context, listen: false);
// //     mainProvider mainProv = Provider.of<mainProvider>(context, listen: false);
// //
// //
// //
// //     Timer(const Duration(seconds: 3), () {
// //       if (loginUser == null) {
// //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
// //       }
// //       else {
// //         loginProvider.userAuthorized(loginUser.phoneNumber, context);
// //       }
// //     });
// //
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     mainProvider provider = Provider.of<mainProvider>(context, listen: true);
// //
// //     return AnnotatedRegion<SystemUiOverlayStyle>(
// //       value: SystemUiOverlayStyle(
// //         statusBarColor: const Color(0xfffff1e2),
// //         systemNavigationBarColor: Color(0xfffff1e2),
// //         statusBarIconBrightness: Brightness.dark,
// //         systemNavigationBarIconBrightness: Brightness.dark,
// //         systemNavigationBarContrastEnforced: true,
// //         systemStatusBarContrastEnforced: true,
// //       ),
// //       child: Scaffold(
// //         backgroundColor: Color(0xFFFEF1E2),
// //         body: Center(child: Image.asset("assets/SplashImage.png",scale: 4.5,)),
// //
// //       ),
// //     );
// //   }
// // }

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/PROVIDER/LoginProvidernew.dart';
import 'package:trashbuddy/PROVIDER/mainProvider.dart';
import 'package:trashbuddy/USER/login.dart';

import '../CONSTANT/Colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Initialize FirebaseAuth and Firestore instances
    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;

    // Get instances of providers
    LoginProviderNew loginProvider = Provider.of<LoginProviderNew>(context, listen: false);
    // mainProvider mProvider = Provider.of<mainProvider>(context, listen: false);

    // Start a timer to navigate after 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (loginUser == null) {
        // Navigate to login page if the user is not logged in
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        // Check if loginUser.phoneNumber is not null before calling userAuthorized
        final phoneNumber = loginUser.phoneNumber;
        if (phoneNumber != null) {
          loginProvider.userAuthorized(phoneNumber, context);
        } else {
          // Handle the case where phoneNumber is null
          print("Error: Phone number is null.");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  green1,
      body: Center(child: Image.asset('assets/img.png', scale: 3)),
    );
  }
}
