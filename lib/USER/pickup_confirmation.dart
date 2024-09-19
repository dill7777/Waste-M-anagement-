// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:trashbuddy/CONSTANT/Colors.dart';
// import 'package:trashbuddy/MODELCLASS/modelclass.dart';
// import 'package:trashbuddy/PROVIDER/mainprovider.dart';
// import 'package:trashbuddy/USER/pickupdone.dart';
// import 'package:trashbuddy/USER/raisecomplaint.dart';
// import 'package:trashbuddy/USER/reciept.dart';
// import 'package:trashbuddy/USER/status.dart';
// import 'package:trashbuddy/my_flutter_icons.dart';
//
// import '../CONSTANT/widget.dart';
//
// // class PickupConfirmation extends StatelessWidget {
// //    double kgValue ;
// //    PickupConfirmation({super.key,required this.kgValue});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     var width = MediaQuery.of(context).size.width;
// //     var height = MediaQuery.of(context).size.height;
// //
// //     Widget btn(Color myColor, String text, Color textmycolor, double width,double height,double fonsize,FontWeight fntw) {
// //       return Padding(
// //         padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
// //         child: Container(
// //           height: height,
// //           width: width,
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(5),
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
// //         title: Text("Schedule Garbage Pickup",style: TextStyle(
// //             fontSize: 20,
// //             fontFamily: "kadwa",
// //             fontWeight: FontWeight.w600,
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
// //             Padding(
// //               padding: const EdgeInsets.only(left: 10,top: 15),
// //               child: Text("Pickup Confirmation details",style: TextStyle(
// //                 fontSize: 22,
// //                 fontFamily: "kadwa",
// //               ),),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(left: 15,top: 10),
// //               child: Text("Garbage Items",style: TextStyle(
// //                 fontSize: 20,
// //                 fontFamily: "kadwa"
// //               ),),
// //             ),
// //             SizedBox(
// //               height: 20,
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(left: 10),
// //               child: Container(
// //                 height: 140,
// //                 width: 340,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(10),
// //                   color: white
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     Row(
// //                       children: [
// //                         Padding(
// //                           padding: const EdgeInsets.only(left: 10,top: 10),
// //                           child: Text("Dry waste",style: TextStyle(
// //                             fontSize: 16,
// //                             fontFamily: "kadwa"
// //                           ),),
// //                         ),
// //                         SizedBox(width: 200,),
// //                         Text("₹ 35",style: TextStyle(
// //                           fontFamily: "kadwa",
// //                           fontSize: 15
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
// //                           fontFamily: "kadwa",
// //                             fontSize: 15
// //                           ),),
// //                         )
// //                       ],
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             // Padding(
// //             //   padding: const EdgeInsets.only(left: 10,top: 20),
// //             //   child: Row(
// //             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             //     children: [
// //             //       Text("Cost to be paid",style: TextStyle(
// //             //         fontSize: 20,
// //             //         fontFamily: "kadwa",
// //             //       ),),
// //             //       Padding(
// //             //         padding: const EdgeInsets.only(right: 20),
// //             //         child: Text("₹ 70",style: TextStyle(
// //             //             fontFamily: "kadwa",
// //             //             fontSize: 20
// //             //         ),),
// //             //       ),
// //             //     ],
// //             //   ),
// //             // ),
// //             SizedBox(height: 30,),
// //             Divider(height: 2,color: line,thickness: 2,),
// //             Padding(
// //               padding: const EdgeInsets.only(top: 20,left: 10),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Text("Address details",style: TextStyle(
// //                     fontSize: 22,
// //                     fontFamily: "kadwa",
// //                   ),),
// //                   Padding(
// //                     padding: const EdgeInsets.only(right: 10),
// //                     child: Icon(MyFlutterIcons.basil_edit_alt_solid,color: green2,),
// //                   )
// //                 ],
// //               ),
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
// //               height: 40,
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(left: 15),
// //               child: Text("Monday, April  6,  2024                      10 AM",style: TextStyle(
// //                 fontSize: 14,
// //                 fontFamily: "kadwa"
// //               ),),
// //             ),
// //             SizedBox(height: 30,),
// //             Divider(height: 2,color: line,thickness: 2,),
// //             SizedBox(
// //               height: 10,
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(left: 10),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Text("Payment",style: TextStyle(
// //                     fontSize: 22,
// //                     fontFamily: "kadwa"
// //                   ),),
// //                   Padding(
// //                     padding: const EdgeInsets.only(right: 10),
// //                     child: Icon(MyFlutterIcons.basil_edit_alt_solid,color: green2,),
// //                   )
// //                 ],
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(left: 10,top: 10),
// //               child: Text("Cash after pickup",style: TextStyle(
// //                 fontFamily: "kadwa",
// //                 fontSize: 14
// //               ),),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(left: 15,top: 10),
// //               child: InkWell(
// //                   onTap: (){
// //                     Navigator.push(context, MaterialPageRoute(builder: (context)=>PurchaseReciept()));
// //                   },
// //                   child: btn(button, "Confirm Pickup", white, 320, 40, 18, FontWeight.w500)),
// //             ),
// //
// //           ],
// //         ),
// //       ),
// //
// //
// //     );
// //   }
// // }
//
//
//
//
//   // -----------------------------------------------------
//
//
// class PickupConfirmation extends StatelessWidget {
//   final List<double> kgValue;
//   final List<String> selectedItems;
//   final List<double> prices;
//   final double totalPrice;
//
//   PickupConfirmation({
//     super.key,
//     required this.kgValue,
//     required this.prices,
//     required this.selectedItems,
//     required this.totalPrice,
//   });
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//
//     double totalCost = prices.reduce((a, b) => a + b);
//
//
//     Widget btn(Color myColor, String text, Color textmycolor, double width, double height, double fonsize, FontWeight fntw) {
//       return Padding(
//         padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
//         child: Container(
//           height: height,
//           width: width,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             color: myColor,
//           ),
//           child: Center(
//             child: Text(
//               text,
//               style: TextStyle(fontSize: fonsize, fontWeight: fntw, color: textmycolor),
//             ),
//           ),
//         ),
//       );
//     }
//
//     // double totalPrice = prices.reduce((a, b) => a + b);
//
//     return Scaffold(
//       backgroundColor: green1,
//       appBar: AppBar(
//         backgroundColor: green2,
//         title: Text(
//           "Purchase Receipt",
//           style: TextStyle(fontSize: 20, fontFamily: "kadwa", fontWeight: FontWeight.w500, color: white),
//         ),
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.chevron_left, size: 30, color: white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Padding(
//             //   padding: const EdgeInsets.only(left: 10, top: 15),
//             //   child: Text(
//             //     "Pickup Confirmation details",
//             //     style: TextStyle(fontSize: 22, fontFamily: "kadwa", fontWeight: FontWeight.w700),
//             //   ),
//             // ),
//             SizedBox(height: 25),
//             Padding(
//               padding: const EdgeInsets.only(left: 20,bottom: 5),
//               child: Text(
//                 "Garbage Items",
//                 style: TextStyle(fontSize: 20, fontFamily: "kadwa", fontWeight: FontWeight.w500),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 15, top: 10, right: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:BorderRadius.circular(10)
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: List.generate(selectedItems.length, (index) {
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           width: 125,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("• ${selectedItems[index]}", style: TextStyle(fontSize: 18)),
//                             ],
//                           ),
//                         ),
//
//                         Column(
//                           children: [
//                             Text("${kgValue[index]} Kg", style: TextStyle(fontSize: 18)),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Text("${prices[index].toStringAsFixed(2)} ₹", style: TextStyle(fontSize: 18)),
//                           ],
//                         ),
//                       ],
//                     );
//                   }),
//                 ),
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.only(left: 10, top: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Total Cost :",
//                     style: TextStyle(fontSize: 20, fontFamily: "kadwa"),
//                   ),
//                   SizedBox(width: 60,),
//
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: Text(
//                       "₹ ${totalCost.toStringAsFixed(2)}",
//                       style: TextStyle(fontFamily: "kadwa", fontSize: 20),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 15),
//             Divider(height: 2, color: line, thickness: 3),
//             SizedBox(height: 15),
//             Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Text(
//                 "Address",
//                 style: TextStyle(fontSize: 18, fontFamily: "kadwa", fontWeight: FontWeight.w500),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, top: 15),
//               child: Text(
//                 "Home\nHouse no 10, Kolasseri colony Perinthalmanna\nMalappuram 656565",
//                 style: TextStyle(fontFamily: "kadwa", fontSize: 15),
//               ),
//             ),
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 60),
//                 child: InkWell(
//                   onTap: () async {
//                     var wasteProvider = Provider.of<mainProvider>(context, listen: false);
//                     double totalPrice = await wasteProvider.calculateTotalPrice(selectedItems, kgValue);
//                     List<double> itemPrices = await wasteProvider.calculateItemPrices(selectedItems, kgValue);
//
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PurchaseReciept(
//                           prices: prices,
//                           selectedItems: selectedItems,
//                           kgValue: kgValue,
//
//                         ),
//                       ),
//                     );
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => RaiseComplaint()));
//                         },
//                         child: btn2(white, "Report", green2, 150, 40, 15, FontWeight.w500,"kadwa"),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => PickupDone()));
//                         },
//                         child: btn2(button, "Pickup", white, 160, 40, 15, FontWeight.w500,"kadwa"),
//                       ),
//                     ],
//                   ),
//                   // child: btn(button, "Confirm", white, width * 0.8, height * 0.06, 18, FontWeight.w500),
//                 ),
//               ),
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
//
//
//
//
//


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';
import 'package:trashbuddy/USER/pickupdone.dart';
import 'package:trashbuddy/USER/raisecomplaint.dart';
import 'package:trashbuddy/USER/reciept.dart';
import 'package:trashbuddy/CONSTANT/widget.dart';

class PickupConfirmation extends StatefulWidget {
  final List<double> kgValue;
  final List<String> selectedItems;
  final List<double> prices;
  final double totalPrice;

  PickupConfirmation({
    Key? key,
    required this.kgValue,
    required this.prices,
    required this.selectedItems,
    required this.totalPrice,
  }) : super(key: key);

  @override
  _PickupConfirmationState createState() => _PickupConfirmationState();
}

class _PickupConfirmationState extends State<PickupConfirmation> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  TimeOfDay? _selectedTime;
  String? _selectedDateString;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    double totalCost = widget.prices.reduce((a, b) => a + b);

    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text(
          "Purchase Receipt",
          style: TextStyle(fontSize: 20, fontFamily: "kadwa", fontWeight: FontWeight.w500, color: white),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left, size: 30, color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Text(
                "Garbage Items",
                style: TextStyle(fontSize: 20, fontFamily: "kadwa", fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(widget.selectedItems.length, (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 125,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("• ${widget.selectedItems[index]}", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text("${widget.kgValue[index]} Kg", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("${widget.prices[index].toStringAsFixed(2)} ₹", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Cost :",
                    style: TextStyle(fontSize: 20, fontFamily: "kadwa"),
                  ),
                  SizedBox(width: 60,),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "₹ ${totalCost.toStringAsFixed(2)}",
                      style: TextStyle(fontFamily: "kadwa", fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Divider(height: 2, color: line, thickness: 3),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Address",
                style: TextStyle(fontSize: 18, fontFamily: "kadwa", fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 15),
              child: Text(
                "Home\nHouse no 10, Kolasseri colony Perinthalmanna\nMalappuram 656565",
                style: TextStyle(fontFamily: "kadwa", fontSize: 15),
              ),
            ),
            SizedBox(height: 15),
            Divider(height: 2, color: line, thickness: 3),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Pickup Date and Time",
                style: TextStyle(fontSize: 18, fontFamily: "kadwa", fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  ElevatedButton(
                    child: Text(_selectedDay == null ? 'Select Date' : DateFormat('EEEE, MMMM d, y').format(_selectedDay!)),
                    onPressed: () async {
                      final DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: _focusedDay,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      );
                      if (date != null) {
                        setState(() {
                          _selectedDay = date;
                          _focusedDay = date;
                          _selectedDateString = DateFormat('EEEE, MMMM d, y').format(date);
                        });
                      }
                    },
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    child: Text(_selectedTime == null ? 'Select Time' : _selectedTime!.format(context)),
                    onPressed: () async {
                      final TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time != null) {
                        setState(() {
                          _selectedTime = time;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RaiseComplaint()));
                      },
                      child: btn2(white, "Report", green2, 150, 40, 15, FontWeight.w500, "kadwa"),
                    ),
                    InkWell(
                      onTap: () {
                        if (_selectedDay != null && _selectedTime != null) {
                          final DateTime selectedDateTime = DateTime(
                            _selectedDay!.year,
                            _selectedDay!.month,
                            _selectedDay!.day,
                            _selectedTime!.hour,
                            _selectedTime!.minute,
                          );

                          print('Selected Date and Time: $selectedDateTime');
                          print('Day: ${DateFormat('EEEE').format(selectedDateTime)}');
                          print('Date: ${DateFormat('MMMM d, y').format(selectedDateTime)}');
                          print('Time: ${_selectedTime!.format(context)}');

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PickupDone(
                                prices: widget.prices,
                                selectedItems: widget.selectedItems,
                                kgValue: widget.kgValue,
                                selectedDate: _selectedDateString!,
                                selectedTime: _selectedTime!.format(context),
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please select both date and time')),
                          );
                        }
                      },
                      child: btn2(button, "Pickup", white, 160, 40, 15, FontWeight.w500, "kadwa"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}