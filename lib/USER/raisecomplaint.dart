import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';
import 'package:trashbuddy/USER/uploadpic.dart';

import '../CONSTANT/widget.dart';
import 'instruction.dart';

class RaiseComplaint extends StatelessWidget {
  const RaiseComplaint({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text("Raise Complaint",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height/3,
              ),
              Center(
                child: Text("Upload the Picture of dumpsite",style: TextStyle(
                  fontFamily: "kadwa",
                  fontSize: 18,
                ),),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 50,top: 50),
              //   child: InkWell(
              //       onTap: (){
              //         Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadPicture()));
              //       },
              //       child: btn(Color(0xff419e3f), "  Take a Picture", white, 220, 40, 15, FontWeight.w500,"kadwa",Icons.camera_alt)),
              // ),
              Consumer<mainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                      onTap: (){
                        value.clearComplaint();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadPicture()));
                      },
                      child: Center(child: btn(
                          Color(0xff419e3f), "Upload the Picture", white, 250, 40, 15, FontWeight.w500,"kadwa",Icons.upload_rounded),

                      ));
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
