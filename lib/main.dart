import 'package:flutter/material.dart';
import 'light_sensor_page.dart';
import 'motion_detection_page.dart';
import 'location_tracking_page.dart';

void main() {
  runApp(SensorApp());
}

class SensorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensor App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LightSensorPage()),
                );
              },
              child: Text('Light Level Sensing and Automation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MotionDetectionPage()),
                );
              },
              child: Text('Motion Detection and Security'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LocationTrackingPage()),
                );
              },
              child: Text('Location Tracking and Geofencing'),
            ),
          ],
        ),
      ),
    );
  }
}
