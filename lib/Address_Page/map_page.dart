import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart'; // Add this package

class map_page extends StatefulWidget {
   ValueChanged<String> onAddressChanged;
   String address;
   map_page({Key? key,required this.onAddressChanged,required this.address}) : super(key: key);
  

  @override
  _map_pageState createState() => _map_pageState();
}

class _map_pageState extends State<map_page> {
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition _initialCameraPosition;
  Set<Marker> _markers = {};
  String _address = ''; 

  @override
  void initState() {
    super.initState();
        _initialCameraPosition = CameraPosition(target: LatLng(0, 0), zoom: 14.0); // Initialize with a default value
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
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
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are denied permanently');
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _initialCameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14.0,
      );
      _markers.add(
        Marker(
          markerId: const MarkerId('currentLocation'),
          position: LatLng(position.latitude, position.longitude),
          infoWindow:  InfoWindow(
            title: S.of(context).Your_Current_Location,
          ),
        ),
      );
    });

    final placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    final address = '${placemarks.first.name} , ${placemarks.first.administrativeArea}, ${placemarks.first.country}';
    setState(() {
      widget.address = address;
    });

    widget.onAddressChanged(address);

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
          children: [
             
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height:DeviceDimenssions.deviceHeight*.25,
                child: Expanded(
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _initialCameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: _markers,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: DeviceDimenssions.deviceHeight*.08,
                width: DeviceDimenssions.deviceWidth*.9,
               decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 205, 205, 205),
                blurRadius: 8.0,
                spreadRadius: 4.0,
                offset: Offset(0, 8),
              ),
                        ],
                      ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,top: 2),
                  child: Column(
                    children: [
                       Row(
                        children: [
                          Icon(Icons.location_on_rounded),
                          Text(S.of(context).Area)
                        ],
                      ),
                      Text(widget.address),
                    ],
                  ),
                )
                ),
            ),
          ],
        ),
    );
    
  }

}