import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/ADMIN/addearnings.dart';
import 'package:trashbuddy/ADMIN/addservice.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';

import '../PROVIDER/mainProvider.dart';

class Earnings extends StatelessWidget {
  Earnings({super.key});

  // List <String> earnings_img = [
  //   "assets/img_36.png",
  //   "assets/img_37.png",
  //   "assets/img_31.png",
  // ];
  //
  // List <String> earnings = [
  //   "Plastic",
  //   "Aluminium",
  //   "Metal",
  // ];


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: green1,
        floatingActionButton: Consumer<Mainprovider>(
          builder: (context,value,child) {
            return FloatingActionButton(
              shape: CircleBorder(side: BorderSide(color: green5)),
              backgroundColor: white,
              onPressed: () {
                value.clearEarnings();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEarnings(from: 'NEW', oldid:" ")));
              },
              child: Icon(Icons.add,color: green5,),
            );
          }
        ),

      appBar: AppBar(
        backgroundColor: green2,
        title: Text("Earnings",style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: "kadwa"
        )),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left,size: 30,color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Consumer<Mainprovider>(
              builder: (context,value,child) {
                return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  // padding: EdgeInsets.only(right: 10, top: 10,left: 5),
                  itemCount: value.earningslist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent:160,

                  ),
                  itemBuilder: (context, index) {
                    print("ahbdhsd"+value.earningslist.length.toString());
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content:  Text(
                                "Do you want to  EDIT or DELETE ?",style: TextStyle(
                                fontSize:17,
                                fontFamily: "kadwa",
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                            actions: <Widget>[
                              Center(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color:Colors.red ,
                                          borderRadius: BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              blurRadius: 2.0, // soften the shadow
                                              spreadRadius: 1.0, //extend the shadow
                                            ),
                                          ] ),
                                      child: Center(child:  TextButton(
                                        onPressed: (){
                                          value.DeleteEarnings(
                                              value.earningslist[index].id,context);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Delete",style: TextStyle(
                                          color:white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "kadwa",
                                        )),
                                      )),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        print("hjjk"+ value.earningslist[index].id);
                                        value.EditCategory(
                                            value.earningslist[index].id);
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddEarnings(
                                                      from: "EDIT",
                                                      oldid: value.earningslist[index].id
                                                  ),
                                            ));
                                      },
                                      child:Container(
                                        height: 45,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color:green2 ,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x26000000),
                                                blurRadius: 2.0, // soften the shadow
                                                spreadRadius: 1.0, //extend the shadow
                                              ),
                                            ] ),
                                        child: Center(child:  Text("Edit",style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 17,fontWeight: FontWeight.w600,
                                          fontFamily: "kadwa",
                                        ))),
                                      ),)
                                  ],
                                ),
                              ),

                            ],
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: height/5.5,
                            width: width/2.5,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(value.earningslist[index].Photo),fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.circular(5)

                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(value.earningslist[index].Name,style: TextStyle(
                              fontSize: 14,
                              fontFamily: "kadwa"
                          ),)
                        ],
                      ),
                    );

                  },
                );
              }
            ),

          ],
        ),
      ),


    );
  }
}
