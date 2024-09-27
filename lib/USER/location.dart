// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:trashbuddy/CONSTANT/Colors.dart';
// import 'package:trashbuddy/CONSTANT/widget.dart';
// import 'package:trashbuddy/PROVIDER/LocationProvider.dart';
// import 'package:trashbuddy/USER/proceed_pickup.dart';
//
// class LocationPage extends StatelessWidget {
//   const LocationPage({Key? key}) : super(key: key);
//
//   Widget btn({
//     required Color myColor,
//     required String text,
//     required Color textmycolor,
//     required double width,
//     required double height,
//     required double fonsize,
//     required FontWeight fntw,
//     required VoidCallback onTap,
//   }) {
//     return Padding(
//       padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
//       child: InkWell(
//         onTap: onTap,
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
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//
//
//     return Scaffold(
//       backgroundColor: green1,
//       appBar: AppBar(
//         backgroundColor: green2,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.chevron_left, size: 30, color: Colors.white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               width: width,
//               child: Image.asset(
//                 "assets/img_20.png",
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               width: width,
//               decoration: BoxDecoration(
//                 color: Color(0xff6FAE7B),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           "Device Location is off",
//                           style: TextStyle(
//                             fontSize: 19,
//                             color: Colors.white,
//                             fontFamily: "kadwa",
//                           ),
//                         ),
//                         SizedBox(width: 50),
//                         btn(
//                           myColor: Colors.white,
//                           text: "TURN ON",
//                           textmycolor: green2,
//                           width: 80,
//                           height: 33,
//                           fonsize: 14,
//                           fntw: FontWeight.w600,
//                           onTap: () async {
//                             try {
//                               bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//                               if (!serviceEnabled) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text('Location services are disabled. Please enable them.')),
//                                 );
//                                 return;
//                               }
//
//                               LocationPermission permission = await Geolocator.checkPermission();
//                               if (permission == LocationPermission.denied) {
//                                 permission = await Geolocator.requestPermission();
//                                 if (permission == LocationPermission.denied) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(content: Text('Location permissions are denied')),
//                                   );
//                                   return;
//                                 }
//                               }
//
//                               if (permission == LocationPermission.deniedForever) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text('Location permissions are permanently denied, we cannot request permissions.')),
//                                 );
//                                 return;
//                               }
//
//                               await locationProviders.getCurrentLocationAndSave();
//
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text('Location saved successfully')),
//                               );
//                             } catch (e) {
//                               print('Error getting or saving location: $e');
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text('Failed to get location: $e')),
//                               );
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       "Turning on Device Location for Accurate \nAddress",
//                       style: TextStyle(
//                         fontFamily: "kadwa",
//                         fontSize: 11,
//                         color: Color(0xffC3DDC8),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       "Add Address",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontFamily: "kadwa",
//                         color: Colors.white,
//                       ),
//                     ),
//                     AddText(context, "Apt, House number"),
//                     AddText(context, "Street name"),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 13),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => ProceedPickup()));
//                         },
//                         child: btn(
//                           myColor: Colors.white,
//                           text: "Continue",
//                           textmycolor: Color(0xff0A6D20),
//                           width: 300,
//                           height: 35,
//                           fonsize: 17,
//                           fntw: FontWeight.w500,
//                           onTap: () {},
//                         ),
//                       ),
//                     ),
//                     Consumer<LocationProvider>(
//                       builder: (context, locationProvider, child) {
//                         if (locationProvider.locationData != null) {
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(height: 20),
//                               Text(
//                                 'Current Location:',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               Text(
//                                 locationProvider.locationData!.name,
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               Text(
//                                 'Lat: ${locationProvider.locationData!.latitude.toStringAsFixed(4)}, '
//                                     'Lon: ${locationProvider.locationData!.longitude.toStringAsFixed(4)}',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           );
//                         } else {
//                           return SizedBox.shrink();
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/CONSTANT/widget.dart';
import 'package:trashbuddy/PROVIDER/mainProvider.dart';
import 'package:trashbuddy/USER/proceed_pickup.dart';

import '../PROVIDER/locationProvider.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  Widget btn({
    required Color myColor,
    required String text,
    required Color textmycolor,
    required double width,
    required double height,
    required double fonsize,
    required FontWeight fntw,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
      child: InkWell(
        onTap: onTap,
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
              style: TextStyle(fontSize: fonsize, fontWeight: fntw, color: textmycolor),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var locationService = Provider.of<LocationPro>(context, listen: false);

    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left, size: 30, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              child: Image.asset(
                "assets/img_20.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                color: Color(0xff6FAE7B),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10,right: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ... (previous code remains unchanged)
                    Row(
                      children: [
                        Text(
                          "Device Location is off",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontFamily: "kadwa",
                          ),
                        ),
                        SizedBox(width: 50),
                        btn(
                          myColor: Colors.white,
                          text: "TURN ON",
                          textmycolor: green2,
                          width: width/4.5,
                          height: height/18
                          ,
                          fonsize: 14,
                          fntw: FontWeight.w600,
                          onTap: () async {
                            try {
                              bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
                              if (!serviceEnabled) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Location services are disabled. Please enable them.')),
                                );
                                return;
                              }

                              LocationPermission permission = await Geolocator.checkPermission();
                              if (permission == LocationPermission.denied) {
                                permission = await Geolocator.requestPermission();
                                if (permission == LocationPermission.denied) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Location permissions are denied')),
                                  );
                                  return;
                                }
                              }

                              if (permission == LocationPermission.deniedForever) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Location permissions are permanently denied, we cannot request permissions.')),
                                );
                                return;
                              }

                              await locationService.getCurrentLocationAndSave();

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Location saved successfully')),
                              );
                            } catch (e) {
                              print('Error getting or saving location: $e');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Failed to get location: $e')),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Turning on Device Location for Accurate \nAddress",
                      style: TextStyle(
                        fontFamily: "kadwa",
                        fontSize: 11,
                        color: Color(0xffC3DDC8),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Add Address",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "kadwa",
                        color: Colors.white,
                      ),
                    ),

                    AddText(context, "Apt, House number", controller: locationService.aptController),
                    AddText(context, "Street name", controller: locationService.streetController),


                    Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: InkWell(
                            onTap: () {
                            },
                            child: btn(
                              myColor: Colors.white,
                              text: "Continue",
                              textmycolor: Color(0xff0A6D20),
                              width: 300,
                              height: 35,
                              fonsize: 17,
                              fntw: FontWeight.w500,
                              onTap: () {
                                print('Apt, House number: ${locationService.aptController.text}');
                                print('Street name: ${locationService.streetController.text}');
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProceedPickup()));

                              },
                            ),
                          ),
                        ),


                    Consumer<LocationPro>(
                      builder: (context, locationState, child) {
                        if (locationState.locationData != null) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                'Current Location:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                locationState.locationData!.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Lat: ${locationState.locationData!.latitude.toStringAsFixed(4)}, '
                                    'Lon: ${locationState.locationData!.longitude.toStringAsFixed(4)}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      },
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

