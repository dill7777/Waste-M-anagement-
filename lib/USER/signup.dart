import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';

import '../PROVIDER/mainProvider.dart';
import 'login.dart';

class CreateAc extends StatelessWidget {
  const CreateAc({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Mainprovider(),
      builder: (context, child) {
        return _buildScaffold(context);
      },
    );
  }

  Widget _buildScaffold(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var provider = Provider.of<Mainprovider>(context);

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
            SizedBox(height: 20),
            Text(
              "Login To Your Account",
              style: TextStyle(
                  color: green2,
                  fontSize: 20,
                  fontFamily: "kadwa",
                  fontWeight: FontWeight.w200),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: provider.usernameController,
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsetsDirectional.symmetric(horizontal: 108),
                  hintText: "User Name",
                  hintStyle: TextStyle(
                    fontFamily: "chenla",
                    color: green2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: provider.usernumberController,
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsetsDirectional.symmetric(horizontal: 95),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(
                    fontFamily: "chenla",
                    color: green2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Consumer<Mainprovider>(
              builder: (context,value,child) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                    value.addUser();
                  },
                    child: btn(green2, "Create", Colors.white, 110, 48, 18, FontWeight.w500));
              }
            ),
            SizedBox(height: 65),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Row(
                children: [
                  Text("Already have an account ? ",
                      style: TextStyle(color: green2, fontSize: 15)),
                  Text(
                    "Login",
                    style: TextStyle(
                        color: green2,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
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