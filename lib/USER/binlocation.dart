import 'package:flutter/material.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';

class BinLocation extends StatelessWidget {
  const BinLocation({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Center(
            child: Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 130),
            child: Text("Sweet Mart",style: TextStyle(
              fontSize: 15,
              fontFamily: "kadwa",
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Text("3 Mins",style: TextStyle(
              fontSize: 14,
              fontFamily: "kadwa",
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 125),
            child: btn(button, "Start", white, 90, 30, 12, FontWeight.w500,"kadwa"),
          )

        ],
      ),
    );
  }
}
