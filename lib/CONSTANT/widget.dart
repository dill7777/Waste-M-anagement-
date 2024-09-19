import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Colors.dart';

Widget AddText(
  context,
  String text1,
  // String text2,
)

{
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Column(
    children: [
      SizedBox(width: width / 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Text(text1,
          //       style: TextStyle(
          //         fontSize: 20,
          //           fontFamily: "kadwa",
          //           color: Colors.white,)),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: white),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: text1,
                hintStyle: TextStyle(
                    fontFamily: "kadwa",
                    color: Color(0xffC3DDC8)),
              ),

              // validator: (value){
              //   if(value!.isEmpty){
              //     return "This field is required";
              //   }else{}
              // },
            ),
          ),

        ],
      ),
    ],
  );
}
Widget btn(Color myColor, String text, Color textmycolor,
    double width,double height,double fonsize,FontWeight fntw,String fontFamily ,dynamic icon) {
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Icon(icon,color: white),
              ),
              SizedBox(width: 10,),
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: fonsize, fontWeight:fntw, color: textmycolor,
                      fontFamily: fontFamily
                  ),
                ),
              ),
            ],
          )),
    ),
  );
}
Widget btn2(Color myColor, String text, Color textmycolor, double width,double height,double fonsize,FontWeight fntw,String fontFamily ) {
  return Padding(
    padding: EdgeInsets.only(top: 20, bottom: 0, left: 5, right: 5),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: myColor,
        border: Border.all(color: green6)
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
Widget btn3(Color myColor, String text, Color textmycolor, double width,double height,double fonsize,FontWeight fntw,String fontFamily ) {
  return Padding(
    padding: EdgeInsets.only(top: 10,bottom: 10,  left: 5, right: 5),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
Widget cancel(Color myColor, String text, Color textmycolor, double width,double height,double fonsize,FontWeight fntw,String fontFamily ) {
  return Padding(
    padding: EdgeInsets.only(top: 20, left: 5, right: 5),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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





