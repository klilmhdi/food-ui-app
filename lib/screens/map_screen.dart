import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    GoogleMapController mapController;
    String? locationMessage = 'No Location Currently!';
    String? lat;
    String? long;
    Position position;
    final CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(31.5000, 34.4667),
      zoom: 20,
    );
    LatLng currentLocation = _initialCameraPosition.target;
    Future<Position> getCurrentlyLocation() async {
      bool enable = await Geolocator.isLocationServiceEnabled();
      if(!enable){
        return Future.error('Location service is delay!');
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied){
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied){
          return Future.error('Location service is denied!');
        }
      }
      if (permission == LocationPermission.deniedForever){
        return Future.error('Location service is denied forever!');
      }
      return await Geolocator.getCurrentPosition();
    }

    // void locationLiveUpdate(){
    //   LocationSettings settings = const LocationSettings(
    //     accuracy: LocationAccuracy.high,
    //     distanceFilter: 100,
    //   );
    //   Geolocator.getPositionStream(locationSettings: settings).listen((Position position) {
    //     lat = position.latitude.toString();
    //     long = position.longitude.toString();
    //     setState(() {
    //       print(locationMessage = "latitude: $lat & longitude: $long");
    //     });
    //   });
    // }
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 400,
          width: double.infinity,
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              getCurrentlyLocation().then((value) {
                lat = "${value.latitude}";
                long = "${value.longitude}";
                setState(() {
                  print(locationMessage = "latitude: $lat & longitude: $long");
                });
              });
            },
            initialCameraPosition: _initialCameraPosition
          ),
        ),
      ),
    );
  }
}

// return SafeArea(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// CircularProgressIndicator(
// valueColor: AlwaysStoppedAnimation(theme.primaryColor),
// ),
// const Padding(
// padding: EdgeInsets.all(20.0),
// child: Text(
// 'Loading maps...',
// style: TextStyle(
// fontSize: 20.0,
// ),
// ),
// ),
// ],
// ),
// );