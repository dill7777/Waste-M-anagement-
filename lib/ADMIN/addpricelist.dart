import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';

import '../CONSTANT/widget.dart';
import '../PROVIDER/mainprovider.dart';

class Addpricelist extends StatelessWidget {
  String from;
  String oldid;
   Addpricelist({super.key,required this.from,required this.oldid});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text("Add Pricelist",style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: "kadwa"
        )),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left,size: 30,color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Center(
              child: Consumer<Mainprovider>(
                  builder: (context,value,child) {
                    return Container(
                      height: height/17,
                      width: width/1.4,
                      decoration: BoxDecoration(
                          color: white,
                          border: Border.all(color: green2),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextField(
                        controller: value.wastepriceCt,
                        decoration: InputDecoration(
                            border: InputBorder.none
                        ),
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "kadwa"
                        ),
                      ),
                    );
                  }
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Consumer<Mainprovider>(
              builder: (context,value,child) {
                return Center(
                  child: Container(
                    height: height / 19,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: white,
                        border: Border.all(color: green2),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextField(
                      controller: value.priceCT,
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "kadwa"
                      ),
                    ),
                  ),
                );
              }
            ),
            SizedBox(
              height: 120,
            ),
            Center(child: Consumer<Mainprovider>(
                builder: (context,value,child) {
                  return InkWell(
                      onTap: () {
                        if ( from == "NEW"){
                          value.addWastePrice(from, " ");
                        }else{
                          value.addWastePrice(from, oldid);
                        }
                        Navigator.pop(context);
                      },
                      child: btn3(green5, "Save", white, 100, 38, 15, FontWeight.w500, "kadwa"));
                }
            ))
        
          ],
        ),
      ),

    );
  }
}
