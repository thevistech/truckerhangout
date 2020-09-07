import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/places.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BrokersGoogleMap extends StatefulWidget {
  DashBoardMainStore dashBoardMainStore;
  List<ClusterItem<Place>> items;
  BrokersGoogleMap({this.dashBoardMainStore, this.items});
  @override
  State<BrokersGoogleMap> createState() => BrokersGoogleMapState();
}
class BrokersGoogleMapState extends State<BrokersGoogleMap> {
  ClusterManager _manager;
  GoogleMapController _controller;
  Set<Marker> markers = Set();
  CameraPosition _parisCameraPosition =
  CameraPosition(target: LatLng(30.3753, 69.3451), zoom: 4.0);
  PageController _pageController;
  int prevPage;
  bool isPageViewerVisible = false;
  MapType _currentMapType = MapType.normal;
  LatLng currentPosition;
  String _currentAddress;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
              mapType: _currentMapType,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              initialCameraPosition: _parisCameraPosition,
              markers: markers,
              zoomControlsEnabled: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: _onMapTypeButtonPressed,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5.0),
                          color: Colors.white,
                          child: Icon(
                            Icons.map,
                            color: colorMain,
                            size: 22,
                          ),
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                   // getCurrentLocation();
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5.0),
                          color: Colors.white,
                          child: Icon(
                            Icons.location_searching,
                            color: colorMain,
                            size: 22,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

}