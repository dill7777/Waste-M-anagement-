import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trashbuddy/USER/profile.dart';
import 'package:url_launcher/url_launcher.dart';
 import '../MODELCLASS/modelclass.dart';
import '../MODELCLASS/usermodels.dart';

class Mainprovider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Reference ref = FirebaseStorage.instance.ref("IMAGE URL");
  Reference imgstr = FirebaseStorage.instance.ref("Images");






  // ___________________________________Category_____________________________________________________

  TextEditingController categorynameCt = TextEditingController();

  File? categoryFileImg;
  String cateimg = '';
  Reference ref3 = FirebaseStorage.instance.ref("STAFF_IMAGE");

  Future<void> addCategory(String from, String oldid) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, dynamic> addmap = HashMap();
    addmap["CATEGORY_NAME"] = categorynameCt.text;
    if (from == "NEW") {
      addmap["CATEGORY_ID"] = id;
    }

    if (categoryFileImg != null) {
      print("njsbcd");
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(categoryFileImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value1) {
          addmap["PHOTO"] = value1;
          print("here" + categoryFileImg!.toString());
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      print("imhere" + categoryFileImg!.toString());
      addmap['PHOTO'] = cateimg;
    }
    if (from == "EDIT") {
      db.collection("CATEGORY").doc(oldid).update(addmap);
    } else {
      db.collection("CATEGORY").doc(id).set(addmap);
    }
    print("herealso" + categoryFileImg!.toString());

    getCategory();
    notifyListeners();
  }

  Future getImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      categoryFileImg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  List<CategoryModel> categorylist = [];

  Future<void> getCategory() async {
    try {
      final value = await db.collection("CATEGORY").get();
      categorylist.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          categorylist.add(CategoryModel(
              element.id,
              element.get("PHOTO").toString(),
              element.get("CATEGORY_NAME").toString()));
        }
      }
      notifyListeners();
    } catch (e) {
      print("Error fetching categories: $e");
      // Handle error appropriately
    }
  }

  void clearCategory() {
    categorynameCt.clear();
    categoryFileImg = null;
    cateimg = " ";
  }

  void DeleteCategory(id, BuildContext context) {
    db.collection("CATEGORY").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Delete Succesfully"),
    ));
  }

  void EditCategory(String id) {
    db.collection("CATEGORY").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> addmap = value.data() as Map;
        categorynameCt.text = addmap["CATEGORY_NAME"].toString();
        cateimg = addmap["PHOTO"];
        getCategory();
        notifyListeners();
      }
    });
    notifyListeners();
  }

  // __________________________________Wastecategory_______________________________________________________

  TextEditingController wastetypeCt = TextEditingController();

  Future<void> addWaste(String from, String oldid) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, dynamic> addmap = HashMap();
    addmap["WASTE_NAME"] = wastetypeCt.text;
    if (from == "NEW") {
      addmap["WASTE_ID"] = id;
    }
    if (from == "EDIT") {
      db.collection("WASTE TYPE").doc(oldid).update(addmap);
    } else {
      db.collection("WASTE TYPE").doc(id).set(addmap);
    }
  }

  List<WasteModel> wastelist = [];

  void getWasteType() {
    db.collection("WASTE TYPE").get().then((value) {
      if (value.docs.isNotEmpty) {
        wastelist.clear();
        for (var element in value.docs) {
          wastelist.add(
              WasteModel(element.id, element.get("WASTE_NAME").toString()));
        }
      }
    });
    notifyListeners();
  }

  void clearWaste() {
    wastetypeCt.clear();
  }

  void EditWaste(String id) {
    db.collection("WASTE TYPE").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        wastetypeCt.text = map["WASTE_NAME"].toString();
        getWasteType();
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void DeleteWaste(id, BuildContext context) {
    db.collection("WASTE TYPE").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Delete Succesfully"),
    ));
  }

  // ___________________________________Earnings________________________________________________________

  TextEditingController earningsCt = TextEditingController();

  File? earningsFileImg;
  String earnimg = '';
  Reference ref4 = FirebaseStorage.instance.ref("STAFF_IMAGE");

  Future<void> addEarnings(String from, String oldid) async {
    print("fvv");
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, dynamic> addmap = HashMap();
    addmap["EARNINGS_NAME"] = earningsCt.text;
    if (from == "NEW") {
      addmap["EARNINGS_ID"] = id;
    }
    if (earningsFileImg != null) {
      print("ggggggg");

      print("njsbcd");
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(earningsFileImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value1) {
          addmap["PHOTO"] = value1;
          print("here" + earningsFileImg!.toString());
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      print("imhere" + earningsFileImg!.toString());
      addmap['PHOTO'] = earnimg;
    }
    if (from == "EDIT") {
      db.collection("EARNINGS").doc(oldid).update(addmap);
    } else {
      db.collection("EARNINGS").doc(id).set(addmap);
    }
    print("herealso" + earningsFileImg!.toString());

    getCategory();
    notifyListeners();
  }

  Future<void> getVImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropVImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgcamerav() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropVImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropVImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      earningsFileImg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  List<EarningsModel> earningslist = [];

  void getEarnings() {
    db.collection("EARNINGS").get().then((value) {
      if (value.docs.isNotEmpty) {
        earningslist.clear();
        for (var element in value.docs) {
          earningslist.add(EarningsModel(
              element.id,
              element.get("PHOTO").toString(),
              element.get("EARNINGS_NAME").toString()));
        }
        notifyListeners();
      }
      notifyListeners();
    });
    notifyListeners();
  }

  void clearEarnings() {
    earningsCt.clear();
    earningsFileImg = null;
    earnimg = " ";
  }

  void DeleteEarnings(id, BuildContext context) {
    getEarnings();
    db.collection("EARNINGS").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Delete Succesfully"),
    ));
    notifyListeners();
  }

  void EditEarnings(String id) {
    db.collection("EARNINGS").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        earningsCt.text = map["EARNINGS_NAME"].toString();
        earnimg = map["PHOTO"];
        getEarnings();
        notifyListeners();
      }
    });
    notifyListeners();
  }

  // _____________________________________Services_________________________________________

  TextEditingController servicesCt = TextEditingController();

  File? servicesFileImg;
  String serviceimg = '';
  Reference ref5 = FirebaseStorage.instance.ref("STAFF_IMAGE");

  Future<void> addServices(String from, String oldid) async {
    print("fvv");
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, dynamic> addmap = HashMap();
    addmap["SERVICE_NAME"] = servicesCt.text;
    if (from == "NEW") {
      addmap["SERVICE_ID"] = id;
    }
    if (servicesFileImg != null) {
      print("ggggggg");

      print("njsbcd");
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(servicesFileImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value1) {
          addmap["PHOTO"] = value1;
          print("here" + servicesFileImg!.toString());
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      print("imhere" + servicesFileImg!.toString());
      addmap['PHOTO'] = serviceimg;
    }
    if (from == "EDIT") {
      db.collection("SERVICES").doc(oldid).update(addmap);
    } else {
      db.collection("SERVICES").doc(id).set(addmap);
    }
    print("herealso" + servicesFileImg!.toString());

    getCategory();
    notifyListeners();
  }

  Future getSImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropSImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getSImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropSImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropSImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      servicesFileImg = File(croppedFile.path);
      print(servicesFileImg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  List<ServicesModel> servicelist = [];

  void getServices() {
    db.collection("SERVICES").get().then((value) {
      print("bbbbbbb" + servicelist.length.toString());
      if (value.docs.isNotEmpty) {
        servicelist.clear();
        for (var element in value.docs) {
          servicelist.add(ServicesModel(
              element.id,
              element.get("PHOTO").toString(),
              element.get("SERVICE_NAME").toString()));
        }
        notifyListeners();
      }
      notifyListeners();
    });
    notifyListeners();
  }

  void clearServices() {
    servicesCt.clear();
    servicesFileImg = null;
    serviceimg = " ";
  }

  void DeleteServices(id, BuildContext context) {
    db.collection("SERVICES").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Delete Succesfully"),
    ));
  }

  void EditServices(String id) {
    db.collection("SERVICES").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        servicesCt.text = map["SERVICES_NAME"].toString();
        serviceimg = map["PHOTO"];
        getCategory();
        notifyListeners();
      }
    });
    notifyListeners();
  }

  // __________________________________wasteprice_________________________________

  TextEditingController wastepriceCt = TextEditingController();
  TextEditingController priceCT = TextEditingController();
  Future<void> addWastePrice(String from, String oldid) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, dynamic> addmap = HashMap();
    addmap["WASTE"] = wastepriceCt.text;
    addmap["WASTE_PRICE"] = priceCT.text;
    if (from == "NEW") {
      addmap["WASTE_ID"] = id;
    }
    if (from == "EDIT") {
      db.collection("WASTE_NAME").doc(oldid).update(addmap);
    } else {
      db.collection("WASTE_NAME").doc(id).set(addmap);
    }
  }

  List<WastePrice> wastepricelist = [];

  void getWastePrice() {
    db.collection("WASTE_NAME").get().then((value) {
      if (value.docs.isNotEmpty) {
        wastepricelist.clear();
        for (var element in value.docs) {
          wastepricelist.add(WastePrice(
            element.id,
            element.get("WASTE").toString(),
            element.get("WASTE_PRICE").toString(),
          ));
        }
        notifyListeners();
      }
      notifyListeners();
    });
    notifyListeners();
  }

  void clearWastePrice() {
    wastepriceCt.clear();
    priceCT.clear();
  }

  void EditWastePrice(String id) {
    db.collection("WASTE_NAME").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        wastetypeCt.text = map["WASTE"].toString();
        getWasteType();
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void DeleteWastePrice(id, BuildContext context) {
    db.collection("WASTE_NAME").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Delete Succesfully"),
    ));
  }

  List<WastePrice> _wastePrices = [];

  Future<void> fetchWastePrices() async {
    var db = FirebaseFirestore.instance;
    var wastePriceCollection = await db.collection("WASTE_NAME").get();
    _wastePrices.clear();
    for (var doc in wastePriceCollection.docs) {
      var data = doc.data();
      _wastePrices.add(WastePrice(
        doc.id, // Assuming the ID is the document ID
        data['WASTE'],
        data['WASTE_PRICE'],
      ));
    }
  }

  double calculateTotalPrice(List<String> selectedItems, List<double> kgValue) {
    double totalPrice = 0.0;
    for (int i = 0; i < selectedItems.length; i++) {
      var item = selectedItems[i];
      var weight = kgValue[i];
      var wastePrice = _wastePrices.firstWhere(
        (element) => element.Name == item,
        orElse: () => WastePrice('', '', '0.0'),
      );
      totalPrice += weight * double.parse(wastePrice.Price);
    }
    return totalPrice;
  }

  List<double> calculateItemPrices(
      List<String> selectedItems, List<double> kgValue) {
    List<double> itemPrices = [];
    for (int i = 0; i < selectedItems.length; i++) {
      var item = selectedItems[i];
      var weight = kgValue[i];
      var wastePrice = _wastePrices.firstWhere(
        (element) => element.Name == item,
        orElse: () => WastePrice('', '', '0.0'),
      );
      itemPrices.add(weight * double.parse(wastePrice.Price));
    }
    return itemPrices;
  }

  String dropDownvalue = 'Cloths';
  void dropDownType(String? newValue) {
    print("dddddddddddd" + newValue.toString());
    dropDownvalue = newValue!;
    notifyListeners();
  }

  // _____________________________ Complaint_________________________________________________________________

//   TextEditingController complaintCt = TextEditingController();
//   TextEditingController complainterNameCt = TextEditingController();
//   TextEditingController complainterAddressCt = TextEditingController();
//
//   List<File> complaintList = [];
//   List<String> complaintStringImages = [];
//
//   File? complaintFileImg;
//
//
// Future<void> addComplaint() async {
//     String id = DateTime.now().microsecondsSinceEpoch.toString();
//     HashMap<String, dynamic> addmap = HashMap();
//
//     addmap['COMPLAINT_DESCRIPTION'] = complaintCt.text.toString();
//     addmap['COMPLAINT_NAME'] = complainterNameCt.text.toString();
//     addmap['COMPLAINT_ADDRESS'] = complainterAddressCt.text.toString();
//     addmap['COMPLAINT_ID'] = id;
//
//     List<String> list = [complaintStringImages.toString()]; // Copy existing URLs
//
//
//
//       if (complaintList.isNotEmpty) {
//         for (int i = 0; i < complaintList.length && i < 3; i++) {
//           String time = DateTime.now().millisecondsSinceEpoch.toString();
//           Reference ref = FirebaseStorage.instance.ref().child('Images').child(time);
//           UploadTask uploadTask = ref.putFile(complaintList[i]);
//
//           try {
//             TaskSnapshot taskSnapshot = await uploadTask;
//             String downloadURL = await taskSnapshot.ref.getDownloadURL();
//             list.add(downloadURL);
//           } catch (e) {
//             // Handle upload errors here
//             print('Error uploading image: $e');
//           }
//         }
//       }
//
//       print("hhhhhhhhhhhhhhhh : ${list}");
//       addmap["COMPLAINTER_PHOTO"] = list;
//
//     try {
//       await FirebaseFirestore.instance.collection("COMPLAINT").doc(id).set(addmap);
//       notifyListeners();
//     } catch (e) {
//       // Handle Firestore write errors here
//       print('Error adding complaint: $e');
//     }
//   }
//
//
//
//   Future<void> getcmpImggallery() async {
//     final imagePicker = ImagePicker();
//     final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       await cropcmpImage(pickedImage.path, "gallery"); // Pass both path and 'from' argument
//     } else {
//       print('No image selected.');
//     }
//   }
//
//
//
//
//   Future<void> getcmpImgcamera() async {
//     final imgPicker = ImagePicker();
//     final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);
//
//     if (pickedImage != null) {
//       await cropcmpImage(pickedImage.path, "camera"); // Pass both path and 'from' argument
//     } else {
//       print('No image selected.');
//     }
//   }
//
//
//
//
//
//
//   Future<void> cropcmpImage(String path, String from) async {
//     final croppedFile = await ImageCropper().cropImage(
//       sourcePath: path,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9,
//       ],
//     );
//
//     if (croppedFile != null) {
//       complaintFileImg = File(croppedFile.path);
//       complaintList.add(complaintFileImg!);
//       notifyListeners();
//     }
//   }
//
//
//
//
//
//   // Dispose controllers when no longer needed
//   // void disposeControllers() {
//   //   complaintCt.dispose();
//   //   complainterNameCt.dispose();
//   //   complainterAddressCt.dispose();
//   // }
//
//
//

  TextEditingController complaintCt = TextEditingController();
  TextEditingController complainterNameCt = TextEditingController();
  TextEditingController complainterAddressCt = TextEditingController();

  List<File> complaintList = [];
  List<String> complaintStringImages = [];
  File? complaintFileImg;
  // List<File> vehicleImageList=[];
  // File? vehiclefileImage;

  Future<void> addComplaint() async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, dynamic> addmap = HashMap();
    HashMap<String, Object> vImageaddMap = HashMap();

    addmap['COMPLAINT_DESCRIPTION'] = complaintCt.text.toString();
    addmap['COMPLAINT_NAME'] = complainterNameCt.text.toString();
    addmap['COMPLAINT_ADDRESS'] = complainterAddressCt.text.toString();
    addmap['COMPLAINT_ID'] = id;

    if (complaintList.isNotEmpty) {
      int k = 0;
      // Make a copy of the complaintList to avoid concurrent modification error
      List<File> complaintListCopy = List.from(complaintList);

      for (File i in complaintListCopy) {
        k++;
        String imgKey = "Image$k";
        String time = DateTime.now().millisecondsSinceEpoch.toString();
        Reference imgstr = FirebaseStorage.instance.ref().child(time);

        // Check if the file exists and is a local file
        if (i.existsSync()) {
          try {
            TaskSnapshot taskSnapshot = await imgstr.putFile(i);
            String downloadURL = await taskSnapshot.ref.getDownloadURL();
            vImageaddMap[imgKey] = downloadURL;
          } catch (e) {
            print("Error uploading file: $e");
            // Handle the error accordingly, e.g., show a message to the user
          }
        } else {
          print("File does not exist: ${i.path}");
          // Handle the case where the file does not exist
        }
      }

      addmap["ItemImage"] = vImageaddMap;
    }

    try {
      await FirebaseFirestore.instance
          .collection("COMPLAINT")
          .doc(id)
          .set(addmap, SetOptions(merge: true));
      notifyListeners();
    } catch (e) {
      print('Error adding complaint: $e');
    }
  }

  Future<void> getcmpImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      await cropcmpImage(pickedImage.path, "gallery");
    } else {
      print('No image selected.');
    }
  }

  Future<void> getcmpImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      await cropcmpImage(pickedImage.path, "camera");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropcmpImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
    );

    if (croppedFile != null) {
      complaintFileImg = File(croppedFile.path);
      if (complaintList.length < 3) {
        complaintList.add(complaintFileImg!);
      } else {
        print('Maximum of 3 images can be added.');
      }
      notifyListeners();
    }
  }

  // void getComplaint() {
  //   db.collection("COMPLAINT").get().then((value) {
  //
  //     print("bbbbbbb"+complaintlist.length.toString());
  //     if (value.docs.isNotEmpty) {
  //       complaintlist.clear();
  //       for (var element in value.docs) {
  //
  //         Map <dynamic,dynamic> getmap=element.data();
  //         complaintlist.add(Complaint(
  //           getmap["COMPLAINT_ID"].toString(),
  //           getmap["PHOTO"].toString(),
  //             // element.get("TEXT").toString(),
  //
  //         ));
  //         notifyListeners();
  //       }
  //       notifyListeners();
  //     }
  //   });
  //   notifyListeners();
  // }
  List<Complaint> complaintlist = [];

  void getComplaint() {
    FirebaseFirestore.instance
        .collection("COMPLAINT")
        .get()
        .then((querySnapshot) {
      complaintList.clear(); // Clear existing list

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data();
        List<String> photoUrls = List<String>.from(data["COMPLAINTER_PHOTO"]);

        // Assuming you want to add these photos to complaintList as Files
        photoUrls.forEach((url) {
          File file = File(
              url); // Create File object from URL (adjust as per your image handling)
          complaintList.add(file);
        });
      });

      notifyListeners(); // Notify listeners after updating the list
    }).catchError((error) {
      print("Error getting complaints: $error");
    });
  }

  void clearComplaint() {
    complaintCt.clear();
    complainterNameCt.clear();
    complainterAddressCt.clear();
    complaintList.clear();
    complaintStringImages.clear();
    complaintFileImg = null;
    // complaintimg = null;
    notifyListeners();
  }

  void DeleteComplaint(id, BuildContext context) {
    db.collection("COMPLAINT").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Delete Succesfully"),
    ));
  }

  void EditComplaint(String id) {
    db.collection("COMPLAINT").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        // complaintimg = map["PHOTO"];
        getComplaint();
        notifyListeners();
      }
    });
    notifyListeners();
  }

  // -----------------------------------------------------------------------------------------------------

  int KG = 20;
  double k = 20;
  double kgValue = 1;

  void changeValue(int value) {
    KG = value.toInt();
    kgValue = KG / 2;
    notifyListeners();
  }

  void makingPhoneCall(String Phone) async {
    String url = "";
    url = 'tel:$Phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //______________ user credentails

  TextEditingController usernameController = TextEditingController();
  TextEditingController usernumberController = TextEditingController();

  void addUser() {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, dynamic> map = HashMap();
    map["User_Id"] = id;
    map["User_Name"] = usernameController.text;
    map["User_Number"] = usernumberController.text;
    map["Type"] = "USER";
    // db.collection("UserList").doc(id).set(map);
    db.collection("USERS").doc(id).set(map);
    getUser();
    notifyListeners();
  }

  List<usermodelclass> UserDetails = [];

  void getUser() {
    db.collection("USERS").get().then((value) {
      if (value.docs.isNotEmpty) {
        UserDetails.clear();
        for (var element in value.docs) {
          UserDetails.add(
            usermodelclass(
              element.id,
              element.get("User_Name").toString(),
              element.get("User_Number").toString(),
            ),
          );
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }

//   __________________________________________Reciept______________________________________________________

  TextEditingController garbageCt = TextEditingController();
  TextEditingController weightCt = TextEditingController();
  Future<void> addGarbage() async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, dynamic> addmap = HashMap();
    addmap["GARBAGE"] = garbageCt.text;
    addmap["WEIGHT"] = priceCT.text;

    db.collection("GARBAGE_ITEM").doc(id).set(addmap);
  }

  ///location fetching




//   ______________________________________profile____________________________________________________________________

  TextEditingController UsernameCt = TextEditingController();
  TextEditingController UsernumCt = TextEditingController();

  File? profileFileImg;
  String profileimg = '';
  // Reference ref7 = FirebaseStorage.instance.ref("STAFF_IMAGE");

  Future<void> addProfile(String from, String oldid) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, dynamic> addmap = HashMap();
    addmap["User_Name"] = UsernameCt.text;
    addmap["User_Number"] = UsernumCt.text;
    if (from == "NEW") {
      addmap["USER_ID"] = id;
    }

    if (profileFileImg != null) {
      print("njsbcd");
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(profileFileImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value1) {
          addmap["PHOTO"] = value1;
          print("here" + profileFileImg!.toString());
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      print("imhere" + profileFileImg!.toString());
      addmap['PHOTO'] = profileimg;
    }
    if (from == "EDIT") {
      db.collection("USERPROFILE").doc(oldid).update(addmap);
    } else {
      db.collection("USERPROFILE").doc(id).set(addmap);
    }
    print("herealso" + profileFileImg!.toString());

    getProfileModel();
    notifyListeners();
  }

  Future getPImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getPImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropPImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      profileFileImg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  List<ProfileModel> profilelist = [];

  Future<void> getProfileModel() async {
    try {
      final value = await db.collection("USERS").get();
      profilelist.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          profilelist.add(ProfileModel(
              element.id,
              element.get("PHOTO").toString(),
              element.get("User_Name").toString(),
              element.get("User_Number").toString(),
          ));
        }
      }
      notifyListeners();
    } catch (e) {
      print("Error fetching categories: $e");
      // Handle error appropriately
    }
  }

  void clearProfile() {
    UsernameCt.clear();
    UsernumCt.clear();
    profileFileImg = null;
    profileimg = " ";
  }

  void DeleteProfile(id, BuildContext context) {
    db.collection("USERPROFILE").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Delete Succesfully"),
    ));
  }

  void EditProfile(String id) {
    db.collection("USERPROFILE").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> addmap = value.data() as Map;
        UsernameCt.text = addmap["User_Name"].toString();
        UsernumCt.text = addmap["User_Number"].toString();
        profileimg = addmap["PHOTO"];
        getProfileModel();
        notifyListeners();
      }
    });
    notifyListeners();
  }




}
