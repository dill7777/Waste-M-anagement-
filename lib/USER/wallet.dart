import 'package:flutter/material.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text("Wallet",
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: height/4.5,
                width: width/1.15,
                decoration: BoxDecoration(
                  color: green2,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("Balance",style: TextStyle(
                      fontFamily: "kadwa",
                      fontSize: 17,
                      color: white
                    ),),
                    Text("₹100000",style: TextStyle(
                      fontFamily: "kadwa",
                      fontSize: 20,
                      color: white
                    ),),
                    Container(
                      height: height/8,
                      width: width/1.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: green4
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20,left: 19),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text("10",style: TextStyle(
                                  color: white,
                                  fontSize: 18,
                                  fontFamily: "kadwa"
                                )),
                                Text("Transaction",style: TextStyle(
                                  fontFamily: "kadwa",
                                  fontSize: 16,
                                  color: white
                                ),)
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text("5",style: TextStyle(
                                    color: white,
                                    fontSize: 18,
                                    fontFamily: "kadwa"
                                )),
                                Text("Progress",style: TextStyle(
                                    fontFamily: "kadwa",
                                    fontSize: 16,
                                    color: white
                                ),)
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text("2",style: TextStyle(
                                    color: white,
                                    fontSize: 18,
                                    fontFamily: "kadwa"
                                )),
                                Text("Waiting",style: TextStyle(
                                    fontFamily: "kadwa",
                                    fontSize: 16,
                                    color: white
                                ),)
                              ],
                            ),
        
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 20),
              child: Row(
                children: [
                  Text("History",style: TextStyle(
                    fontSize: 21,
                    fontFamily: "kadwa",
                  ),),
                  SizedBox(width: 170,),
                  Text("Sort by",style: TextStyle(
                    fontSize: 17,
                    fontFamily: "kadwa",
                    color: green5,
                  ),),
                  Icon(Icons.keyboard_arrow_down_sharp,color: green5,)
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: height/9,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/img_39.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text("Soda Can\n1.0 kg",style: TextStyle(
                        fontSize: 14,
                        fontFamily: "kadwa",
                      ),),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.only(left: 120,bottom: 25),
                      child: Text("+200.00 ₹",style: TextStyle(
                          fontFamily: "kadwa",
                          fontSize: 14
                      ),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: height/9,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/img_40.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text("Clothing\n1.0 kg",style: TextStyle(
                        fontSize: 14,
                        fontFamily: "kadwa",
                      ),),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.only(left: 120,bottom: 25),
                      child: Text("+200.00 ₹",style: TextStyle(
                          fontFamily: "kadwa",
                          fontSize: 14
                      ),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: height/9,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/img_13.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text("Plastic Bag\n1.0 kg",style: TextStyle(
                        fontSize: 14,
                        fontFamily: "kadwa",
                      ),),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.only(left: 112,bottom: 25),
                      child: Text("+200.00 ₹",style: TextStyle(
                          fontFamily: "kadwa",
                          fontSize: 14
                      ),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: height/9,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/img_41.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text("Wool\n1.0 kg",style: TextStyle(
                        fontSize: 14,
                        fontFamily: "kadwa",
                      ),),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.only(left: 145,bottom: 25),
                      child: Text("+200.00 ₹",style: TextStyle(
                          fontFamily: "kadwa",
                          fontSize: 14
                      ),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: height/9,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/img_39.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text("Soda Can\n1.0 kg",style: TextStyle(
                        fontSize: 14,
                        fontFamily: "kadwa",
                      ),),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.only(left: 120,bottom: 25),
                      child: Text("+200.00 ₹",style: TextStyle(
                          fontFamily: "kadwa",
                          fontSize: 14
                      ),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: height/9,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/img_39.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text("Soda Can\n1.0 kg",style: TextStyle(
                        fontSize: 14,
                        fontFamily: "kadwa",
                      ),),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.only(left: 120,bottom: 25),
                      child: Text("+200.00 ₹",style: TextStyle(
                          fontFamily: "kadwa",
                          fontSize: 14
                      ),),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
