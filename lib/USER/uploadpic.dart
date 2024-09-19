import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';
import 'package:trashbuddy/USER/instruction.dart';

import '../CONSTANT/widget.dart';


class UploadPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text(
          "Raise Complaint",
          style: TextStyle(color: Colors.white, fontFamily: "Roboto", fontSize: 21),
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
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                "Upload up to three pictures",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Consumer<mainProvider>(
                builder: (context, value, child) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(3, (index) {
                        File? imageFile = index < value.complaintList.length ? value.complaintList[index] : null;
                        return InkWell(
                          onTap: () {
                            showBottomSheet(context, index);
                          },
                          child: Container(
                            height: height / 3.5,
                            width: width / 2.3,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: imageFile != null
                                  ? DecorationImage(
                                image: FileImage(imageFile),
                                fit: BoxFit.cover,
                              )
                                  : null,
                            ),
                            child: imageFile == null
                                ? Center(child: Icon(Icons.add))
                                : null,
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 60),
            Center(
              child: Consumer<mainProvider>(
                builder: (context, value, child) {
                  return InkWell(
                    onTap: () {
                      // value.addComplaint();
                      // Upload complaint and images
                      // value.clearComplain value.getComplaint();


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Instruction()), // Navigate to next page
                      );
                    },
                    child: btn2(btn1, "Upload", white, 100, 40,
                        14, FontWeight.w500, "kadwa"),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context, int index) {
    mainProvider provider = Provider.of<mainProvider>(context, listen: false);
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






