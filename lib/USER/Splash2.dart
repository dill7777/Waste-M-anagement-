import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';

import '../PROVIDER/mainprovider.dart';
 import 'bottomnavigation.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;

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
      body: Column(
        children: [

          SizedBox(height: 100,),
          Center(child: Image(image: AssetImage("assets/img2.png"),height: 250)),
          SizedBox(height: 70,),
          Center(
            child: Text("Looking for recycling \n    Options nearby?",style: TextStyle(
              fontSize: 18,fontFamily: "kadwa",
              color: Color(0xff0A6D20)
            ),),
          ),
          
          Center(child: Icon(Icons.more_horiz_outlined,color: green2,size: 70,)),
          SizedBox(height: 5,),
          Consumer<Mainprovider>(
            builder: (context,value,child) {
              return InkWell(
                  onTap: (){
                    value.getCategory();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigation(
                              userId: '',
                              username: '',
                              userNumber: '',
                              loginPhno: '',
                            )
                        )
                    );                  },
                  child: btn(green2, "Continue", Colors.white, 120, 50, 18, FontWeight.w500));
            }
          ),        ],
      ),

    ) ;
  }
}
