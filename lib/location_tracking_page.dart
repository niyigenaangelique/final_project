import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geofence_service/geofence_service.dart';

class LocationTrackingPage extends StatefulWidget {
  @override
  _LocationTrackingPageState createState() => _LocationTrackingPageState();
}

class _LocationTrackingPageState extends State<LocationTrackingPage> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _determinePosition();
    _startGeofencing();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = position;
    });
  }

  void _startGeofencing() {
    GeofenceService geofenceService = GeofenceService(
      initialPosition: _currentPosition!,
      triggers: [
        GeofenceTrigger(
          geofenceId: 'home',
          radius: 100,
          latitude: 37.4219999,
          longitude: -122.0840575,
        ),
      ],
    );

    geofenceService.startListening((GeofenceEvent event) {
      print('Geofence event: ${event.toString()}');
      // Trigger actions or notifications based on geofence events
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Tracking'),
      ),
      body: Center(
        child: Text(
          _currentPosition != null
              ? 'Current position: ${_currentPosition!.latitude}, ${_currentPosition!.longitude}'
              : 'Determining position...',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
