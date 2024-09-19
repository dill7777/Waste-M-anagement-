import 'package:flutter/material.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';

import '../CONSTANT/widget.dart';

class Myorders extends StatelessWidget {
   Myorders({super.key});

   List <String> Oimg = [
     "assets/img_30.png",
     "assets/img_30.png",
     "assets/img_30.png",
     "assets/img_30.png",
   ];
   List <String> Oitem = [
     "Plastic",
     "Glass",
     "Metal",
     "Organic",
   ];


   @override
  Widget build(BuildContext context) {

     var width = MediaQuery.of(context).size.width;
     var height = MediaQuery.of(context).size.height;

     return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text("My Orders",style: TextStyle(
            fontSize: 20,
            fontFamily: "kadwa",
            fontWeight: FontWeight.w500,
            color: white
        )),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left,size: 30,color: white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(itemCount: Oimg.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 5),
                    child: Container(
                      height: 150,
                      width: 335,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Image(image: AssetImage(Oimg[index]),height: 100,),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text("Plastic\n 2kg \n 300 Rs",style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "kadwa"
                                  ),),
                                  cancel(Colors.cyan, "Cancel", white, 100, 30, 12, FontWeight.w500,"kadwa")
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
        
                })
        
          ],
        ),
      ),
    );
  }
}
