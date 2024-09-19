import 'package:flutter/material.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';

import 'dustbinlocation.dart';

class DeviceLocation extends StatelessWidget {
  const DeviceLocation({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget btn(Color myColor, String text, Color textmycolor, double width,double height,double fonsize,FontWeight fntw,String fontFamily ) {
      return Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: myColor,
          ),
          child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: fonsize, fontWeight:fntw, color: textmycolor,
                    fontFamily: fontFamily
                ),
              )),
        ),
      );
    }

    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text("Location of Dustbin",
        style: TextStyle(
          color: white,
          fontFamily: "kadwa",
          fontSize: 21
        )),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left,size: 30,color: white,)),
      ),
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200,left: 10),
            child: Image(image: AssetImage('assets/img_25.png'),height: 80,),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text("Device Location is off",style: TextStyle(
              fontSize: 25,
              fontFamily: "kadwa",
            ),),
          ),
          Text("Turning on Device Location for accurate address",style: TextStyle(
            fontSize: 13,
            color: grey,
            fontFamily: "kadwa"
          ),),
    SizedBox(
      height: 40,
    ),
    InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DustBinLocation()));
        },
        child: btn(button, "Turn on", white, 180, 40, 18, FontWeight.w500,"kadwa"))

    ],
      ),

    );
  }
}
