import 'package:flutter/material.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/CONSTANT/widget.dart';

import 'binlocation.dart';

class DustBinLocation extends StatelessWidget {
  const DustBinLocation({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text("Location of Dustbin",
            style: TextStyle(
                color: white,
                fontFamily: "kadwa",
                fontSize: 21
            )),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left,size: 30,color: white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text("Garbage Bins Near You !",style: TextStyle(
                fontFamily: "kadwa",
                fontSize: 20,

              ),),
            ),
            SizedBox(
              height: 15,
            ),
            ListView.builder(itemCount: 3,
    shrinkWrap: true,
    physics: ScrollPhysics(),
    itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            height: 150,
            width: 340,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    Image(image: AssetImage('assets/img_26.png'),height: 100,),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Text("Sweet Mart\nKulasseri Colony\n Perinthalmanna",style: TextStyle(
                            fontSize: 12,
                            fontFamily: "kadwa"
                        ),),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BinLocation()));
                            },
                            child: btn2(button, "Direction", white, 100, 30, 12, FontWeight.w500,"kadwa"))
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
