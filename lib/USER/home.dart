import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';

import '../PROVIDER/mainprovider.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  List <String> img = [
    "assets/img_2.png",
    "assets/img_7.png",
    "assets/img_8.png",
    "assets/img_9.png",
  ];
List <String> item = [
   "Plastic",
   "Glass",
   "Metal",
   "Organic",
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Mainprovider>(context, listen: false).getCategory();
    });
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Widget btn(Color myColor, String text, Color textmycolor, double width,double height,double fonsize,FontWeight fntw) {
      return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 0, left: 5, right: 5),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: myColor,
          ),
          child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: fonsize, fontWeight:fntw, color: textmycolor),
              )),

        ),
      );
    }


    return Scaffold(
      backgroundColor: green1,
     appBar: AppBar(
       // automaticallyImplyLeading: false,
       backgroundColor: green2,
       title: Column(
         children: [
           Text("Hey , Amal",style: TextStyle(
             color: Color(0xffC3DDC8),fontSize: 15,
             fontFamily: "kadwa",
           ),),
           Text("Start Recycling Today !",style: TextStyle(
             fontFamily: "kadwa",fontSize: 16,
             color: Colors.white
           ),),
         ],
       ),
       centerTitle: true,
       leading: Padding(
         padding: const EdgeInsets.only(left: 7),
         child: CircleAvatar(
           radius: 20,
           backgroundImage: AssetImage("assets/img3.png"),
    
         ),
       ),
       actions: [
         Icon(Icons.notifications_none_rounded,color: Colors.white,size: 32,)
       ],
    
     ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 40),
              child: Container(
                height: 100,
                width: 340,
                decoration: BoxDecoration(
                  color: green3,
                  borderRadius: BorderRadiusDirectional.circular(15),
            
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Padding(
                           padding: const EdgeInsets.only(left: 8.0),
                           child: Text("₹999",style: TextStyle(
                             fontSize: 18,
                             fontFamily: "kadwa",
                             fontWeight: FontWeight.bold,
                           ),),
                         ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Total waste collected",style: TextStyle(
                              fontSize: 16,
                              fontFamily: "kadwa",
                              color: Color(0xffC3DDC8)
                            ),),
                          ),
                        ],
                      ),
                      SizedBox(width: 60,),
                      Column(
                        children: [
                          Text("10 %",style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: "kadwa"
                          ),),
                          btn(green2, "177 Items", Colors.white, 75, 32, 12, FontWeight.w500),
                        ],
                      )
                    ],
                  ),
                ) ,
              ),
            
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 15),
              child: Text("Waste Category",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "kadwa",

              ),),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10,top: 10),
            //   child: Row(
            //     children: [
            //       Image(image: AssetImage('assets/img_2.png'),height: 60,),SizedBox(width: 20,),
            //       Image(image: AssetImage('assets/img_7.png'),height: 60,),SizedBox(width: 20,),
            //       Image(image: AssetImage('assets/img_8.png'),height: 60,),SizedBox(width: 20,),
            //       Image(image: AssetImage('assets/img_9.png'),height: 60,),
            //
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 100,
              width: width,
              child: Consumer<Mainprovider>(
                  builder: (context, value, child) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: value.categorylist.length,
                        itemBuilder: (context, index) {
                          print("Category list length: ${value.categorylist.length}");
                          return Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 27,
                                  backgroundImage: NetworkImage(value.categorylist[index].Photo),
                                ),
                                Text(
                                  value.categorylist[index].Name,
                                  style: TextStyle(fontSize: 10, fontFamily: "kadwa"),
                                ),
                              ],
                            ),
                          );
                        }
                    );
                  }
              ),
            ),
            // // Padding(
            // //   padding: const EdgeInsets.only(left: 15.0),
            // //   child: Row(
            // //     children: [
            // //       Text("Nearby Bin Station",style: TextStyle(
            // //         fontSize: 18,
            // //         fontWeight: FontWeight.bold,
            // //         fontFamily: "kadwa"
            // //       ),),
            // //       SizedBox(width: 110,),
            // //       Text("See All",style: TextStyle(
            // //         fontSize: 16,
            // //         fontWeight: FontWeight.w500,
            // //         fontFamily: "kadwa",
            // //         color: green2,
            // //       ),)
            // //     ],
            // //   ),
            // // ),
            // // ListView.builder(itemCount: 3,
            // //   shrinkWrap: true,
            // //     physics: ScrollPhysics(),
            // //   itemBuilder: (context, index) {
            // //   return Container(
            // //     height: 120,
            // //     width: width,
            // //     decoration: BoxDecoration(
            // //       color: green1,
            // //
            // //     ),
            // //     child: Row(
            // //       mainAxisAlignment: MainAxisAlignment.start,
            // //       children: [
            // //         Container(
            // //             margin: EdgeInsets.symmetric(horizontal: 15),
            // //             height: 90,
            // //             width: 80,
            // //
            // //             child: Image(image: AssetImage('assets/img_1.png',),fit: BoxFit.fill,)),
            // //         Column(
            // //           crossAxisAlignment: CrossAxisAlignment.start,
            // //           children: [
            // //             Padding(
            // //               padding: const EdgeInsets.only(top: 30,),
            // //               child: Text("OGG Bin Station",style: TextStyle(
            // //                   fontSize: 11,
            // //                   fontFamily: "kadwa",
            // //                   fontWeight: FontWeight.w700
            // //               ),),
            // //             ),
            // //             Text("Perinthalmanna, Malappuram",style: TextStyle(
            // //                 fontSize: 10,
            // //                 fontFamily: "kadwa"
            // //             ),),
            // //             btn(green4, "2.3 km", green2, 55, 30, 10, FontWeight.w500),
            // //
            // //
            // //           ],
            // //         ),
            // //         SizedBox(width: 65,),
            // //         Icon(Icons.more_vert,)
            // //       ],
            // //     ),
            // //   );
            // // },
            // // ),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Text("Featured Products", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "kadwa",

              ),),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15, left: 12),
              child: Row(
                children: [
                  Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          height: 110,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Image(image: AssetImage(
                              'assets/img_17.png'), fit: BoxFit.fill),
                        ),
                        Text("Soda Can", style: TextStyle(
                            fontSize: 18,
                            fontFamily: "kadwa"
                        ),),
                        Text("211 Products", style: TextStyle(
                          fontSize: 12,
                          fontFamily: "kadwa",
                          color: Color(0xff878787),

                        ),)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          height: 110,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Image(image: AssetImage(
                              'assets/img_17.png'), fit: BoxFit.fill),
                        ),
                        Text("Soda Can", style: TextStyle(
                            fontSize: 18,
                            fontFamily: "kadwa"
                        ),),
                        Text("211 Products", style: TextStyle(
                          fontSize: 12,
                          fontFamily: "kadwa",
                          color: Color(0xff878787),

                        ),)
                      ],
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    
    
    
    );
  }
}
