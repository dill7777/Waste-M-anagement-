import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';

import 'addwaste.dart';

class WasteType extends StatelessWidget {

   WasteType({super.key,});

  List<String> waste = [
    "Dry waste",
    "Liquid Waste",
    "E-waste",
    "Metal",
    "Food waste",
    "Glass",
    "Plastic",
    "Organic",
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddWaste(from: "NEW", oldid: "")));
            },
            child: Icon(Icons.add,color: green5,),
          );
        }
      ),

      appBar: AppBar(
        backgroundColor: green2,
        title: Text("Waste Type",style: TextStyle(
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
              height: 30,
            ),
            Consumer<mainProvider>(
              builder: (context,value,child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                    itemCount: value.wastelist.length,
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                  itemBuilder: (context, index) {
                    print("ahbdhsd"+value.wastelist.length.toString());
                    return InkWell(
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
                                        value.DeleteWaste(
                                            value.wastelist[index].id,context);
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
                                        print("hjjk"+ value.wastelist[index].id);
                                        value.EditCategory(
                                            value.wastelist[index].id);
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddWaste(
                                                      from: "EDIT",
                                                      oldid: value.wastelist[index].id
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: height / 20,
                            width: width / 1.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black),
                              color: white
                            ),
                            child: Center(
                              child: Text(value.wastelist[index].Name,style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "kadwa"
                              ),),
                            ),
                          )
                        ],
                      ),
                    );

                  },

                  // itemBuilder: (context, index) {
                  //
                  //
                  //   // return
                  //   // Padding(
                  //   //   padding: const EdgeInsets.only(bottom: 15),
                  //   //   child: Container(
                  //   //     height: height / 20,
                  //   //     width: width / 2.5,
                  //   //     decoration: BoxDecoration(
                  //   //         borderRadius: BorderRadius.circular(5),
                  //   //         border: Border.all(color: Colors.black),
                  //   //       color: white
                  //   //     ),
                  //   //     child: Center(
                  //   //       child: Text(value.wastelist[index].Name,style: TextStyle(
                  //   //         fontSize: 15,
                  //   //         fontFamily: "kadwa",
                  //   //       )),
                  //   //     ),
                  //   //   ),
                  //   // );
                  // }
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}


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
//