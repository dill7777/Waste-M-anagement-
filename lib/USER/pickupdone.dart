import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';
import 'package:trashbuddy/USER/collectWaste.dart';
import 'package:trashbuddy/USER/status.dart';

class PickupDone extends StatelessWidget {
  const PickupDone({super.key, required List<double> prices, required List<String> selectedItems, required List<double> kgValue, required String selectedTime, required String selectedDate});

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
         leading: InkWell(
          onTap: (){
    Navigator.pop(context);
    },
        child: Icon(Icons.chevron_left,size: 30,color: white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
           // Center(
           //   child: Container(
           //     height: 400,
           //     width: 300,
           //     decoration: BoxDecoration(
           //       borderRadius: BorderRadius.circular(10),
           //       color: white
           //     ),
           //   ),
           // ),
            SizedBox(
              height: height/3.8,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/img_24.png'),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 160,top: 10),
                      child: Text("Rajeev",style: TextStyle(
                        fontSize: 20,
                        fontFamily: "kadwa",
                      ),),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("Rajeev will pickup your garbage on your\nscheduled date time!",style: TextStyle(
                        fontSize: 12,
                        fontFamily: "kadwa",
                        color: green2
                      ),),
                    )
                  ],
                ),
                SizedBox(width: 10,),
                Consumer<mainProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: () {
                        value.makingPhoneCall('+7025009560');
                      },
                        child: Icon(Icons.call_rounded,color: green2,));
                  }
                )
              ],
            ),
            SizedBox(height: 10,),
          Center(child: InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Status()));
              },
              child: btn(button, "Next", white, 310, 38, 18, FontWeight.w500,"kadwa")))
          ],
        ),
      ),
    );
  }
}
