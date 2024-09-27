// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:trashbuddy/CONSTANT/Colors.dart';
// import 'package:trashbuddy/PROVIDER/mainprovider.dart';
// import 'package:trashbuddy/USER/devicelocation.dart';
// import 'package:trashbuddy/USER/dustbinlocation.dart';
//
// import 'binlocation.dart';
// import 'location.dart';
//
// class CollectWaste extends StatelessWidget {
//   CollectWaste({super.key});
//
//   List <String> image = [
//     "assets/img_11.png",
//     "assets/img_12.png",
//     "assets/img_13.png",
//   ];
//   List <String> name = [
//     "Metal",
//     "Aluminium",
//     "Plastic",
//   ];
//
//
//   List <String> waste = [
//     "Cloths",
//     "Wool",
//     "E-waste",
//     "Metal",
//     "Food Waste",
//     "Plastic",
//     "Glass",
//     "Books & Paper",
//   ];
//   List <String> price = [
//     "₹ 35",
//     "₹ 40",
//     "₹ 30",
//     "₹ 50",
//     "₹ 35",
//     "₹ 30",
//     "₹ 35",
//     "₹ 50",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery
//         .of(context)
//         .size
//         .width;
//     var height = MediaQuery
//         .of(context)
//         .size
//         .height;
//
//     Widget btn(Color myColor, String text, Color textmycolor, double width,
//         double height, double fonsize, FontWeight fntw) {
//       return Padding(
//         padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
//         child: Container(
//           height: height,
//           width: width,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: myColor,
//           ),
//           child: Center(
//               child: Text(
//                 text,
//                 style: TextStyle(
//                     fontSize: fonsize, fontWeight: fntw, color: textmycolor),
//               )),
//         ),
//       );
//     }
//
//     return Scaffold(
//         backgroundColor: green1,
//         appBar: AppBar(
//           backgroundColor: green2,
//           title: Text("Collect Waste", style: TextStyle(
//               fontSize: 19,
//               fontWeight: FontWeight.w500,
//               color: Colors.white,
//               fontFamily: "kadwa"
//           )),
//           centerTitle: true,
//           leading: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Icon(Icons.chevron_left, size: 30, color: Colors.white)),
//         ),
//         body: SingleChildScrollView(
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10, top: 20),
//                     child: Consumer<mainProvider>(
//                         builder: (context, value, child) {
//                           return Container(
//                             height: 130,
//                             width: 335,
//                             decoration: BoxDecoration(
//                                 color: Color(0xff75975e),
//                                 borderRadius: BorderRadiusDirectional
//                                     .circular(15)
//                             ),
//                             // Column()
//                             child:
//                             Column(
//                               // crossAxisAlignment: CrossAxisAlignment.center,
//                               // mainAxisAlignment:MainAxisAlignment.center,
//                               children: [
//                                 Text("Top 3 Waste Earnings",
//                                   style: TextStyle(
//                                     fontSize: 22,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                     fontFamily: "kadwa",
//                                   ),),
//                                 Container(
//                                   height: 95,
//                                   width: width/1.5,
//                                   child: ListView.builder(
//                                       itemCount: value.earningslist.length,
//                                       shrinkWrap: true,
//                                       physics: ScrollPhysics(),
//                                       scrollDirection: Axis.horizontal,
//                                       itemBuilder: (context, index) {
//                                         return Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Row(
//                                               children: [
//                                                 Column(
//
//                                                   // crossAxisAlignment: CrossAxisAlignment.center,
//                                                   // mainAxisAlignment:MainAxisAlignment.center,
//                                                   children: [
//                                                     Center(
//                                                       child:Container(
//                                                         height: 60,
//                                                         width: 60,
//                                                         child: ClipRRect(
//                                                           borderRadius: BorderRadius.circular(10),
//                                                           child: Image.network(
//                                                             value.earningslist[index].Photo,
//                                                             fit: BoxFit.cover,
//                                                           ),
//                                                         ),
//                                                       ),
//
//                                                     ),
//                                                     Text(value.earningslist[index].Name,
//                                                       style: TextStyle(
//                                                         fontSize: 12,
//                                                         fontFamily: "kadwa",
//                                                       ),),
//                                                   ],
//                                                 )
//
//
//
//
//                                               ]
//                                           ),
//                                         );
//                                       }
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }
//                     ),
//                   ),
//
//
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20, left: 15),
//                     child: Text("Services", style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: "kadwa",
//                     ),),
//                   ),
//                   SizedBox(height: 10,),
//                   Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Row(
//                           children: [
//                             Column(
//                               children: [
//                                 Consumer(
//                                   builder: (context,value,child) {
//                                     return Container(
//                                       height: 110,
//                                       width: 160,
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadiusDirectional
//                                               .circular(15)
//                                       ),
//                                       child: InkWell(
//                                           onTap: () {
//                                             Navigator.push(context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         LocationPage()));
//                                           },
//                                           child: Image(image: AssetImage(
//                                               'assets/img_16.png'),
//                                               fit: BoxFit.fill)),
//
//                                     );
//                                   }
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text("Pick Up", style: TextStyle(
//                                     fontSize: 18,
//                                     fontFamily: "kadwa",
//                                     fontWeight: FontWeight.w500
//                                 ),)
//                               ],
//                             ),
//                             SizedBox(width: 15,),
//                             Column(
//                               children: [
//                                 Container(
//                                   height: 110,
//                                   width: 160,
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadiusDirectional
//                                           .circular(15)
//                                   ),
//                                   child: InkWell(
//                                       onTap: () {
//                                         Navigator.push(context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     DeviceLocation()));
//                                       },
//                                       child: Image(image: AssetImage(
//                                           'assets/img_15.png'),
//                                           fit: BoxFit.fill)),
//
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text("Bin Center", style: TextStyle(
//                                     fontSize: 18,
//                                     fontFamily: "kadwa",
//                                     fontWeight: FontWeight.w500
//                                 ),)
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding:  EdgeInsets.only(left: 15),
//                     child: Text("Current Waste Price",style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: "kadwa",
//                     ),),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Center(
//                     child: Consumer<mainProvider>(
//                       builder: (context,value,child) {
//                         return Container(
//                           height: height/4.5,
//                           width: width/1.1,
//                           decoration: BoxDecoration(
//                             color: white,
//                             borderRadius: BorderRadius.circular(20)
//                           ),
//                           child:
//
//                           ListView.builder(
//                             padding: EdgeInsets.only(bottom: 0),
//                             itemCount: value.wastepricelist.length,
//                             physics: ScrollPhysics(),
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: const EdgeInsets.only(left: 5),
//                                 child:
//
//                                    Padding(
//                                      padding: const EdgeInsets.fromLTRB(15,10,20,0),
//                                      child: Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          Text(value.wastepricelist[index].Name,style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.w500,
//                                            fontFamily: "kadwa"
//                                                                            ),),
//                                          Text(value.wastepricelist[index].Price,style: TextStyle(
//                                              color: Color(0xffFFD700),
//                                              fontSize: 20,
//                                              fontWeight: FontWeight.w600,
//                                              fontFamily: "kadwa"
//
//                                          ),),
//                                        ],
//                                      ),
//                                    ),
//
//
//                               );
//                             },)
//                           ,
//                         );
//                       }
//                     ),
//                   )
//                 ]
//             )
//         )
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
 import 'package:trashbuddy/USER/devicelocation.dart';
import 'package:trashbuddy/USER/dustbinlocation.dart';
import 'package:trashbuddy/USER/location.dart';

import '../PROVIDER/LocationProvider.dart';
import '../PROVIDER/mainprovider.dart';

class CollectWaste extends StatelessWidget {
  CollectWaste({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text(
          "Collect Waste",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: "kadwa",
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left, size: 30, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildTopEarnings(context, width),
            buildServices(context),
            _buildCurrentWastePrice(context, width, height),
          ],
        ),
      ),
    );
  }

  Widget _buildTopEarnings(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Consumer<Mainprovider>(
        builder: (context, provider, child) {
          return Container(
            height: 130,
            width: 335,
            decoration: BoxDecoration(
              color: Color(0xff75975e),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(
                  "Top 3 Waste Earnings",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "kadwa",
                  ),
                ),
                Container(
                  height: 95,
                  width: width / 1.5,
                  child: ListView.builder(
                    itemCount: provider.earningslist.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  provider.earningslist[index].Photo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              provider.earningslist[index].Name,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "kadwa",
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Widget _buildServices(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.only(top: 20, left: 15),
  //         child: Text(
  //           "Services",
  //           style: TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //             fontFamily: "kadwa",
  //           ),
  //         ),
  //       ),
  //       SizedBox(height: 10),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 10),
  //         child: Row(
  //           children: [
  //             _buildServiceItem(
  //               context,
  //               'assets/img_16.png',
  //               'Pick Up',
  //                   () => Navigator.push(context, MaterialPageRoute(builder: (context) => LocationPage())),
  //             ),
  //             SizedBox(width: 15),
  //             _buildServiceItem(
  //               context,
  //               'assets/img_15.png',
  //               'Bin Center',
  //                   () => Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceLocation())),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
  Widget buildServices(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 15),
          child: Text(
            "Services",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "kadwa",
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              _buildServiceItem(
                context,
                'assets/img_16.png',
                'Pick Up',
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => LocationPage())),
              ),
              SizedBox(width: 15),
              _buildServiceItem(
                context,
                'assets/img_15.png',
                'Bin Center',
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceLocation())),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildServiceItem(BuildContext context, String imagePath, String label, VoidCallback onTap) {
    return Column(
      children: [
        Container(
          height: 110,
          width: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: onTap,
            child: Image(image: AssetImage(imagePath), fit: BoxFit.fill),
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontFamily: "kadwa",
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentWastePrice(BuildContext context, double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, top: 20),
          child: Text(
            "Current Waste Price",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: "kadwa",
            ),
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Consumer<Mainprovider>(
            builder: (context, provider, child) {
              return Container(
                height: height / 4.5,
                width: width / 1.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 0),
                  itemCount: provider.wastepricelist.length,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            provider.wastepricelist[index].Name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: "kadwa",
                            ),
                          ),
                          Text(
                            provider.wastepricelist[index].Price,
                            style: TextStyle(
                              color: Color(0xffFFD700),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: "kadwa",
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}



