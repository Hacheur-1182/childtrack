import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChildPosition extends StatelessWidget {
  const ChildPosition({key, this.latitude, this.longitude}) : super(key: key);
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1a237e),
        automaticallyImplyLeading: false,
        title: Text(
          "ChildTrack",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ViewChildPosition(
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }
}

class ViewChildPosition extends StatefulWidget {
  const ViewChildPosition({key, this.latitude, this.longitude})
      : super(key: key);
  final double latitude;
  final double longitude;

  @override
  _ViewChildPositionState createState() => _ViewChildPositionState();
}

class _ViewChildPositionState extends State<ViewChildPosition> {
  var lat;
  var lng;
  @override
  void initState() {
    lat = widget.latitude;
    lng = widget.longitude;

    print(widget.latitude);
    print(widget.longitude);
  }
  //TODO: put the position of thr unique child inside LatLong
  GoogleMapController _controller;
  @override
  Widget build(BuildContext context) {
      return GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(lat.toDouble(), lng.toDouble()),
          zoom: 16,
        ),
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        markers: {
          Marker(
            markerId: const MarkerId("origin"),
            infoWindow: const InfoWindow(title: "Origin"),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(lat, lng),
          )},
        onTap: (cordonate) {
          _controller.animateCamera(
            CameraUpdate.newLatLng(cordonate),
          );
        },
      );
    }
  }

