import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:trashbuddy/CONSTANT/Colors.dart';

class DustBinLocation extends StatelessWidget {
  final List<Map<String, dynamic>> nearbyLocations;

  const DustBinLocation({Key? key, required this.nearbyLocations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green1,
      appBar: AppBar(
        backgroundColor: green2,
        title: Text(
          "Nearby Waste Disposal Locations",
          style: TextStyle(
            color: white,
            fontFamily: "kadwa",
            fontSize: 21,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left, size: 30, color: white),
        ),
      ),
      body: nearbyLocations.isEmpty
          ? Center(
        child: Text(
          'No nearby locations found',
          style: TextStyle(
            fontSize: 18,
            fontFamily: "kadwa",
            color: white,
          ),
        ),
      )
          : ListView.builder(
        itemCount: nearbyLocations.length,
        itemBuilder: (context, index) {
          final location = nearbyLocations[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: white,
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                location['name'],
                style: TextStyle(
                  fontFamily: "kadwa",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    'Type: ${location['type']}',
                    style: TextStyle(fontFamily: "kadwa"),
                  ),
                  Text(
                    'Distance: ${location['distance']}',
                    style: TextStyle(fontFamily: "kadwa"),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                child: Text('Directions'),
                onPressed: () => _launchMapsUrl(location['latitude'], location['longitude']),
                style: ElevatedButton.styleFrom(
                  foregroundColor: white, backgroundColor: button,
                  textStyle: TextStyle(fontFamily: "kadwa"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/dir/?api=1&destination=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}