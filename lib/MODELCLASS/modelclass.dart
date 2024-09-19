
import 'dart:ffi';

class CategoryModel {
  String id;
  String Photo;
  String Name;
  CategoryModel(this.id,this.Photo,this.Name);

}
class WasteModel {
  String id;
  String Name;
  WasteModel(this.id,this.Name);
}
class EarningsModel {
  String id;
  String Photo;
  String Name;
  EarningsModel(this.id,this.Photo,this.Name);

}

class ServicesModel {
  String id;
  String Photo;
  String Name;
  ServicesModel(this.id,this.Photo,this.Name);

}



// class TableCalendar {
//   Int focusedDay;
//   Int firstDay;
//   Int lastday;
//   TableCalendar(this.focusedDay,this.firstDay,this.lastday,);
// }

class WastePrice {
  String id;
  String Name;
  String Price;
  WastePrice(this.id,this.Name,this.Price,);
}

class Complaint {
  String id;
  final List<String> photoUrls;
  // String Text;
  Complaint(this.id,this.photoUrls,);
}

class ProfileModel {
  String User_Id;
  String Photo;
  String User_Name;
  String User_Number;
  ProfileModel(this.User_Id,this.Photo,this.User_Name,this.User_Number);

}


//
// class LocationData {
//   final double latitude;
//   final double longitude;
//   final String name;
//
//   LocationData({required this.latitude, required this.longitude, required this.name});
//