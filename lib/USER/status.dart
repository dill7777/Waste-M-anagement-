import 'package:flutter/material.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/USER/reciept.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget btn(Color myColor, String text, Color textmycolor, double width,double height,double fontsize,FontWeight fntw, ) {
      return Padding(
        padding: EdgeInsets.only(top: 30, bottom: 0, left: 10, right: 5),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: green2),
            color: myColor,
          ),
          child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: fontsize, fontWeight:fntw, color: textmycolor,
                ),
              )),
        ),
      );
    }


    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        leading:  InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left,size: 30,color: Colors.white,)),

      ),
      body: Column(

        children: [
          Center(child: Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Image(image: AssetImage('assets/img_21.png',),height: 80,),
          )),
          SizedBox(
            height: 20,
          ),
          Text("Congrats !",style: TextStyle(
            fontSize: 26,
            fontFamily: "kadwa",
          ),),
          SizedBox(
            height: 20,
          ),
          Text("Your pickup request has been placed ! ",style: TextStyle(
            fontSize: 17,
            fontFamily: "kadwa",
          ),),
          SizedBox(
            height: 10,
          ),
          Text("Rajeev assigned to pickup your garbager ",style: TextStyle(
            fontSize: 16,
            fontFamily: "kadwa",
            color: green2
          ),),
          // InkWell(
          //     onTap: (){
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => PurchaseReciept()));
          //     },
          //     child: btn(button, "See the status", Colors.white, 330, 40, 17, FontWeight.w500,)),

        ],
      ),
    );
  }
}
