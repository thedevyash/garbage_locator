import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garbage_locator/maps/directions.dart';
import 'package:garbage_locator/maps/directions_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _googleMapController;
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(12.842213, 80.154987), zoom: 19);
  Directions? _info;
  Marker? _destination;
  late BitmapDescriptor myIcon;

  Marker _origin = Marker(
      markerId: const MarkerId('My Location'),
      infoWindow: const InfoWindow(title: 'My Location'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      position: LatLng(12.842213, 80.154987));
  Marker _bin1 = Marker(
      markerId: const MarkerId('Gazebo'),
      infoWindow: const InfoWindow(title: 'Gazebo'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(12.841641319700958, 80.15466033841899));
  Marker _bin2 = Marker(
      markerId: const MarkerId('North Square'),
      infoWindow: const InfoWindow(title: 'North Square'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(12.844177760374883, 80.15419599839028));
  Marker _bin3 = Marker(
      markerId: const MarkerId('A Block'),
      infoWindow: const InfoWindow(title: 'A Block'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(12.844476102191562, 80.15264482812181));
  Marker _bin4 = Marker(
      markerId: const MarkerId('B Block'),
      infoWindow: const InfoWindow(title: 'B Block'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(12.842099174772075, 80.15706564239548));
  Marker _bin5 = Marker(
      markerId: const MarkerId('C Block'),
      infoWindow: const InfoWindow(title: 'C Block'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(12.84300353870154, 80.15747129513399));
  Marker _bin6 = Marker(
      markerId: const MarkerId('Library'),
      infoWindow: const InfoWindow(title: 'Library'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(12.841448152052248, 80.15421721178225));
  String _value = 'Gazebo';
  Map<String, dynamic> status = {'Gazebo': 40, 'Library': 90, 'B Block': 90};

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    myIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan);
  }

  void _showDialog(BuildContext context, String n, int s, var loc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Nearest Bin',
            style: GoogleFonts.poppins(),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Your Nearest Bin Is $n',
                style: GoogleFonts.poppins(),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Bin Status=${s}%")
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _value = "$n";
                  _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: loc.position, zoom: 19.5, tilt: 50.0),
                    ),
                  );
                });
              },
              child: Text('Go To'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          value: _value,
          icon: Icon(Icons.location_city_sharp),
          items: [
            DropdownMenuItem(
                value: 'Gazebo',
                child: TextButton(
                    onPressed: () => _googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                                target: _bin1.position, zoom: 20.5, tilt: 50.0),
                          ),
                        ),
                    child: Text("Gazebo"))),
            DropdownMenuItem(
                value: 'North Square',
                child: TextButton(
                  onPressed: () => _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: _bin2.position, zoom: 19.5, tilt: 50.0),
                    ),
                  ),
                  child: Text("North Square"),
                )),
            DropdownMenuItem(
                value: 'A Block',
                child: TextButton(
                  onPressed: () => _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: _bin3.position, zoom: 19.5, tilt: 50.0),
                    ),
                  ),
                  child: Text("A Block"),
                )),
            DropdownMenuItem(
                value: 'B Block',
                child: TextButton(
                  onPressed: () => _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: _bin4.position, zoom: 19.5, tilt: 50.0),
                    ),
                  ),
                  child: Text("B Block"),
                )),
            DropdownMenuItem(
                value: 'C Block',
                child: TextButton(
                  onPressed: () => _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: _bin5.position, zoom: 19.5, tilt: 50.0),
                    ),
                  ),
                  child: Text("C Block"),
                )),
            DropdownMenuItem(
                value: 'Library',
                child: TextButton(
                  onPressed: () => _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: _bin6.position, zoom: 19.5, tilt: 50.0),
                    ),
                  ),
                  child: Text("Library"),
                )),
          ],
          onChanged: (String? value) {
            setState(() {
              _value = value!;
            });
          },
        ),
        actions: [
          TextButton(
              onPressed: () => _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: _origin.position, zoom: 14.5, tilt: 50.0),
                    ),
                  ),
              child: Text("ORIGIN")),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin,
              if (_bin1 != null) _bin1,
              if (_bin2 != null) _bin2,
              if (_bin3 != null) _bin3,
              if (_bin4 != null) _bin4,
              if (_bin5 != null) _bin5,
              if (_bin6 != null) _bin6
            },
            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: _info!.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
            onLongPress: _addMarker,
          ),
          if (_info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '${_info!.totalDistance}, ${_info!.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          Positioned(
            top: 550,
            right: 12,
            child: FloatingActionButton(
                child: Icon(Icons.center_focus_strong),
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(0, 46, 110, 1),
                onPressed: () {
                  _googleMapController.animateCamera(
                    _info != null
                        ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
                        : CameraUpdate.newCameraPosition(
                            _initialCameraPosition),
                  );
                  if (status['Gazebo'] <= status['Library'] &&
                      status['Gazebo'] <= status['Library'])
                    _showDialog(context, "Gazebo", status['Gazebo'], _bin1);
                  else if (status['Library'] <= status['B Block']) {
                    _showDialog(context, "Library", status['Library'], _bin6);
                  } else {
                    _showDialog(context, "B Block", status['B Block'], _bin4);
                  }
                }),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Row(
                children: [
                  SizedBox(
                      height: 80,
                      child: Image.asset(
                        "assets/images/maps green icon.png",
                        fit: BoxFit.fitHeight,
                      )),
                  Text("-> Dustbin", style: GoogleFonts.poppins())
                ],
              ),
              Row(
                children: [
                  Icon(Icons.person, size: 40),
                  Text(
                    "-> Location",
                    style: GoogleFonts.poppins(),
                  )
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('My Location'),
          infoWindow: const InfoWindow(title: 'My Location'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
          position: LatLng(12.842213, 80.154987),
        );
        _destination = null;
        _info = null;
      });
    } else {
      setState(() {
        _destination = Marker(
            markerId: const MarkerId('Destination'),
            infoWindow: const InfoWindow(title: 'Destination'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
            position: pos);
      });
      final directions = await DirectionsRepository(Dio())
          .getDirections(origin: _origin.position, destination: pos);
      setState(() => _info = directions);
    }
  }
}
