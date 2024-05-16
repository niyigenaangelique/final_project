import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class LightSensorPage extends StatefulWidget {
  @override
  _LightSensorPageState createState() => _LightSensorPageState();
}

class _LightSensorPageState extends State<LightSensorPage> {
  double _lightLevel = 0.0;

  @override
  void initState() {
    super.initState();
    lightEvents.listen((LightEvent event) {
      setState(() {
        _lightLevel = event.intensity;
      });

      // Automate based on light level
      if (_lightLevel < 10) {
        // Turn on smart lights or notify user
        print('It\'s too dark! Turning on the lights...');
      } else {
        // Turn off smart lights
        print('Sufficient light detected. Turning off the lights...');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Light Sensor'),
      ),
      body: Center(
        child: Text(
          'Current light level: $_lightLevel lux',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
