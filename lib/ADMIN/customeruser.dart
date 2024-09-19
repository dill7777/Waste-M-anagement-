import 'package:flutter/material.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/CONSTANT/widget.dart';

class Customer extends StatelessWidget {
  const Customer({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: height/5,
              width: width/1.15,
              decoration: BoxDecoration(
                color: green2,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Name : ",style: TextStyle(
                          color: white,
                          fontSize: 16,
                          fontFamily: "kadwa",
                        ),),
                      ),
                      SizedBox(width: 16,),
              Container(
                height: height/20,
                width: width/1.8,
                decoration: BoxDecoration(
                    color: green2,
                    border: Border.all(color: green2),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none
                  ),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "kadwa"
                  ),
                ),
              )

                    ],
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Address : ",style: TextStyle(
                          color: white,
                          fontSize: 16,
                          fontFamily: "kadwa",
                        ),),
                      ),
              Container(
                height: height/9,
                width: width/1.8,
                decoration: BoxDecoration(
                    color: green2,
                    border: Border.all(color: green2),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none
                  ),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "kadwa"
                  ),
                ),
              )

                    ],
                  ),

                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              btn2(white, "Accept", green2, 100, 35, 15, FontWeight.w500, "kadwa"),
              btn2(white, "Decline", Colors.red, 100, 35, 15, FontWeight.w500, "kadwa"),
            ],
          )
        ],
      ),

    );
  }
}
