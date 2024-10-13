import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
 import 'package:trashbuddy/USER/home.dart';
import 'package:trashbuddy/USER/profile.dart';
import 'package:trashbuddy/USER/wallet.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';


 import 'collectWaste.dart';

class BottomNavigation extends StatefulWidget {
  final String userId;
  final String username;
  final String userNumber;  // Changed from Usernumber to userNumber
  final String loginPhno;

  const BottomNavigation({
    Key? key,
    required this.userId,
    required this.username,
    required this.userNumber,  // Changed from Usernumber to userNumber
    required this.loginPhno,
  }) : super(key: key);


  @override
  State<BottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<BottomNavigation> {
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
        userId: widget.userId,
        userName: widget.username,
        userNumber: widget.userNumber,
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
                        color: Color(
                          0xff747973,
                        ),
                      ),
              ),
              Consumer<Mainprovider>(builder: (context, value, child) {
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
                      : Icon(
                          Icons.shopping_cart_rounded,
                          color: Color(
                            0xff747973,
                          ),
                        ),
                );
              }),
              Consumer<Mainprovider>(builder: (context, value, child) {
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
