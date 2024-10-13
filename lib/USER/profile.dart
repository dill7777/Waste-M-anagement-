// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:trashbuddy/CONSTANT/Colors.dart';
// import 'package:trashbuddy/PROVIDER/LoginProvidernew.dart';
// import 'package:trashbuddy/PROVIDER/mainProvider.dart';
// import 'package:trashbuddy/USER/login.dart';



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';
import 'package:trashbuddy/USER/myOrders.dart';
import '../CONSTANT/Colors.dart';
import '../PROVIDER/LoginProvidernew.dart';
import 'login.dart';


// class Profile extends StatelessWidget {
//   String User_Id;
//   String User_Name;
//   String User_Number;
//    Profile({super.key,required this.User_Id,required this.User_Name,required this.User_Number});
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: green1,
//       appBar: AppBar(
//         backgroundColor: green2,
//         title: Text("Profile",
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
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 30,),
//             // Consumer<mainProvider>(
//             //   builder: (context,value,child) {
//             //     return ListView.builder(
//             //         itemCount: 1,
//             //         physics: ScrollPhysics(),
//             //         shrinkWrap: true,
//             //       itemBuilder: (context, index) {
//             //         return Column(
//             //           children: [
//             //             Center(child: CircleAvatar(radius: 50,backgroundImage: AssetImage(value.profilelist[index].Photo),
//             //             //   child: Padding(
//             //             //   padding: const EdgeInsets.only(left: 88,top: 50),
//             //             //   child: Icon(Icons.edit_square,color: green2),
//             //             // ),
//             //                 )),
//             //             SizedBox(
//             //               height: 20,
//             //             ),
//             //             Center(
//             //               child: Text(value.profilelist[index].User_Name,style: TextStyle(
//             //                 fontFamily: "kadwa",
//             //                 fontSize: 20
//             //               ),),
//             //             ),
//             //             Center(
//             //               child: Text(value.profilelist[index].User_Number,style: TextStyle(
//             //                 fontFamily: "kadwa",
//             //                 fontSize: 16
//             //               ),),
//             //             ),
//             //           ],
//             //         );
//             //       }
//             //     );
//             //   }
//             // ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Consumer<Mainprovider>(
//                   builder: (context, value, child) {
//                     return Column(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             showBottomSheet(context,2);
//                           },
//                           child: value.profileFileImg != null
//                               ? Container(
//                             height: 120,
//                             width: 120,
//                             decoration: BoxDecoration(
//                                 color: green1,
//                                 borderRadius: BorderRadius.all(
//                                     Radius.circular(100)),
//                                 image: DecorationImage(
//                                   image: FileImage(
//                                       value.profileFileImg!),
//                                   fit: BoxFit.cover,
//                                 )),
//                           )
//                               : Container(
//                             height: 120,
//                             width: 120,
//                             decoration: BoxDecoration(
//                                 color: green2,
//                                 borderRadius: BorderRadius.all(
//                                     Radius.circular(100))),
//                             child: Center(
//                               child: Icon(
//                                 CupertinoIcons.profile_circled,
//                                 size: 100,
//                                 color: green2,
//                               ),
//                             ),
//                           ),
//                         ),
//                         value.profileFileImg != null
//                             ? TextButton(
//                             onPressed: () {
//                               value.addProfile(User_Name,User_Number);
//                             },
//                             child: Text("Done"))
//                             : Center(
//                           child: Column(
//                             children: [
//                               Text(
//                                 User_Name,
//                                 style: TextStyle(
//                                     color: green2,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               Text(
//                                 User_Number,
//                                 style: TextStyle(
//                                     color: green2,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     );
//                   }),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//              child: Column(
//                children: [
//                  InkWell(
//                    onTap: () {
//                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Myorders()));
//                    },
//                    child: Row(
//                      children: [
//                        Icon(Icons.shopping_cart_outlined,color: green5,size: 30,),
//                        SizedBox(width: 20,),
//                        Text("My Orders",style: TextStyle(
//                            fontSize: 16,
//                            fontFamily: "kadwa"
//                        ),)
//                      ],
//                    ),
//                  ),
//                  SizedBox(
//                    height: 15,
//                  ),
//                  Row(
//                    children: [
//                      Icon(Icons.payment_rounded,color: green5,size: 30,),
//                      SizedBox(width: 20,),
//                      Text("Payment",style: TextStyle(
//                          fontSize: 16,
//                          fontFamily: "kadwa"
//                      ),)
//                    ],
//                  ),
//                  SizedBox(
//                    height: 15,
//                  ),
//
//                  Row(
//                    children: [
//                      Icon(Icons.notifications_none_rounded,color: green5,size: 30,),
//                      SizedBox(width: 20,),
//                      Text("Notification",style: TextStyle(
//                          fontSize: 16,
//                          fontFamily: "kadwa"
//                      ),)
//                    ],
//                  ),
//                  SizedBox(
//                    height: 15,
//                  ),
//
//                  Row(
//                    children: [
//                      Icon(Icons.help_outline_rounded,color: green5,size: 30,),
//                      SizedBox(width: 20,),
//                      Text("Help",style: TextStyle(
//                          fontSize: 16,
//                          fontFamily: "kadwa"
//                      ),)
//                    ],
//                  ),
//                  SizedBox(
//                    height: 15,
//                  ),
//
//
//         GestureDetector(
//                        onTap: () {
//                          showDialog(
//                            context: context,
//                            builder: (context) => AlertDialog(
//                              backgroundColor: Colors.transparent,
//                              elevation: 20,
//                              content: Text("Do you want to Logout ?",
//                                  style: TextStyle(
//                                      fontSize: 17,
//                                      fontWeight: FontWeight.w700,
//                                      color: Colors.white)),
//                              actions: <Widget>[
//                                Consumer<LoginProviderNew>(
//                                  builder: (context, value, child) {
//                                    return TextButton(
//                                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white),
//                                          shape: WidgetStatePropertyAll(
//                                              RoundedRectangleBorder(
//                                                  borderRadius:
//                                                  BorderRadius.circular(12)))),
//                                      onPressed: () {
//                                        FirebaseAuth auth = FirebaseAuth.instance;
//                                        auth.signOut();
//                                        Navigator.pushReplacement(
//                                            context,
//                                            MaterialPageRoute(
//                                              builder: (context) => LoginPage(),
//                                            ));
//                                        value.clearLoginPageNumber();
//                                      },
//                                      child: Center(
//                                          child: Text("Yes",
//                                              style: TextStyle(
//                                                  color: Colors.black,
//                                                  fontSize: 17,
//                                                  fontWeight: FontWeight.w700))),
//                                    );
//                                  },
//                                ),
//                                TextButton(
//                                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white),
//                                        shape: WidgetStatePropertyAll(
//                                            RoundedRectangleBorder(
//                                                borderRadius:
//                                                BorderRadius.circular(12)))),
//                                    onPressed: () {
//                                      Navigator.pop(context);
//                                    },
//                                    child: Center(
//                                        child: Text("No",
//                                            style: TextStyle(
//                                                color: Colors.black,
//                                                fontSize: 17,
//                                                fontWeight: FontWeight.w700))))
//                              ],
//                            ),
//                          );
//                        },
//                        child: Row(
//                          children: [
//                            Icon(Icons.logout_rounded,color: red,size: 30,),
//                            SizedBox(width: 20,),
//                            Text("Logout",style: TextStyle(
//                                fontSize: 16,
//                                fontFamily: "kadwa",
//                                color: red
//                            ),)
//                          ],
//                        ),
//                      ),
//
//                ],
//              ),
//            )
//           ],
//         ),
//       ),
//
//     );
//   }
//
//   void showBottomSheet(BuildContext context, int index) {
//    final  provider = Provider.of<Mainprovider>(context, listen: false);
//     showModalBottomSheet(
//       elevation: 10,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(10.0),
//           topRight: Radius.circular(10.0),
//         ),
//       ),
//       context: context,
//       builder: (BuildContext bc) {
//         return Wrap(
//           children: <Widget>[
//             ListTile(
//               leading: Icon(Icons.camera_enhance_sharp, color: green2),
//               title: const Text('Camera'),
//               onTap: () async {
//                 await provider.getcmpImgcamera();
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.photo, color: green2),
//               title: const Text('Gallery'),
//               onTap: () async {
//                 await provider.getcmpImggallery();
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
// }


class Profile extends StatelessWidget {
  final String userId;
  final String userName;
  final String userNumber;

  const Profile({
    Key? key,
    required this.userId,
    required this.userName,
    required this.userNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text("Profile",
            style: TextStyle(
                color: white,
                fontFamily: "kadwa",
                fontSize: 21
            )),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left, size: 30, color: white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(10),
              child: Consumer<Mainprovider>(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            showBottomSheet(context, 2);
                          },
                          child: value.profileFileImg != null
                              ? Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                color: green1,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                image: DecorationImage(
                                  image: FileImage(value.profileFileImg!),
                                  fit: BoxFit.cover,
                                )),
                          )
                              : Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                color: green2,
                                borderRadius: BorderRadius.all(Radius.circular(100))),
                            child: Center(
                              child: Icon(
                                CupertinoIcons.profile_circled,
                                size: 100,
                                color: green2,
                              ),
                            ),
                          ),
                        ),
                        value.profileFileImg != null
                            ? TextButton(
                            onPressed: () {
                              value.addProfile(userName, userNumber);
                            },
                            child: Text("Done"))
                            : Center(
                          child: Column(
                            children: [
                              Text(
                                userName,
                                style: TextStyle(
                                    color: green2,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                userNumber,
                                style: TextStyle(
                                    color: green2,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Myorders()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart_outlined, color: green5, size: 30),
                        SizedBox(width: 20),
                        Text("My Orders", style: TextStyle(fontSize: 16, fontFamily: "kadwa")),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.payment_rounded, color: green5, size: 30),
                      SizedBox(width: 20),
                      Text("Payment", style: TextStyle(fontSize: 16, fontFamily: "kadwa")),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.notifications_none_rounded, color: green5, size: 30),
                      SizedBox(width: 20),
                      Text("Notification", style: TextStyle(fontSize: 16, fontFamily: "kadwa")),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.help_outline_rounded, color: green5, size: 30),
                      SizedBox(width: 20),
                      Text("Help", style: TextStyle(fontSize: 16, fontFamily: "kadwa")),
                    ],
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.transparent,
                          elevation: 20,
                          content: Text("Do you want to Logout?",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white)),
                          actions: <Widget>[
                            Consumer<LoginProviderNew>(
                              builder: (context, value, child) {
                                return TextButton(
                                  style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)))),
                                  onPressed: () {
                                    FirebaseAuth auth = FirebaseAuth.instance;
                                    auth.signOut();
                                    Navigator.pushReplacement(
                                        context, MaterialPageRoute(builder: (context) => LoginPage()));
                                    value.clearLoginPageNumber();
                                  },
                                  child: Center(
                                      child: Text("Yes",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700))),
                                );
                              },
                            ),
                            TextButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)))),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                  child: Text("No",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700))),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.logout_rounded, color: red, size: 30),
                        SizedBox(width: 20),
                        Text("Logout",
                            style: TextStyle(fontSize: 16, fontFamily: "kadwa", color: red)),
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

  void showBottomSheet(BuildContext context, int index) {
    final provider = Provider.of<Mainprovider>(context, listen: false);
    showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera_enhance_sharp, color: green2),
              title: const Text('Camera'),
              onTap: () async {
                await provider.getcmpImgcamera();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo, color: green2),
              title: const Text('Gallery'),
              onTap: () async {
                await provider.getcmpImggallery();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}





//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:trashbuddy/PROVIDER/mainprovider.dart';
// import '../CONSTANT/Colors.dart';
// class Profile extends StatelessWidget {
//   final String User_Id;
//   final String Photo;
//   final String User_Name;
//   final String User_Number;
//
//   Profile({
//     super.key,
//     required this.User_Id,
//     required this.Photo,
//     required this.User_Name,
//     required this.User_Number,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//         return Scaffold(
//           backgroundColor: green1,
//           appBar: AppBar(
//             backgroundColor: green2,
//             title: Text(
//               "Profile",
//               style: TextStyle(
//                 color: white,
//                 fontFamily: "kadwa",
//                 fontSize: 21,
//               ),
//             ),
//             centerTitle: true,
//             leading: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Icon(Icons.chevron_left, size: 30, color: white),
//             ),
//           ),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.all(10),
//               child: Consumer<mainProvider>(
//                 builder: (context11,value,child) {
//                   return Column(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           showBottomSheet(context, 2);
//                         },
//                         child:
//                         value.profileFileImg != null
//                             ? Container(
//                           height: 120,
//                           width: 120,
//                           decoration: BoxDecoration(
//                             color: green1,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(100),
//                             ),
//                             image: DecorationImage(
//                               image: FileImage(value.profileFileImg!),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         )
//                             : Container(
//                           height: 120,
//                           width: 120,
//                           decoration: BoxDecoration(
//                             color: green2,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(100),
//                             ),
//                           ),
//                           child: Center(
//                             child: Icon(
//                               CupertinoIcons.profile_circled,
//                               size: 100,
//                               color: green2,
//                             ),
//                           ),
//                         ),
//                       ),
//                       value.profileFileImg != null
//                           ? TextButton(
//                         onPressed: () {
//                           // value.addProfile(User_Name, User_Number);
//                         },
//                         child: Text("Done"),
//                       )
//                           :
//                       Center(
//                         child: Column(
//                           children: [
//                             Text(
//                               User_Name,
//                               style: TextStyle(
//                                 color: green2,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               User_Number,
//                               style: TextStyle(
//                                 color: green2,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   );
//                 }
//               ),
//             ),
//           ),
//         );
//
//   }
//
//   void showBottomSheet(BuildContext context, int index) {
//     mainProvider prov = Provider.of<mainProvider>(context, listen: false);
//     showModalBottomSheet(
//       elevation: 10,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(10.0),
//           topRight: Radius.circular(10.0),
//         ),
//       ),
//       context: context,
//       builder: (BuildContext bc) {
//         return Wrap(
//           children: <Widget>[
//             ListTile(
//               leading: Icon(Icons.camera_enhance_sharp, color: green2),
//               title: const Text('Camera'),
//               onTap: () async {
//                 await prov.getcmpImgcamera();
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.photo, color: green2),
//               title: const Text('Gallery'),
//               onTap: () async {
//                 await prov.getcmpImggallery();
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
