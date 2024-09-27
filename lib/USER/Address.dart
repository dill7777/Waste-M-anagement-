import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/CONSTANT/widget.dart';

import '../PROVIDER/mainprovider.dart';
import 'bottomnavigation.dart';

class Address extends StatelessWidget {
  String from;
  Address({super.key,required this.from});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
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
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Name :",style: TextStyle(
                    fontFamily: "kadwa",
                    fontSize: 17
                  ),),
                  SizedBox(width: 30,),
                  Container(
                    height: 35,
                    width: 240,
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: green2),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Consumer<Mainprovider>(
                      builder: (context,value,child) {
                        return TextField(
                          controller: value.complainterNameCt,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20,)
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "kadwa"
                          ),
                        );
                      }
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text("Address :",style: TextStyle(
                    fontFamily: "kadwa",
                    fontSize: 17
                  ),),
                  SizedBox(width: 15,),
                  Container(
                    height: 100,
                    width: 240,
                    decoration: BoxDecoration(
                        color: white,
                        border: Border.all(color: green2),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Consumer<Mainprovider>(
                      builder: (context,value,child) {
                        return TextField(
                          controller: value.complainterAddressCt,
                          decoration: InputDecoration(
                              border: InputBorder.none
                          ),
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "kadwa"
                          ),
                        );
                      }
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Consumer<Mainprovider>(
                builder: (context,value,child) {
          
                  return InkWell(
                      onTap: () {
                        value.addComplaint();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>bottomnavigation(userId: '',)));
          
                      },
                      child: Center(child: btn2(btn1, "Submit", white, 80, 35, 14, FontWeight.w500, "kadwa")));
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
