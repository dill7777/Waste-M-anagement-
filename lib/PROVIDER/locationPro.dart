import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationData {
  final double latitude;
  final double longitude;
  final String name;

  LocationData({required this.latitude, required this.longitude, required this.name});
}

class LocationPro extends ChangeNotifier {

  /// Location enable Validate

  bool _isLocationEnabled = false;

  bool get isLocationEnabled => _isLocationEnabled;

  Future<void> checkLocationStatus() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    _isLocationEnabled = serviceEnabled;
    notifyListeners();
  }

  Future<void> enableLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // The result of openLocationSettings() is not reliable on Android
        // So we check the status again after it returns
        await Geolocator.openLocationSettings();
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          throw Exception('Location services are still disabled.');
        }
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied, we cannot request permissions.');
      }

      _isLocationEnabled = true;
      notifyListeners();
    } catch (e) {
      print('Error enabling location: $e');
      rethrow;
    }
  }


  ///apartment&street
  TextEditingController aptController = TextEditingController();
  TextEditingController streetController = TextEditingController();

  String get aptNumber => aptController.text;
  String get streetName => streetController.text;

  void updateAptNumber(String value) {
    aptController.text = value;
    notifyListeners();
  }

  void updateStreetName(String value) {
    streetController.text = value;
    notifyListeners();
  }

  @override
  void dispose() {
    aptController.dispose();
    streetController.dispose();
    super.dispose();
  }








  LocationData? _locationData;

  LocationData? get locationData => _locationData;

  Future<void> getCurrentLocationAndSave() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      String locationName = 'Unknown';
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        locationName = '${place.locality}, ${place.country}';
      }

      _locationData = LocationData(
        latitude: position.latitude,
        longitude: position.longitude,
        name: locationName,
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('latitude', position.latitude);
      await prefs.setDouble('longitude', position.longitude);
      await prefs.setString('locationName', locationName);

      notifyListeners();

      print('Location saved: ${_locationData?.latitude}, ${_locationData?.longitude}, ${_locationData?.name}');
    } catch (e) {
      print('Error getting or saving location: $e');
      rethrow; // Rethrow the exception so it can be handled by the caller
    }
  }

  Future<void> loadSavedLocation() async {
    final prefs = await SharedPreferences.getInstance();
    double? latitude = prefs.getDouble('latitude');
    double? longitude = prefs.getDouble('longitude');
    String? name = prefs.getString('locationName');

    if (latitude != null && longitude != null && name != null) {
      _locationData = LocationData(
        latitude: latitude,
        longitude: longitude,
        name: name,
      );
      notifyListeners();
    }
  }
}