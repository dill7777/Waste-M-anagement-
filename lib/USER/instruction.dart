import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';
import 'package:trashbuddy/USER/Address.dart';
import 'package:trashbuddy/USER/uploadpic.dart';

import '../CONSTANT/widget.dart';

// class Instruction extends StatelessWidget {
//   const Instruction({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: green1,
//       appBar: AppBar(
//         backgroundColor: green2,
//         title: Text("Raise Complaint",
//             style: TextStyle(
//                 color: white,
//                 fontFamily: "kadwa",
//                 fontSize: 21
//             )),
//         centerTitle: true,
//         leading: InkWell(
//             onTap: (){
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.chevron_left,size: 30,color: white,)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               Center(
//                 child: Text("Add multiple pictures of Dumpsite to let our\nteam to spot the Dumpsite easily",style: TextStyle(
//                   fontSize: 15,
//                   fontFamily: "kadwa"
//                 ),),
//               ),
//               SizedBox(height: 20,),
//           Consumer<mainProvider>(
//             builder: (context,value,child) {
//               return Container(
//                 height: height/3,
//                 child: GridView.builder(
//                   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
//                   shrinkWrap: true,
//                   physics: ScrollPhysics(),
//                   // padding: EdgeInsets.only(right: 10, top: 10,left: 5),
//                   itemCount: value.complaintlist.length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisExtent:160,
//
//                   ),
//                   itemBuilder: (context, index) {
//                     print("ahbdhsd"+value.complaintlist.length.toString());
//                     return InkWell(
//                       onTap: () {
//                         showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                             content:  Text(
//                                 "Do you want to  EDIT or DELETE ?",style: TextStyle(
//                                 fontSize:17,
//                                 fontFamily: "kadwa",
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black)),
//                             actions: <Widget>[
//                               Center(
//                                 child: Row(
//                                   children: [
//                                     TextButton(
//                                       onPressed: () {
//                                         value.DeleteServices(
//                                             value.complaintlist[index].id,context);
//                                         Navigator.of(context).pop();
//
//                                       },
//                                       child: Container(
//                                         height: 45,
//                                         width: 90,
//                                         decoration: BoxDecoration(
//                                             color:Colors.red ,
//                                             borderRadius: BorderRadius.circular(8),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: Color(0x26000000),
//                                                 blurRadius: 2.0, // soften the shadow
//                                                 spreadRadius: 1.0, //extend the shadow
//                                               ),
//                                             ] ),
//                                         child: Center(child:  Text("Delete",style: TextStyle(
//                                           color:white,
//                                           fontSize: 17,
//                                           fontWeight: FontWeight.w600,
//                                           fontFamily: "kadwa",
//                                         ))),
//                                       ),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         print("hjjk"+ value.complaintlist[index].id);
//                                         value.EditServices(
//                                             value.complaintlist[index].id);
//                                         Navigator.pop(context);
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   UploadPicture(
//                                                       from: "EDIT",
//                                                       oldid: value.complaintlist[index].id
//                                                   ),
//                                             ));
//                                       },
//                                       child:Container(
//                                         height: 45,
//                                         width: 90,
//                                         decoration: BoxDecoration(
//                                             color:green2 ,
//                                             borderRadius: BorderRadius.circular(8),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: Color(0x26000000),
//                                                 blurRadius: 2.0, // soften the shadow
//                                                 spreadRadius: 1.0, //extend the shadow
//                                               ),
//                                             ] ),
//                                         child: Center(child:  Text("Edit",style: TextStyle(
//                                           color:Colors.white,
//                                           fontSize: 17,fontWeight: FontWeight.w600,
//                                           fontFamily: "kadwa",
//                                         ))),
//                                       ),)
//                                   ],
//                                 ),
//                               ),
//
//                             ],
//                           ),
//                         );
//                       },
//                       child: Column(
//                         children: [
//                           Container(
//                             height: height/5.5,
//                             width: width/2.5,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: NetworkImage(value.complaintlist[index].Photo),fit: BoxFit.fill
//                                 ),
//                                 borderRadius: BorderRadius.circular(5)
//
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     );
//
//                   },
//                 ),
//               );
//             }
//           ),
//
//               // Padding(
//               //   padding:  EdgeInsets.only(left: 12),
//               //   child: Row(
//               //     children: [
//               //       Container(
//               //         height: 150,
//               //         width: 150,
//               //         decoration: BoxDecoration(
//               //           borderRadius: BorderRadius.circular(10),
//               //           color: white,
//               //             image: DecorationImage(image: AssetImage('assets/img_28.png'),fit: BoxFit.fill)
//               //
//               //         ),
//               //         // child: Center(child: Icon(Icons.trash-can-empty)),
//               //
//               //       ),
//               //       SizedBox(width: 20,),
//               //       Container(
//               //         height: 150,
//               //         width: 150,
//               //         decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(10),
//               //             color: white
//               //         ),
//               //         child: Center(child: Icon(Icons.add)),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               SizedBox(height: 20,),
//               Center(
//                 child: Text("Any other instructions",style: TextStyle(
//                     fontFamily: "kadwa",
//                     fontSize: 19
//                 ),),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Center(
//                 child: Container(
//                   height: 150,
//                   width: 300,
//                   decoration: BoxDecoration(
//                     color: white,
//                     borderRadius: BorderRadius.circular(10)
//                   ),
//                   child: Consumer<mainProvider>(
//                     builder: (context,value,child) {
//                       return TextField(
//                         controller: value.complaintCt,
//                         decoration: InputDecoration(
//                           border: InputBorder.none
//                         ),
//                         style: TextStyle(
//                           fontFamily: "kadwa",
//                           fontSize: 15
//                         ),
//                       );
//                     }
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Center(child: InkWell(
//                   onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Address(from: '',)));
//                   },
//                   child: btn2(btn1, "Confirm and fill address", white, 230, 35, 14, FontWeight.w500,"kadwa")))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';

// Adjust the path as per your project
// ____________________________________________________________________________________________





// class Instruction extends StatelessWidget {
//   const Instruction({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: green1,
//       appBar: AppBar(
//         backgroundColor: green2,
//         title: Text(
//           "Raise Complaint",
//           style: TextStyle(color: white, fontFamily: "kadwa", fontSize: 21),
//         ),
//         centerTitle: true,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.chevron_left, size: 30, color: white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 30),
//               Center(
//                 child: Text(
//                   "Add multiple pictures of Dumpsite to let our\nteam to spot the Dumpsite easily",
//                   style: TextStyle(fontSize: 15, fontFamily: "kadwa"),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Consumer<mainProvider>(
//                 builder: (context, value, child) {
//
//
//                   return Container(
//                     height: height / 3,
//                     child: GridView.builder(
//                       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                       shrinkWrap: true,
//                       physics: ScrollPhysics(),
//                       itemCount: value.complaintlist.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisExtent: 160,
//                       ),
//                       itemBuilder: (context, index) {
//                         // File? imageFile = index < value.complaintList.length ? value.complaintList[index] : null;
//                         return InkWell(
//                           onTap: () {
//                             // Handle onTap event as needed
//                           },
//                           child: Column(
//                             children: [
//                             Container(
//                             height: height / 3.5,
//                             width: width / 2.3,
//                             margin: EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               image: DecorationImage(
//                                 image: FileImage(value.complaintList[index]),
//                                 fit: BoxFit.cover,
//                               )
//                             ),
//                           ),
//
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: Text(
//                   "Any other instructions",
//                   style: TextStyle(fontFamily: "kadwa", fontSize: 19),
//                 ),
//               ),
//               SizedBox(height: 15),
//               Center(
//                 child: Container(
//                   height: 150,
//                   width: 300,
//                   decoration: BoxDecoration(
//                     color: white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Consumer<mainProvider>(
//                     builder: (context, value, child) {
//                       return TextField(
//                         controller: value.complaintCt,
//                         decoration: InputDecoration(border: InputBorder.none),
//                         style: TextStyle(fontFamily: "kadwa", fontSize: 15),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Center(
//                 child: InkWell(
//                   onTap: () {
//                     // Handle onTap event as needed
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Address(from: "")));
//                   },
//                   child: btn2(btn1, "Confirm and fill address", white, 230, 35, 14,
//                       FontWeight.w500, "kadwa"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Instruction extends StatelessWidget {
  const Instruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text(
          "Raise Complaint",
          style: TextStyle(color: white, fontFamily: "kadwa", fontSize: 21),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left, size: 30, color: white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Add multiple pictures of Dumpsite to let our\nteam to spot the Dumpsite easily",
                  style: TextStyle(fontSize: 15, fontFamily: "kadwa"),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Consumer<mainProvider>(
                builder: (context, value, child) {
                  // Print statement to debug the complaint list
                  print("Complaint List: ${value.complaintList}");

                  return Container(
                    height: height / 2.8,
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: value.complaintList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 160,
                      ),
                      itemBuilder: (context, index) {
                        var imageFile = value.complaintList[index];
                        // Print statement to debug each image file
                        print("Image File at index $index: $imageFile");

                        return InkWell(
                          onTap: () {
                            // Handle onTap event as needed
                          },
                          child: Column(
                            children: [
                              Container(
                                height: height / 5.45,
                                width: width / 2.3,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: imageFile != null
                                      ? DecorationImage(
                                    image: FileImage(imageFile),
                                    fit: BoxFit.fill,
                                  )
                                      : null,
                                ),
                                child: imageFile == null
                                    ? Center(child: Text("No Image"))
                                    : null,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Any other instructions",
                  style: TextStyle(fontFamily: "kadwa", fontSize: 19),
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Consumer<mainProvider>(
                    builder: (context, value, child) {
                      return TextField(
                        controller: value.complaintCt,
                        decoration: InputDecoration(border: InputBorder.none),
                        style: TextStyle(fontFamily: "kadwa", fontSize: 15),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: InkWell(
                  onTap: () {
                    // Handle onTap event as needed
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Address(from: "")));
                  },
                  child: btn2(btn1, "Confirm and fill address", white, 230, 35, 14,
                      FontWeight.w500, "kadwa"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



