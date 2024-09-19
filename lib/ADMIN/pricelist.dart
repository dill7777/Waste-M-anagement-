import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';

import 'addpricelist.dart';

class Pricelist extends StatelessWidget {
   Pricelist({super.key});

  List <String> waste = [
    "Cloths",
    "Wool",
    "E-waste",
    "Metal",
    "Food Waste",
    "Plastic",
    "Glass",
    "Books & Paper",
  ];
  List <String> price = [
  "₹ 35",
  "₹ 40",
  "₹ 30",
  "₹ 50",
  "₹ 35",
  "₹ 30",
  "₹ 35",
  "₹ 50",
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: green1,
      floatingActionButton: Consumer<mainProvider>(
        builder: (context,value,child) {
          return FloatingActionButton(
            shape: CircleBorder(side: BorderSide(color: green5)),
            backgroundColor: white,
            onPressed: () {
              value.clearWastePrice();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Addpricelist(from: "NEW", oldid: "")));
            },
            child: Icon(Icons.add,color: green5,),
          );
        }
      ),
      appBar: AppBar(
        backgroundColor: green2,
        title: Text("Waste Price",style: TextStyle(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
             Consumer<mainProvider>(
               builder: (context,value,child) {
                 return ListView.builder(
                     shrinkWrap: true,
                     physics: ScrollPhysics(),
                     itemCount: value.wastepricelist.length,
                       padding: EdgeInsets.symmetric(vertical: 50,horizontal: 40),
                       itemBuilder: (context, index) {
                         return Padding(
                           padding: const EdgeInsets.only(bottom: 10),
                           child: Row(
                             children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content:  Text(
                              "Do you want to  EDIT or DELETE ?",style: TextStyle(
                              fontSize:17,
                              fontFamily: "kadwa",
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                          actions: <Widget>[
                            Center(
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      value.DeleteWastePrice(
                                          value.wastepricelist[index].id,context);
                                      Navigator.of(context).pop();

                                    },
                                    child: Container(
                                      height: 45,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color:Colors.red ,
                                          borderRadius: BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              blurRadius: 2.0, // soften the shadow
                                              spreadRadius: 1.0, //extend the shadow
                                            ),
                                          ] ),
                                      child: Center(child:  Text("Delete",style: TextStyle(
                                        color:white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "kadwa",
                                      ))),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      print("hjjk"+ value.wastepricelist[index].id);
                                      value.EditCategory(
                                          value.wastepricelist[index].id);
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Addpricelist(
                                                    from: "EDIT",
                                                    oldid: value.wastepricelist[index].id
                                                ),
                                          ));
                                    },
                                    child:Container(
                                      height: 45,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color:green2 ,
                                          borderRadius: BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              blurRadius: 2.0, // soften the shadow
                                              spreadRadius: 1.0, //extend the shadow
                                            ),
                                          ] ),
                                      child: Center(child:  Text("Edit",style: TextStyle(
                                        color:Colors.white,
                                        fontSize: 17,fontWeight: FontWeight.w600,
                                        fontFamily: "kadwa",
                                      ))),
                                    ),)
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    },

                    child: Container(
                        height: height / 19,
                        width: width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: button,
                        ),
                        child: Center(
                          child: Text(value.wastepricelist[index].Name, style: TextStyle(
                              color: white,
                              fontFamily: "kadwa",
                              fontSize: 15
                          )),
                        )
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      height: height / 19,
                      width: width / 4.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: button,
                      ),
                      child: Center(
                        child: Text(price[index], style: TextStyle(
                            color: white,
                            fontFamily: "kadwa",
                            fontSize: 15
                        )),
                      )
                  ),

                             ],
                           ),
                         );
                       }

                 );
               }
             )],
      ),
    );
  }
}
