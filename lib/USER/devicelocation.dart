// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:trashbuddy/CONSTANT/Colors.dart';
// import '../PROVIDER/locationPro.dart';
//  import 'dustbinlocation.dart';
//
// class DeviceLocation extends StatefulWidget {
//   const DeviceLocation({Key? key}) : super(key: key);
//
//   @override
//   _DeviceLocationState createState() => _DeviceLocationState();
// }
//
// class _DeviceLocationState extends State<DeviceLocation> {
//   bool _locationFetched = false;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<LocationPro>(context, listen: false).checkLocationStatus();
//     });
//   }
//
//   Widget btn(Color myColor, String text, Color textmycolor, double width, double height, double fonsize, FontWeight fntw, String fontFamily) {
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
//             style: TextStyle(
//               fontSize: fonsize,
//               fontWeight: fntw,
//               color: textmycolor,
//               fontFamily: fontFamily,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var locationService = Provider.of<LocationPro>(context, listen: false);
//
//     return Scaffold(
//       backgroundColor: green1,
//       appBar: AppBar(
//         backgroundColor: green2,
//         title: Text(
//           "Location of Dustbin",
//           style: TextStyle(
//             color: white,
//             fontFamily: "kadwa",
//             fontSize: 21,
//           ),
//         ),
//         centerTitle: true,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.chevron_left, size: 30, color: white),
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 200, left: 10),
//             child: Image(image: AssetImage('assets/img_25.png'), height: 80),
//           ),
//           SizedBox(height: 20),
//           Center(
//             child: Text(
//               _locationFetched ? "Location fetched successfully" : "Device Location is off",
//               style: TextStyle(
//                 fontSize: 22,
//                 fontFamily: "kadwa",
//               ),
//             ),
//           ),
//           if (!_locationFetched)
//             Text(
//               "Turn on Device Location for accurate address",
//               style: TextStyle(
//                 fontSize: 13,
//                 color: grey,
//                 fontFamily: "kadwa",
//               ),
//             ),
//           SizedBox(height: 40),
//           InkWell(
//             onTap: () async {
//               if (!_locationFetched) {
//                 try {
//                   await locationService.enableLocation();
//                   await locationService.getCurrentLocationAndSave();
//                   setState(() {
//                     _locationFetched = true;
//                   });
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Location fetched successfully')),
//                   );
//                 } catch (e) {
//                   print('Error getting or saving location: $e');
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Failed to get location: $e')),
//                   );
//                 }
//               } else {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => DustBinLocation()));
//               }
//             },
//             child: btn(
//                 button,
//                 _locationFetched ? "Continue" : "Turn on",
//                 white,
//                 180,
//                 40,
//                 18,
//                 FontWeight.w500,
//                 "kadwa"
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import '../PROVIDER/locationPro.dart';
import 'dustbinlocation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeviceLocation extends StatefulWidget {
  const DeviceLocation({Key? key}) : super(key: key);

  @override
  _DeviceLocationState createState() => _DeviceLocationState();
}

class _DeviceLocationState extends State<DeviceLocation> {
  bool _locationFetched = false;
  bool _locationTurnedOn = false;
  List<Map<String, dynamic>> _nearbyLocations = [];
  bool _isLoading = false;

  final String _apiKey = 'AIzaSyC-yP5d2RHsgvIGBsJjtI0Jkv4y06uQH00';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocationPro>(context, listen: false).checkLocationStatus();
    });
  }
  Future<List<Map<String, dynamic>>> getNearbyDumpingLocations(double lat, double lon) async {
    final overpassUrl = 'https://overpass-api.de/api/interpreter';
    final radius = 50000; // Increased radius to 10km
    final query = '''
    [out:json];
    (
      node["amenity"="waste_disposal"](around:$radius,$lat,$lon);
      way["amenity"="waste_disposal"](around:$radius,$lat,$lon);
      relation["amenity"="waste_disposal"](around:$radius,$lat,$lon);
      node["amenity"="recycling"](around:$radius,$lat,$lon);
      way["amenity"="recycling"](around:$radius,$lat,$lon);
      relation["amenity"="recycling"](around:$radius,$lat,$lon);
      node["landuse"="landfill"](around:$radius,$lat,$lon);
      way["landuse"="landfill"](around:$radius,$lat,$lon);
      relation["landuse"="landfill"](around:$radius,$lat,$lon);
    );
    out center;
  ''';

    try {
      final response = await http.post(Uri.parse(overpassUrl), body: query);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final elements = data['elements'] as List;

        return elements.map((element) {
          final coords = element['type'] == 'node'
              ? {'lat': element['lat'], 'lon': element['lon']}
              : {'center': element['center'] ?? {'lat': element['lat'], 'lon': element['lon']}};

          final elementLat = coords['lat'] ?? coords['center']['lat'];
          final elementLon = coords['lon'] ?? coords['center']['lon'];

          final distance = Geolocator.distanceBetween(lat, lon, elementLat, elementLon);

          return {
            'name': element['tags']['name'] ?? getDefaultName(element['tags']['amenity'] ?? element['tags']['landuse']),
            'latitude': elementLat,
            'longitude': elementLon,
            'distance': (distance / 1000).toStringAsFixed(2) + ' km',
            'type': element['tags']['amenity'] ?? element['tags']['landuse'] ?? 'Unknown',
          };
        }).toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching nearby locations: $e');
      return [];
    }
  }

  String getDefaultName(String type) {
    switch (type) {
      case 'waste_disposal':
        return 'Waste Disposal Site';
      case 'recycling':
        return 'Recycling Center';
      case 'landfill':
        return 'Landfill';
      default:
        return 'Waste Management Site';
    }
  }
  // Future<void> _getNearbyDumpingLocations(
  //     double latitude, double longitude) async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //
  //   try {
  //     final response = await http.get(Uri.parse(
  //         'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=5000&keyword=garbage%20dump&key=$_apiKey'));
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       if (data['status'] == 'OK') {
  //         final List<dynamic> results = data['results'];
  //         setState(() {
  //           _nearbyLocations = results
  //               .map((place) => {
  //                     'name': place['name'],
  //                     'address': place['vicinity'],
  //                     'distance':
  //                         '${(Geolocator.distanceBetween(latitude, longitude, place['geometry']['location']['lat'], place['geometry']['location']['lng']) / 1000).toStringAsFixed(2)} km',
  //                   })
  //               .toList();
  //         });
  //       } else {
  //         throw Exception('API returned status: ${data['status']}');
  //       }
  //     } else {
  //       throw Exception('Failed to load nearby locations');
  //     }
  //   } catch (e) {
  //     print('Error fetching nearby locations: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to fetch nearby locations: $e')),
  //     );
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  Widget btn(Color myColor, String text, Color textmycolor, double width,
      double height, double fonsize, FontWeight fntw, String fontFamily) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: myColor,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fonsize,
            fontWeight: fntw,
            color: textmycolor,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var locationService = Provider.of<LocationPro>(context, listen: false);

    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text(
          "Location of Dustbin",
          style: TextStyle(
            color: white,
            fontFamily: "kadwa",
            fontSize: 21,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left, size: 30, color: white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10),
            child: Image(image: AssetImage('assets/img_25.png'), height: 80),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              _locationTurnedOn
                  ? "Location is turned on"
                  : "Device Location is off",
              style: TextStyle(
                fontSize: 22,
                fontFamily: "kadwa",
              ),
            ),
          ),
          if (!_locationTurnedOn)
            Text(
              "Turn on Device Location for accurate address",
              style: TextStyle(
                fontSize: 13,
                color: grey,
                fontFamily: "kadwa",
              ),
            ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
            child: InkWell(
              onTap: () async {
                if (!_locationTurnedOn) {
                  // ... (your existing code for turning on location)
                  if (!_locationTurnedOn) {
                    try {
                      bool serviceEnabled =
                      await Geolocator.isLocationServiceEnabled();
                      if (!serviceEnabled) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Location services are disabled. Please enable them.')),
                        );
                        return;
                      }

                      LocationPermission permission =
                      await Geolocator.checkPermission();
                      if (permission == LocationPermission.denied) {
                        permission = await Geolocator.requestPermission();
                        if (permission == LocationPermission.denied) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Location permissions are denied')),
                          );
                          return;
                        }
                      }

                      if (permission == LocationPermission.deniedForever) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Location permissions are permanently denied, we cannot request permissions.')),
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
                    setState(() {
                      _locationTurnedOn = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Location turned on successfully')),
                    );
                  }
                } else {
                  setState(() {
                    _isLoading = true;
                  });
                  try {
                    Position position = await Geolocator.getCurrentPosition();
                    _nearbyLocations = await getNearbyDumpingLocations(position.latitude, position.longitude);
                    if (_nearbyLocations.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('No nearby waste disposal locations found. Try increasing the search radius.')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DustBinLocation(nearbyLocations: _nearbyLocations),
                        ),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error fetching locations: $e')),
                    );
                  } finally {
                    setState(() {
                      _isLoading = false;
                    });
                  }
                }
              },
              child: btn(
                  button,
                  _locationTurnedOn ? "Continue" : "Turn on Location",
                  white,
                  220,
                  40,
                  18,
                  FontWeight.w500,
                  "kadwa"),
            ),
          ),
          if (_isLoading) CircularProgressIndicator(),
        ],
      ),
    );
  }
}
