import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';
import 'package:trashbuddy/USER/home.dart';
import 'package:trashbuddy/USER/profile.dart';
import 'package:trashbuddy/USER/wallet.dart';

import 'collectWaste.dart';
import 'location.dart';

class bottomnavigation extends StatefulWidget {
  String userId;
  String Username;
  String Usernumber;
  String loginphno;
  bottomnavigation(
      {super.key,
      required this.userId,
      required this.Username,
      required this.Usernumber,
      required this.loginphno});

  @override
  State<bottomnavigation> createState() => _bottomnavigationState();
}

class _bottomnavigationState extends State<bottomnavigation> {
  int selectedindex = 0;
  void onicontapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("jhbkhbfv" + selectedindex.toString());
    final pages = [
      HomePage(),
      CollectWaste(),
      Wallet(),
      Profile(
        User_Id: widget.userId,
        User_Name: widget.Username,
        User_Number: widget.Usernumber,
      ),
      // Profile(User_Id: '', Photo: '', User_Name: '', User_Number: '',),
    ];
    return Scaffold(
      extendBody: true,
      body: pages[selectedindex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              color: green1,
              border:
                  Border(top: BorderSide(color: Color(0xff61904F), width: 2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    onicontapped(0);
                  },
                  icon: selectedindex == 0
                      ? Icon(
                          Icons.home,
                          color: green2,
                        )
                      : Icon(
                          Icons.home,
                          color: Color(0xff747973),
                        )),
              Consumer<mainProvider>(builder: (context, value, child) {
                return IconButton(
                    onPressed: () {
                      onicontapped(1);
                      value.getEarnings();
                      value.getWastePrice();
                    },
                    icon: selectedindex == 1
                        ? Icon(
                            Icons.shopping_cart_rounded,
                            color: green2,
                          )
                        : Icon(Icons.shopping_cart_rounded,
                            color: Color(0xff747973)));
              }),
              Consumer<mainProvider>(builder: (context, value, child) {
                return IconButton(
                    onPressed: () {
                      onicontapped(2);
                    },
                    icon: selectedindex == 2
                        ? Icon(
                            Icons.wallet_rounded,
                            color: green2,
                          )
                        : Icon(Icons.wallet_rounded, color: Color(0xff747973)));
              }),
              IconButton(
                  onPressed: () {
                    onicontapped(3);
                  },
                  icon: selectedindex == 3
                      ? Icon(Icons.person_rounded, color: green2)
                      : Icon(
                          Icons.person_rounded,
                          color: Color(0xff747973),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
