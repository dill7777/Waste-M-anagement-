import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/ADMIN/category.dart';
import 'package:trashbuddy/ADMIN/customeruser.dart';
import 'package:trashbuddy/ADMIN/earnings.dart';
import 'package:trashbuddy/ADMIN/pricelist.dart';
import 'package:trashbuddy/ADMIN/services.dart';
import 'package:trashbuddy/ADMIN/wastetype.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/CONSTANT/widget.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';

import 'addpricelist.dart';

class AdminHome extends StatelessWidget {
   AdminHome({super.key});

  List <String> Pages = [
    "Customer",
    "User",
    "Category",
    "Notification",
    "Waste Type",
    "Earnings",
    "Services",
    "Price List",
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: green1 ,
      appBar: AppBar(
        backgroundColor: green2,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left,size: 30,color: white,)),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            // Center(
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     physics: ScrollPhysics(),
            //     itemCount: Pages.length,
            //       padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
            //       itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.only(bottom: 10),
            //         child: Container(
            //           height: height/20,
            //           width: width/4,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(5),
            //             color: button,
            //           ),
            //           child: Center(
            //             child: Text(Pages[index],style: TextStyle(
            //               color: white,
            //               fontFamily: "kadwa",
            //               fontSize: 15
            //             )),
            //           ),
            //         ),
            //       );
            //     }
            //   ),
            // )
            Padding(
              padding: const EdgeInsets.only(left: 32,right: 32),
              child: Column(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Customer()));
                      },
                      child: btn3(btn1, "Customer", white, width/1.25, height/20, 15, FontWeight.w500, "kadwa", )),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Customer()));
                      },
                      child: btn3(btn1, "User", white, width/1.25, height/20, 15, FontWeight.w500, "kadwa", )),
                  Consumer<mainProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                          onTap: (){
                            value.getCategory();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));
                          },
                          child: btn3(btn1, "Category", white, width/1.25, height/20, 15, FontWeight.w500, "kadwa", ));
                    }
                  ),
                  btn3(btn1, "Notification", white, width/1.25, height/20, 15, FontWeight.w500, "kadwa", ),
                  Consumer<mainProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                          onTap: (){
                            value.getWasteType();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>WasteType()));
                          },
                          child: btn3(btn1, "Waste Type", white, width/1.25, height/20, 15, FontWeight.w500, "kadwa", ));
                    }
                  ),
                  Consumer<mainProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                          onTap: (){
                            value.getEarnings();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Earnings()));
                          },
                          child: btn3(btn1, "Earnings", white, width/1.25, height/20, 15, FontWeight.w500, "kadwa", ));
                    }
                  ),
                  Consumer<mainProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                          onTap: (){
                            value.getServices();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Services()));
                          },
                          child: btn3(btn1, "Services", white, width/1.25, height/20, 15, FontWeight.w500, "kadwa", ));
                    }
                  ),
                  Consumer<mainProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                          onTap: () {
                            value.getWastePrice();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Pricelist()));
                          },
                          child: btn3(btn1, "Price List", white, width/1.25, height/20, 15, FontWeight.w500, "kadwa", ));
                    }
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
