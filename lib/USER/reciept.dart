// import 'package:flutter/material.dart';
// import 'package:trashbuddy/CONSTANT/Colors.dart';
// import 'package:trashbuddy/USER/pickupdone.dart';
// import 'package:trashbuddy/USER/raisecomplaint.dart';
//
// import '../CONSTANT/widget.dart';
//
// // class PurchaseReciept extends StatelessWidget {
// //   const PurchaseReciept({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     var width = MediaQuery.of(context).size.width;
// //     var height = MediaQuery.of(context).size.height;
// //
// //     Widget btn(Color myColor, String text, Color textmycolor, double width,double height,double fonsize,FontWeight fntw) {
// //       return Padding(
// //         padding: EdgeInsets.only(top: 30, bottom: 0, left: 10, right: 5),
// //         child: Container(
// //           height: height,
// //           width: width,
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(7),
// //             border: Border.all(color: green2),
// //             color: myColor,
// //           ),
// //           child: Center(
// //               child: Text(
// //                 text,
// //                 style: TextStyle(
// //                     fontSize: fonsize, fontWeight:fntw, color: textmycolor),
// //               )),
// //         ),
// //       );
// //     }
// //
// //
// //     return Scaffold(
// //       backgroundColor: green1,
// //       appBar: AppBar(
// //         backgroundColor: green2,
// //         title: Text("Purchase Reciept",style: TextStyle(
// //             fontSize: 20,
// //             fontFamily: "kadwa",
// //             fontWeight: FontWeight.w500,
// //             color: white
// //         )),
// //         leading: InkWell(
// //             onTap: (){
// //               Navigator.pop(context);
// //             },
// //             child: Icon(Icons.chevron_left,size: 30,color: white)),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Padding(
// //             //   padding: const EdgeInsets.only(left: 10,top: 15),
// //             //   child: Text("Pickup Confirmation details",style: TextStyle(
// //             //     fontSize: 22,
// //             //     fontFamily: "kadwa",
// //             //   ),),
// //             // ),
// //             Padding(
// //               padding: const EdgeInsets.only(left: 15,top: 30),
// //               child: Text("Garbage Items",style: TextStyle(
// //                   fontSize: 20,
// //                   fontFamily: "kadwa"
// //               ),)
// //             ),
// //
// //             Padding(
// //               padding: const EdgeInsets.only(left: 10,top: 25),
// //               child: Container(
// //                 height: 140,
// //                 width: 340,
// //                 decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(10),
// //                     color: white
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     Row(
// //                       children: [
// //                         Padding(
// //                           padding: const EdgeInsets.only(left: 10,top: 10),
// //                           child: Text("Dry waste",style: TextStyle(
// //                               fontSize: 16,
// //                               fontFamily: "kadwa"
// //                           ),),
// //                         ),
// //                         SizedBox(width: 200,),
// //                         Text("₹ 35",style: TextStyle(
// //                             fontFamily: "kadwa",
// //                             fontSize: 15
// //                         ),)
// //                       ],
// //                     ),
// //                     SizedBox(
// //                       height: 10,
// //                     ),
// //                     Row(
// //                       children: [
// //                         Padding(
// //                           padding: const EdgeInsets.only(left: 10,),
// //                           child: Text("Liquid waste",style: TextStyle(
// //                               fontSize: 16,
// //                               fontFamily: "kadwa"
// //                           ),),
// //                         ),
// //                         SizedBox(width: 179,),
// //                         Text("₹ 35",style: TextStyle(
// //                             fontFamily: "kadwa",
// //                             fontSize: 15
// //                         ),)
// //                       ],
// //                     ),
// //                     SizedBox(
// //                       height: 20,
// //                     ),
// //                     Divider(height: 1,color: line,indent: 5,endIndent: 5,),
// //                     Row(
// //                       children: [
// //                         Padding(
// //                           padding: const EdgeInsets.only(left: 10,top: 15),
// //                           child: Text("Total",style: TextStyle(
// //                             fontSize: 15,
// //                             fontFamily: "kadwa",
// //                           ),),
// //                         ),
// //                         SizedBox(width: 245,),
// //                         Padding(
// //                           padding: const EdgeInsets.only(top: 10),
// //                           child: Text("₹ 70",style: TextStyle(
// //                               fontFamily: "kadwa",
// //                               fontSize: 15
// //                           ),),
// //                         )
// //                       ],
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(left: 10,top: 20),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Text("Cost to be paid",style: TextStyle(
// //                     fontSize: 20,
// //                     fontFamily: "kadwa",
// //                   ),),
// //                   Padding(
// //                     padding: const EdgeInsets.only(right: 20),
// //                     child: Text("₹ 70",style: TextStyle(
// //                         fontFamily: "kadwa",
// //                         fontSize: 20
// //                     ),),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 20,),
// //             Divider(height: 2,color: line,thickness: 2,),
// //             Padding(
// //               padding: const EdgeInsets.only(top: 20,left: 10),
// //               child: Text("Address details",style: TextStyle(
// //                 fontSize: 22,
// //                 fontFamily: "kadwa",
// //               ),),
// //             ),
// //
// //             Padding(
// //               padding: const EdgeInsets.only(top: 15,left: 15),
// //               child: Text(
// //                 textAlign: TextAlign.start,
// //                 "Home\nHouse no 10, Kolasseri colony Perinthalmanna \nMalappuram 656565",style: TextStyle(
// //                 fontFamily: "kadwa",
// //                 fontSize: 12,
// //
// //               ),),
// //             ),
// //             SizedBox(
// //               height: 20,
// //             ),
// //             Row(
// //               children: [
// //                 InkWell(
// //                     onTap: (){
// //                       Navigator.push(context,
// //                           MaterialPageRoute(builder: (context) => RaiseComplaint()));
// //                     },
// //                     child: btn(white, "Report", green2, 150, 40, 15, FontWeight.w500)),
// //                 InkWell(
// //                     onTap: (){
// //                       Navigator.push(context,
// //                           MaterialPageRoute(builder: (context) => PickupDone()));
// //                     },
// //                     child: btn(button, "Pickup", white, 160, 40, 15, FontWeight.w500)),
// //
// //               ],
// //             ),
// //
// //
// //
// //           ],
// //         ),
// //       ),
// //
// //
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';  // Import Firestore package
//
// class PurchaseReciept extends StatefulWidget {
//   final List<double> prices;
//   final List<String> selectedItems;
//   final List<double> kgValue;
//
//   const PurchaseReciept({
//     super.key,
//     required this.prices,
//     required this.selectedItems,
//     required this.kgValue, required String selectedDate, required String selectedTime,
//   });
//
//   @override
//   _PurchaseRecieptState createState() => _PurchaseRecieptState();
// }
//
// class _PurchaseRecieptState extends State<PurchaseReciept> {
//   List<double> itemPrices = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchItemPrices();
//   }
//
//   Future<void> _fetchItemPrices() async {
//     List<double> prices = [];
//     for (String itemName in widget.selectedItems) {
//       final snapshot = await FirebaseFirestore.instance
//           .collection('WASTE_NAME')
//           .where('Name', isEqualTo: itemName)
//           .limit(1)
//           .get();
//       if (snapshot.docs.isNotEmpty) {
//         double price = double.parse(snapshot.docs.first['Price'].toString());
//         prices.add(price);
//       } else {
//         prices.add(0.0); // Fallback if no price is found
//       }
//     }
//     setState(() {
//       itemPrices = prices;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Debug: Print the item prices and kg values
//     print("Item Prices List: $itemPrices");
//     print("KG Values List: ${widget.kgValue}");
//
//     return Scaffold(
//       backgroundColor: green1,
//       appBar: AppBar(
//         backgroundColor: green2,
//         title: Text(
//           "Purchase Receipt",
//           style: TextStyle(fontSize: 20, fontFamily: "kadwa", fontWeight: FontWeight.w500, color: Colors.white),
//         ),
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.chevron_left, size: 30, color: Colors.white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 15, top: 30),
//               child: Text(
//                 "Garbage Items",
//                 style: TextStyle(fontSize: 20, fontFamily: "kadwa"),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, top: 25),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                 ),
//                 child: itemPrices.isEmpty
//                     ? Center(child: CircularProgressIndicator())
//                     : Column(
//                   children: List.generate(widget.selectedItems.length, (index) {
//                     double itemTotalPrice = itemPrices[index] * widget.kgValue[index];
//                     print("Selected Item: ${widget.selectedItems[index]}");
//                     print("KG Value: ${widget.kgValue[index]}");
//                     print("Item Price: ${itemPrices[index]}");
//                     print("Item Total Price: $itemTotalPrice");
//
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 10),
//                             child: Text(
//                               "${widget.selectedItems[index]} (${widget.kgValue[index]} kg)",
//                               style: TextStyle(fontSize: 16, fontFamily: "kadwa"),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 10),
//                             child: Text(
//                               "₹ ${widget.prices}",
//                               style: TextStyle(fontFamily: "kadwa", fontSize: 12),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, top: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Total Cost",
//                     style: TextStyle(fontSize: 20, fontFamily: "kadwa"),
//                   ),
//                   // Padding(
//                   //   padding: const EdgeInsets.only(right: 20),
//                   //   child: Text("",
//                   //     // "₹ ${widget.totalPrice.toStringAsFixed(2)}",
//                   //     style: TextStyle(fontFamily: "kadwa", fontSize: 20),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Divider(height: 2, color: Colors.grey, thickness: 2),
//             Padding(
//               padding: const EdgeInsets.only(top: 20, left: 10),
//               child: Text(
//                 "Address details",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontFamily: "kadwa",
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15, left: 15),
//               child: Text(
//                 "Home\nHouse no 10, Kolasseri colony Perinthalmanna \nMalappuram 656565",
//                 style: TextStyle(
//                   fontFamily: "kadwa",
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => RaiseComplaint()));
//                   },
//                   child: btn2(white, "Report", green2, 150, 40, 15, FontWeight.w500,"kadwa"),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => PickupDone()));
//                   },
//                   child: btn2(button, "Pickup", white, 160, 40, 15, FontWeight.w500,"kadwa"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
