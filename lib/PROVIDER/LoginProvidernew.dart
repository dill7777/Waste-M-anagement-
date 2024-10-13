import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
 import 'package:trashbuddy/ADMIN/AdminHome.dart';
import 'package:trashbuddy/USER/otppage.dart';

 import '../USER/bottomnavigation.dart';

class LoginProviderNew extends ChangeNotifier {
  TextEditingController Loginphnnumber = TextEditingController();
  TextEditingController otpverifycontroller = TextEditingController();

  String VerificationId = "";

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  void clearLoginPageNumber() {
    Loginphnnumber.clear();
    otpverifycontroller.clear();
  }

  bool loader = false;
  void sendotp(BuildContext context) async {
    loader = true;
    notifyListeners();
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${Loginphnnumber.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white,
          content: Text("Verification Completed",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              )),
          duration: Duration(milliseconds: 3000),
        ));
        if (kDebugMode) {}
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Sorry, Verification Failed"),
            duration: Duration(milliseconds: 3000),
          ));
          if (kDebugMode) {}
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        loader = false;
        notifyListeners();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OtpPage(),
            ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xbd380038),
          content: Text("OTP sent to phone successfully",
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
          duration: Duration(milliseconds: 3000),
        ));
        // Loginphnnumber.clear();
        log("Verification Id : $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  void verify(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpverifycontroller.text);
    await auth.signInWithCredential(credential).then((value) {
      final user = value.user;
      if (user != null) {
        print("aaaccc");

        userAuthorized(user.phoneNumber, context);
      } else {
        print("gfgffg");
        if (kDebugMode) {}
      }
    });
  }

  Future<void> userAuthorized(String? phoneNumber, BuildContext context) async {
    print("fffffsssss");
    String loginUsername = '';
    String loginUsertype = '';
    String loginUserid = '';
    String productid = '';
    String userId = '';
    String loginphno = "";

    try {
      var phone = phoneNumber!;
      print(phoneNumber.toString() + "duudud");
      db
          .collection("USERS")
          .where("User_Number", isEqualTo: phone)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          print("fiifuif");
          for (var element in value.docs) {
            Map<dynamic, dynamic> map = element.data();
            loginUsername = map['User_Name'].toString();
            loginUsertype = map['Type'].toString();
            loginphno = map["User_Number"].toString();
            loginUserid = element.id;
            userId = map["User_Id"].toString();
            String uid = userId;
            if (loginUsertype == "ADMIN") {
              print("cb bcb");
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminHome(),
                  ));
            } else {
              print("mxnxn");

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavigation(
                    userId: uid,
                    username: loginUsername,
                    userNumber: '',
                    loginPhno: '',
                  ),
                ),
              );
              // db.collection("CUSTOMERS").doc(element.id).get().then((valueee){
              //   if(valueee.exists){
              //     print("cxcjjjc"+valueee.id);
              //     Map<dynamic, dynamic> customerMap = valueee.data() as Map;
              //     loginPhoto= customerMap["PHOTO"].toString();
              //     print("dkdkdd");
              //
              //
              //   }
              // });
            }
          }
        } else {
          const snackBar = SnackBar(
              backgroundColor: Colors.white,
              duration: Duration(milliseconds: 3000),
              content: Text(
                "Sorry , You don't have any access",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    } catch (e) {
      // const snackBar = SnackBar(
      //     backgroundColor: Colors.white,
      //     duration: Duration(milliseconds: 3000),
      //     content: Text("Sorry , Some Error Occurred",
      //       textAlign: TextAlign.center,
      //       softWrap: true,
      //       style: TextStyle(
      //           fontSize: 18,
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold),
      //     ));
      // ScaffoldMessenger.of(context).show
      // SnackBar(snackBar);
    }
  }
  // Future<void> userAuthorized(String? phoneNumber, BuildContext context) async {
  //   if (phoneNumber == null) {
  //     const snackBar = SnackBar(
  //         backgroundColor: Colors.white,
  //         duration: Duration(milliseconds: 3000),
  //         content: Text(
  //           "Phone number is required",
  //           textAlign: TextAlign.center,
  //           softWrap: true,
  //           style: TextStyle(
  //               fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
  //         ));
  //
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     return;
  //   }
  //
  //   print("Starting user authorization process...");
  //
  //   String Username = '';
  //   String loginUsertype = '';
  //   String loginUserid = '';
  //   String userId = '';
  //
  //
  //   try {
  //     print("Checking phone number: $phoneNumber");
  //     var value = await db.collection("USERS").where("User_Number", isEqualTo: phoneNumber).get();
  //
  //     if (value.docs.isNotEmpty) {
  //       print("User found");
  //       for (var element in value.docs) {
  //         Map<dynamic, dynamic> map = element.data();
  //         Username = map['User_Name'].toString();
  //         loginUsertype = map['Type'].toString();
  //         loginUserid = element.id;
  //         userId = map["User_Id"].toString();
  //         if (loginUsertype == "ADMIN") {
  //           print("Navigating to Admin Home...");
  //           Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(builder: (context) => AdminHome()),
  //           );
  //         } else {
  //           print("Navigating to User Home...");
  //           Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(builder: (context) => bottomnavigation(userId: '', Username: '',)),
  //           );
  //         }
  //       }
  //     } else {
  //       const snackBar = SnackBar(
  //           backgroundColor: Colors.white,
  //           duration: Duration(milliseconds: 3000),
  //           content: Text(
  //             "Sorry, you don't have any access",
  //             textAlign: TextAlign.center,
  //             softWrap: true,
  //             style: TextStyle(
  //                 fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
  //           ));
  //
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     }
  //   } catch (e) {
  //     const snackBar = SnackBar(
  //         backgroundColor: Colors.white,
  //         duration: Duration(milliseconds: 3000),
  //         content: Text(
  //           "Sorry, an error occurred",
  //           textAlign: TextAlign.center,
  //           softWrap: true,
  //           style: TextStyle(
  //               fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
  //         ));
  //
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     print("Error during user authorization: $e");
  //   }
  // }
}
