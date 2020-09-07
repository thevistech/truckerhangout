import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/ui/signup/sign_up.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/constants.dart';
import 'package:flutterapp/utills/loaders/progress_dialog.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPicker extends StatefulWidget {
  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  GoogleMapController mapController;
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  LatLng _initialPosition;
  LatLng latLng = _center;
  LatLng _positionForIdle;
  BitmapDescriptor myIcon;

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getUserLocation());
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(512, 512)), 'assets/marker.png')
        .then((onValue) {
      myIcon = onValue;
      showMarkerOnCameraIdel(_initialPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 1.1;
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          /*  GoogleMap(
            onMapCreated: onMapCreated,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: Constant.curentLoc == null ? _center : Constant.curentLoc,
              zoom: 15.0,
            ),
          ), */
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: Constant.curentLoc == null ? _center : Constant.curentLoc,
              zoom: 15.0,
            ),
            onMapCreated: onMapCreated,
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onCameraMove: ((_position) => _updatePosition(_position)),
            onCameraIdle: () => showMarkerOnCameraIdel(_positionForIdle),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: submitLoc(width),
            ),
          )
        ],
      ),
    );
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _getUserLocation() async {
    ProgressDialogDotted().showProgressDialog(context);
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);

    setState(() {
      _positionForIdle =
          _initialPosition = LatLng(position.latitude, position.longitude);
      print('${placemark[0].name}');
      print('$_initialPosition');
      showMarkerOnCameraIdel(_initialPosition);
    });
    ProgressDialogDotted().hideProgressDialog(context);
  }

  submitLoc(width) {
    return Container(
//      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//      padding: EdgeInsets.all(0.0),
      height: height40,
      width: width,
      child: RaisedButton(
        onPressed: () async {
          ProgressDialogDotted().showProgressDialog(context);
          var address = await getAddress();
          Navigator.pop(context, address);
        },
        padding: EdgeInsets.all(0),
        color: colorMain,
        disabledColor: colorMain,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Submit',
                style: TextStyle(fontSize: buttonFontSize),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // padding: const EdgeInsets.symmetric(horizontal: 0),
              // margin: EdgeInsets.fromLTRB(8, 5, 0, 5),
              margin: EdgeInsets.all(4),
              //   margin: EdgeInsets.all(0),
            ),
          ],
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

  getAddress() async {
    final coordinates =
        new Coordinates(_positionForIdle.latitude, _positionForIdle.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    ProgressDialogDotted().hideProgressDialog(context);
    var first = addresses.first;
    print(first.addressLine);
    print(first.subLocality);
    print(first.countryName);
    print(first.locality);
    return first;
  }

  void _updatePosition(CameraPosition _position) {
    _positionForIdle =
        LatLng(_position.target.latitude, _position.target.longitude);
    Marker marker = _markers.firstWhere(
        (p) => p.markerId == MarkerId('marker_2'),
        orElse: () => null);
    _markers.remove(marker);
  }

  showMarkerOnCameraIdel(LatLng _position) {
    _markers.add(
      Marker(
          markerId: MarkerId('marker_2'),
          position: LatLng(_position.latitude, _position.longitude),
          draggable: true,
          icon: myIcon),
    );
    setState(() {});
  }
}
