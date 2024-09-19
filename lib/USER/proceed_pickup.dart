import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/USER/pickup_confirmation.dart';
import '../PROVIDER/mainprovider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';
//
// class ProceedPickup extends StatefulWidget {
//   ProceedPickup({super.key});
//
//   @override
//   _ProceedPickupState createState() => _ProceedPickupState();
// }
//
// class _ProceedPickupState extends State<ProceedPickup> {
//   SfRangeValues _values = SfRangeValues(20.0, 50.0);
//
//   List<String> _garbage = [
//     "Cloths",
//     "Wool",
//     "E-waste",
//     "Metal",
//     "Food waste",
//     "Plastic",
//     "Glass",
//     "Books and Paper",
//   ];
//
//   List<String> _weight = [
//     "1 kg",
//     "2 kg",
//     "3 kg",
//     "4 kg",
//     "5 kg",
//     "6 kg",
//     "7 kg",
//     "8 kg",
//   ];
//
//   Widget btn(Color myColor, String text, Color textmycolor, double width, double height, double fontsize, FontWeight fontWeight, String fontFamily) {
//     return Padding(
//       padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
//       child: Container(
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: myColor,
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(fontSize: fontsize, fontWeight: fontWeight, color: textmycolor, fontFamily: fontFamily),
//           ),
//         ),
//       ),
//     );
//   }
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
//         title: Padding(
//           padding: const EdgeInsets.only(right: 20),
//           child: Text(
//             "Schedule Garbage Pickup",
//             style: TextStyle(fontSize: 20, fontFamily: "kadwa", fontWeight: FontWeight.w500, color: white),
//           ),
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
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, top: 20),
//               child: Text(
//                 "Add garbage Item",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: "kadwa"),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             GridView.builder(
//               shrinkWrap: true,
//               physics: ScrollPhysics(),
//               itemCount: _garbage.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 0,
//                 mainAxisSpacing: 6,
//                 mainAxisExtent: 45,
//               ),
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: () {
//                     _showDialog(context);
//                   },
//                   child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: white,
//                       border: Border.all(color: Colors.black),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Consumer<mainProvider>(
//                         builder: (context, val, child) {
//                           return Center(
//                             child: Column(
//                               children: [
//                                 Text(
//                                   _garbage[index],
//                                   style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Divider(
//               height: 2,
//               color: line,
//               thickness: 2,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 15, top: 10, right: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Address",
//                     style: TextStyle(fontSize: 21, fontFamily: "kadwa"),
//                   ),
//                   Text(
//                     "Edit",
//                     style: TextStyle(fontSize: 17, color: green2, fontFamily: "kadwa"),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, top: 10),
//               child: Text(
//                 "Home\nHouse no 10, Kolasseri colony Perinthalmanna\nMalappuram 656565",
//                 style: TextStyle(fontFamily: "kadwa", fontSize: 14),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Image(
//                   image: AssetImage('assets/img_23.png'),
//                   height: 180,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Center(
//               child: Consumer<mainProvider>(
//                 builder: (context,value,child) {
//                   return InkWell(
//                     onTap: () {
//
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => PickupConfirmation(kgValue:value.kgValue ,)));
//                     },
//                     child: btn(button, "Proceed", white, 320, 40, 18, FontWeight.w500, "kadwa"),
//                   );
//                 }
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.zero,
//           title: Text('Range Values'),
//           content:  SizedBox(
//             height: 150,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Consumer<mainProvider>(
//                     builder: (context,val,child) {
//                       return Column(
//                         children: [
//                           Text(
//                               "Kg: " + val.kgValue.toString(),
//                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: green2)
//                           ),
//
//                           Slider(
//                             activeColor: button,
//                             label: "Select kg",
//                             value: val.KG.toDouble(),
//                             onChanged: (value) {
//                               val.changeValue(value.toInt());
//                               // quantity=val.kgValue.toString();
//                             },
//                             min:0,
//                             divisions: 20,
//                             max: 20,
//                           ),
//
//                         ],
//                       );
//                     }
//                 ),
//                 SizedBox(height: 20,),
//                 // Consumer<mainProvider>(
//                 //   builder: (context, sliderProvider, child) {
//                 //     double weight=0.0;
//                 //     print("vfvfvfvfv"+sliderProvider.value.toString());
//                 //
//                 //     return Text(
//                 //       'Weight: ${sliderProvider.value.toStringAsFixed(1)} kg',
//                 //     );
//                 //   },
//                 // ),
//               ],
//             ),
//           ),
//           // elevation: double.minPositive,
//
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


class ProceedPickup extends StatefulWidget {
  ProceedPickup({super.key});

  @override
  _ProceedPickupState createState() => _ProceedPickupState();
}

class _ProceedPickupState extends State<ProceedPickup> {
  SfRangeValues _values = SfRangeValues(20.0, 50.0);
  List<int> _selectedIndices = [];
  List<String> _garbage = [
    "Cloths",
    "Wool",
    "E-waste",
    "Metal",
    "Food waste",
    "Plastic",
    "Glass",
    "Books and Paper",
  ];
  List<double> _weights = List.filled(8, 0.0); // List to store weights for each item

  Widget btn(Color myColor, String text, Color textmycolor, double width, double height, double fontsize, FontWeight fontWeight, String fontFamily) {
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
            style: TextStyle(fontSize: fontsize, fontWeight: fontWeight, color: textmycolor, fontFamily: fontFamily),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            "Schedule Garbage Pickup",
            style: TextStyle(fontSize: 20, fontFamily: "kadwa", fontWeight: FontWeight.w500, color: white),
          ),
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Add garbage Item",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: "kadwa"),
              ),
            ),
            SizedBox(height: 10),
            Consumer<mainProvider>(
              builder: (context,val,child) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: val.wastepricelist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 6,
                    mainAxisExtent: 45,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (_selectedIndices.contains(index)) {
                            _selectedIndices.remove(index);
                          } else {
                            _selectedIndices.add(index);
                          }
                        });
                        _showDialog(context, index);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: _selectedIndices.contains(index) ? Colors.blue : white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              val.wastepricelist[index].Name,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            ),
            SizedBox(height: 20),
            Divider(
              height: 2,
              color: line,
              thickness: 2,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Address",
                    style: TextStyle(fontSize: 21, fontFamily: "kadwa"),
                  ),
                  Text(
                    "Edit",
                    style: TextStyle(fontSize: 17, color: green2, fontFamily: "kadwa"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Home\nHouse no 10, Kolasseri colony Perinthalmanna\nMalappuram 656565",
                style: TextStyle(fontFamily: "kadwa", fontSize: 14),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image(
                  image: AssetImage('assets/img_23.png'),
                  height: 180,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Consumer<mainProvider>(
                builder: (context, value, child) {
                  return InkWell(
                    onTap: () {
                      List<double> prices = _selectedIndices.map((index) {
                        return _weights[index] * double.parse(value.wastepricelist[index].Price);
                      }).toList();

                      double totalPrice = prices.reduce((a, b) => a + b);


                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PickupConfirmation(
                            kgValue: _selectedIndices.map((index) => _weights[index]).toList(),
                            selectedItems: _selectedIndices.map((index) => value.wastepricelist[index].Name).toList(),
                            prices: _selectedIndices.map((index) => _weights[index] * double.parse(value.wastepricelist[index].Price)).toList(),
                            totalPrice: totalPrice,

                          ),
                        ),
                      );
                    },
                    child: btn(button,"Proceed", white, 320, 40, 18, FontWeight.w500, "kadwa"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {

        double currentWeight = _weights[index];
        return StatefulBuilder(

          builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              title: Text('Select Weight for ${_garbage[index]}'),
              content: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kg: ${currentWeight.toStringAsFixed(1)}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: green2),
                    ),
                    Slider(
                      activeColor: button,
                      label: "Select kg",
                      value: currentWeight,
                      onChanged: (value) {
                        setState(() {
                          currentWeight = value;
                        });
                      },
                      min: 0,
                      divisions: 20,
                      max: 20,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    setState(() {
                      _weights[index] = currentWeight; // Update the weight in the list
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

}
