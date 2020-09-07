import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapp extends StatefulWidget {
  @override
  _GoogleMappState createState() => _GoogleMappState();
}

class _GoogleMappState extends State<GoogleMapp> {

  GoogleMapController mapController;
  String searchAddr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: onMapCreated, initialCameraPosition: null,
            ),
          ])
    );


  }

  void onMapCreated(controller)
  {
    setState(() {
      mapController = controller;
    });
  }
}

