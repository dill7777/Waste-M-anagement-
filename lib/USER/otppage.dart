import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import '../PROVIDER/LoginProvidernew.dart';
import 'Splash2.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget btn(Color myColor, String text, Color textmycolor, double width,
        double height, double fonsize, FontWeight fntw) {
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
                    fontSize: fonsize, fontWeight: fntw, color: textmycolor),
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
              height: 40,
            ),
            Text(
              " Enter OTP ",
              style: TextStyle(
                  color: green2,
                  fontSize: 18,
                  fontFamily: "kadwa",
                  fontWeight: FontWeight.w200),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Consumer<LoginProviderNew>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Pinput(
                      controller: value.otpverifycontroller,
                      length: 6,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      defaultPinTheme: PinTheme(
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.transparent,
                              blurRadius: 2.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 2,
                            color: Color(0xFF6B526B),
                          ),
                        ),
                      ),
                      onCompleted: (pin) {
                        print("OTP completed");
                        value.verify(context);
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Resend OTP in: 30 sec",
              style: TextStyle(
                fontSize: 15,
                color: green2,
              ),
            )
          ],
        ),
      ),
    );
  }
}