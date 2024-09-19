import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';
import 'package:trashbuddy/CONSTANT/widget.dart';
import 'package:trashbuddy/PROVIDER/mainprovider.dart';

class AddService extends StatelessWidget {
  String from;
  String oldid;
  AddService({super.key,required this.from,required this.oldid});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text("Add Service",style: TextStyle(
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Consumer<mainProvider>(
              builder: (context,value,child) {
                return InkWell(
                  onTap: () {
                    showBottomSheet(context);
                  },
                  child: Center(
                    child: value.servicesFileImg!=null?Container(
                      height: height/3.5,
                      width: width/2.3,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.file(value.servicesFileImg!),
                    ) :value.serviceimg!=""?Container(
                      height: height/3.5,
                      width: width/2.3,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.network(value.serviceimg!),
                    ):Container(
                      height: height/3.5,
                      width: width/2.3,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Icon(Icons.add)),
                    ),
                  ),
                );
              }
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Consumer<mainProvider>(
                  builder: (context,value,child) {
                    return Container(
                      height: height/20,
                      width: width/2.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextField(
                        controller: value.servicesCt,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: white,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 14)
                        ),
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "kadwa"
                        ),
                      ),
                    );
                  }
              ),
            ),
            SizedBox(
              height: 50,
            ),

            Consumer<mainProvider>(
              builder: (context,value,child) {
                return InkWell(
                onTap: () {
                    if ( from == "NEW"){
                    value.addServices(from," ");
                    }else{
                    value.addServices(from,oldid);
                    }
                    Navigator.pop(context);
                    },
                    child: Center(child: btn3(green5, "Save", white, 100, 38, 15, FontWeight.w500, "kadwa")));
              }
            )
          ],
        ),
      ),

    );
  }
  void showBottomSheet(BuildContext context) {

    mainProvider provider =Provider.of<mainProvider>(context,listen:false);
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading:  Icon(
                    Icons.camera_enhance_sharp,
                    color: green2,
                  ),
                  title: const Text('Camera',),
                  onTap: () => {
                    provider.getSImgcamera(),
                    Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: green2),
                  title: const Text('Gallery',),
                  onTap: () => {
                    provider.getSImggallery(),
                    Navigator.pop(context),
                  }
              ),
            ],
          );
        });
    // ImageSource
  }
}





