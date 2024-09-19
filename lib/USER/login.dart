import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/USER/signup.dart';

import '../PROVIDER/LoginProvidernew.dart';
import 'otppage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget btn(Color myColor, String text, Color textmycolor, double width,double height,double fonsize,FontWeight fntw) {
      return Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: myColor,
          ),
          child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: fonsize, fontWeight:fntw, color: textmycolor),
              )),
        ),
      );
    }

    return Scaffold(
      backgroundColor: green1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Image(
                image: AssetImage('assets/img.png'),
                height: 100,
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Text(
              "Login To Your Account",
              style: TextStyle(color: green2, fontSize: 20, fontFamily: "kadwa",fontWeight: FontWeight.w200),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<LoginProviderNew>(
        
              builder: (context,loginValue,child) {
                return Container(
                  margin: EdgeInsets.only(left: 30,right: 30),
                  child: TextField(
                controller: loginValue.Loginphnnumber,
                    maxLines: 1,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],

                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(

                      contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 95),
                      hintText: "Phone Number",
                          hintStyle: TextStyle(
                            fontFamily: "chenla",
                            color: green2,
        
        
                          ),
                    ),
        
                                 ),
                );
              }
            ),
            SizedBox(height: 20,),
            Consumer<LoginProviderNew>(
              builder: (context,loginvalue,child) {
                return GestureDetector(
                  onTap: (){
                   loginvalue.sendotp(context);
                   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpPage()));
                   print("Dill");
                  },
                    child: btn(green2, "Get OTP", Colors.white, 110, 45, 18, FontWeight.w500));
              }
            ),
            SizedBox(height: 210,),
            Padding(
              padding: const EdgeInsets.only(left: 70,bottom: 20),
              child: Row(
                children: [
                  Text("Don't have an account ? ",style: TextStyle(
                    color: green2,fontSize: 15
                  )),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAc(),));
                    },
                    child: Text("Sign Up",style: TextStyle(
                      color: green2,
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    ),),
                  )
                ],
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
