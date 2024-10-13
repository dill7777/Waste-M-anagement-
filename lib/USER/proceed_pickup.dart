import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/USER/pickup_confirmation.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../PROVIDER/locationPro.dart';
import '../PROVIDER/mainprovider.dart';

class ProceedPickup extends StatefulWidget {
  final String aptNumber;
  final String streetController;
  final Uint8List? mapScreenshot;

  ProceedPickup({
    Key? key,
    required this.aptNumber,
    required this.streetController,
    this.mapScreenshot,
  }) : super(key: key);

  @override
  _ProceedPickupState createState() => _ProceedPickupState();
}

class _ProceedPickupState extends State<ProceedPickup> {
  GoogleMapController? _mapController;
  Uint8List? _mapScreenshot;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _captureMapScreen();
    });
  }

  Future<void> _captureMapScreen() async {
    await Future.delayed(Duration(seconds: 1)); // Wait for the map to load
    if (_mapController != null) {
      final ui.Image image = await _mapController!.takeSnapshot() as ui.Image; // Cast to ui.Image
      final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData != null) {
        setState(() {
          _mapScreenshot = byteData.buffer.asUint8List();
        });
      }
    }
  }
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
            Consumer<Mainprovider>(
                builder: (context, mainPro, child) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: mainPro.wastepricelist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 6,
                      mainAxisExtent: 45,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          mainPro.toggleSelectedIndex(index);
                          _showDialog(context, index, mainPro);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: mainPro.selectedIndices.contains(index) ? Colors.blue : white,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                mainPro.wastepricelist[index].Name,
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
            Consumer<LocationPro>(
                builder: (context, locationService, child) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Home\n${widget.aptNumber}${widget.streetController}",
                      style: const TextStyle(fontFamily: "kadwa", fontSize: 14),
                    ),
                  );
                }
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: Consumer<LocationPro>(
                  builder: (context, locationService, child) {
                    if (locationService.locationData != null) {
                      return Stack(
                        children: [
                          GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                locationService.locationData!.latitude,
                                locationService.locationData!.longitude,
                              ),
                              zoom: 15,
                            ),
                            onMapCreated: (controller) {
                              _mapController = controller;
                              _captureMapScreen();
                            },
                            markers: {
                              Marker(
                                markerId: MarkerId('userLocation'),
                                position: LatLng(
                                  locationService.locationData!.latitude,
                                  locationService.locationData!.longitude,
                                ),
                              ),
                            },
                          ),
                          if (_mapScreenshot != null)
                            Image.memory(
                              _mapScreenshot!,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 180,
                            ),
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Consumer<Mainprovider>(
                  builder: (context, mainPro, child) {
                    return InkWell(
                      onTap: () {
                        List<double> prices = mainPro.selectedIndices.map((index) {
                          return mainPro.weights[index] * double.parse(mainPro.wastepricelist[index].Price);
                        }).toList();

                        double totalPrice = prices.reduce((a, b) => a + b);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PickupConfirmation(
                              kgValue: mainPro.selectedIndices.map((index) => mainPro.weights[index]).toList(),
                              selectedItems: mainPro.selectedIndices.map((index) => mainPro.wastepricelist[index].Name).toList(),
                              prices: mainPro.selectedIndices.map((index) => mainPro.weights[index] * double.parse(mainPro.wastepricelist[index].Price)).toList(),
                              totalPrice: totalPrice,
                              aptNumber: widget.aptNumber,
                              streetController: widget.streetController,
                              mapScreenshot: _mapScreenshot,
                            ),
                          ),
                        );
                      },
                      child: btn(button, "Proceed", white, 320, 40, 18, FontWeight.w500, "kadwa"),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, int index, Mainprovider mainPro) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              title: Text('Select Weight for ${mainPro.wastepricelist[index].Name}'),
              content: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kg: ${mainPro.weights[index].toStringAsFixed(1)}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: green2),
                    ),
                    Slider(
                      activeColor: button,
                      label: "Select kg",
                      value: mainPro.weights[index],
                      onChanged: (value) {
                        setState(() {
                          mainPro.updateWeight(index, value);
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
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:trashbuddy/CONSTANT/Colors.dart';
// import 'package:trashbuddy/USER/pickup_confirmation.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
// import 'dart:typed_data'; // for handling image data
//
// import '../PROVIDER/locationPro.dart';
// import '../PROVIDER/mainprovider.dart';
//
// class ProceedPickup extends StatefulWidget {
//   String aptNumber;
//   String streetController;
//   ProceedPickup({super.key, required this.aptNumber, required this.streetController});
//
//   @override
//   _ProceedPickupState createState() => _ProceedPickupState();
// }
//
// class _ProceedPickupState extends State<ProceedPickup> {
//   GoogleMapController? _mapController;
//   Uint8List? _mapImage; // Variable to store the screenshot
//
//   SfRangeValues _values = SfRangeValues(20.0, 50.0);
//   List<int> _selectedIndices = [];
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
//   List<double> _weights = List.filled(8, 0.0); // List to store weights for each item
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
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, top: 20),
//               child: Text(
//                 "Add garbage Item",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: "kadwa"),
//               ),
//             ),
//             SizedBox(height: 10),
//             Consumer<Mainprovider>(builder: (context, mainPro, child) {
//               return GridView.builder(
//                 shrinkWrap: true,
//                 physics: ScrollPhysics(),
//                 itemCount: mainPro.wastepricelist.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   crossAxisSpacing: 0,
//                   mainAxisSpacing: 6,
//                   mainAxisExtent: 45,
//                 ),
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () {
//                       mainPro.toggleSelectedIndex(index);
//                       _showDialog(context, index, mainPro);
//                     },
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: mainPro.selectedIndices.contains(index) ? Colors.blue : white,
//                         border: Border.all(color: Colors.black),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Center(
//                           child: Text(
//                             mainPro.wastepricelist[index].Name,
//                             style: TextStyle(fontSize: 10, color: Colors.black),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),
//             SizedBox(height: 20),
//             Divider(
//               height: 2,
//               color: line,
//               thickness: 2,
//             ),
//             SizedBox(height: 10),
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
//             Consumer<LocationPro>(builder: (context, locationService, child) {
//               return Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Text(
//                   "Home\n" + widget.aptNumber + widget.streetController,
//                   style: const TextStyle(fontFamily: "kadwa", fontSize: 14),
//                 ),
//               );
//             }),
//             SizedBox(height: 10),
//             Center(
//               child: Container(
//                 height: 180,
//                 width: width,
//                 child: Consumer<LocationPro>(
//                   builder: (context, locationService, child) {
//                     if (locationService.locationData != null) {
//                       return GoogleMap(
//                         initialCameraPosition: CameraPosition(
//                           target: LatLng(
//                             locationService.locationData!.latitude,
//                             locationService.locationData!.longitude,
//                           ),
//                           zoom: 15,
//                         ),
//                         onMapCreated: (controller) {
//                           _mapController = controller;
//                         },
//                         markers: {
//                           Marker(
//                             markerId: MarkerId('userLocation'),
//                             position: LatLng(
//                               locationService.locationData!.latitude,
//                               locationService.locationData!.longitude,
//                             ),
//                           ),
//                         },
//                       );
//                     } else {
//                       return Center(child: CircularProgressIndicator());
//                     }
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 15),
//             Center(
//               child: Consumer<Mainprovider>(builder: (context, mainPro, child) {
//                 return InkWell(
//                   onTap: () async {
//                     // Take screenshot of the map
//                     if (_mapController != null) {
//                       _mapImage = await _mapController!.takeSnapshot();
//                     }
//
//                     List<double> prices = mainPro.selectedIndices.map((index) {
//                       return mainPro.weights[index] * double.parse(mainPro.wastepricelist[index].Price);
//                     }).toList();
//
//                     double totalPrice = prices.reduce((a, b) => a + b);
//
//                     // Pass the screenshot and other data to PickupConfirmation
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PickupConfirmation(
//                           kgValue: mainPro.selectedIndices.map((index) => mainPro.weights[index]).toList(),
//                           selectedItems: mainPro.selectedIndices.map((index) => mainPro.wastepricelist[index].Name).toList(),
//                           prices: mainPro.selectedIndices.map((index) => mainPro.weights[index] * double.parse(mainPro.wastepricelist[index].Price)).toList(),
//                           totalPrice: totalPrice,
//                           aptNumber: widget.aptNumber,
//                           streetController: widget.streetController,
//                           mapScreenshot: _mapImage, // Pass the screenshot
//                         ),
//                       ),
//                     );
//                   },
//                   child: btn(button, "Proceed", white, 320, 40, 18, FontWeight.w500, "kadwa"),
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showDialog(BuildContext context, int index, Mainprovider mainPro) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               contentPadding: EdgeInsets.zero,
//               title: Text('Select Weight for ${mainPro.wastepricelist[index].Name}'),
//               content: SizedBox(
//                 height: 150,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Kg: ${mainPro.weights[index].toStringAsFixed(1)}",
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: green2),
//                     ),
//                     Slider(
//                       activeColor: button,
//                       label: "Select kg",
//                       value: mainPro.weights[index],
//                       onChanged: (value) {
//                         setState(() {
//                           mainPro.updateWeight(index, value);
//                         });
//                       },
//                       min: 0,
//                       divisions: 20,
//                       max: 20,
//                     ),
//                   ],
//                 ),
//               ),
//               actions: <Widget>[
//                 TextButton(
//                   child: Text('OK'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }
