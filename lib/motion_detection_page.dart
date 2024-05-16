import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MotionDetectionPage extends StatefulWidget {
  @override
  _MotionDetectionPageState createState() => _MotionDetectionPageState();
}

class _MotionDetectionPageState extends State<MotionDetectionPage> {
  double _acceleration = 0.0;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _acceleration = event.x + event.y + event.z;
      });

      // Trigger alerts based on motion detection
      if (_acceleration > 15) {
        // Send a notification or alert
        print('Unexpected movement detected!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motion Detection'),
      ),
      body: Center(
        child: Text(
          'Current acceleration: $_acceleration',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
