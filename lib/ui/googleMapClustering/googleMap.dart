import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'google_map_direction.dart';
import 'package:geolocator/geolocator.dart';
import 'places.dart';

class MapSample extends StatefulWidget {
  PostModel postModel;
  List<ClusterItem<Place>> items;
  MapSample({this.postModel, this.items});
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
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
  void initState() {
    _manager = _initClusterManager();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.95)
      ..addListener(_onScroll);
    getCurrentLocation();
    super.initState();
  }

  getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      // print("getCurrentPosition : " + position.toString());
      currentPosition = LatLng(position.latitude, position.longitude);
      // print(
      //     "getCurrentPosition currentPosition : " + currentPosition.toString());
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 12.0)));
    }).catchError((e) {
      print(e);
    });
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<Place>(widget.items, _updateMarkers,
        markerBuilder: _markerBuilder, initialZoom: _parisCameraPosition.zoom);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  void _updateMarkers(Set<Marker> markers) {
    //888888888888888  print('Updated ${markers.length} markers');
    setState(() {
      this.markers = markers;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: widget.items[_pageController.page.toInt()].location,
        zoom: 10.0)));
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
      _manager.setMapController(controller);
    });
  }

//jjjjjjjjjjjhhhhhhhhhhjjjjjjjjj
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
              onMapCreated: mapCreated,
              onCameraMove: _manager.onCameraMove,
              onTap: (v) {
                if (isPageViewerVisible)
                  setState(() {
                    isPageViewerVisible = false;
                  });
              },
              onCameraIdle: _manager.updateMap),
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
                    getCurrentLocation();
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
        _buildContainer(),
      ],
    );
  }

  _buildContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          // Provide an optional curve to make the animation feel smoother.
          curve: Curves.easeInToLinear,
          margin: EdgeInsets.only(bottom: 10),
          height: isPageViewerVisible ? 225.0 : 0.0,
          child: PageView.builder(
              controller: _pageController,
              itemCount: widget.postModel.data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, int) {
                var data = widget.postModel.data[int];
                var posteCreatedTime = DateTime.now().subtract(Duration(
                    minutes: data.user.createdAt.minute,
                    seconds: data.user.createdAt.second,
                    hours: data.user.createdAt.hour));
                LatLng destLocation = LatLng(
                    double.tryParse(data.address[0].latitude),
                    double.tryParse(data.address[0].longitude));
                return Container(
                    width: MediaQuery.of(context).size.width - 25,
                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                    child: Stack(
                      //mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              imageUrl: widget.postModel.url +
                                  widget.postModel.data[int].info.thumbnail,
                              placeholder: (context, url) =>
                                  dummyCoverImage(context, true),
                              errorWidget: (context, url, error) =>
                                  dummyCoverImage(context, false)),
                        ),
                        Positioned(
                          right: 1,
                          child: InkWell(
                            onTap: () {
                              geolocator
                                  .checkGeolocationPermissionStatus()
                                  .then((value) {
                                // print("" +
                                //     currentPosition.toString() +
                                //     "  " +
                                //     destLocation.toString());
                                if (value ==
                                    GeolocationStatus
                                        .granted) if (currentPosition != null)
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return GoogleMapDirection(
                                      destLocation: destLocation,
                                      sourceLocation: currentPosition,
                                    );
                                  }));
                                else
                                  showToast("Please enabled Location", true);
                                else {
                                  getCurrentLocation();
                                  showToast("Please enabled Location", true);
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    padding: EdgeInsets.all(5.0),
                                    color: Colors.white,
                                    child: SizedBox(
                                        height: 25,
                                        child: Image.asset(
                                          "assets/get_direction.png",
                                          height: 10,
                                          width: 5,
                                        )),
                                  )),
                            ),
                          ),
                        ),
                        bottomBar(posteCreatedTime, data)
                      ],
                    ));
              })),
    );
  }

  bottomBar(DateTime jobPostingdTime, Datum data) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        child: Container(
          // duration: Duration(milliseconds: 150),
          // // Provide an optional curve to make the animation feel smoother.
          // curve: Curves.fastOutSlowIn,
          color: smokeybgColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  data.info.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  data.info.description,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    color: smokeyColor,
                    fontSize: 11.0,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  data.info.unitId + " " + data.info.unitTitle,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            //  cluster.items.forEach((p) => print(p));
            if (!cluster.isMultiple) {
              if (!isPageViewerVisible)
                setState(() {
                  isPageViewerVisible = true;
                });

              var markerID = cluster.items.elementAt(0).name.toString();
              for (int i = 0; i < widget.postModel.data.length; i++) {
                if (widget.postModel.data[i].address[0].id == markerID) {
                  _pageController.animateToPage(
                    i,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                  break;
                }
              }
            } else {
              setState(() {
                isPageViewerVisible = true;
              });
            }
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 100 : 50,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String text}) async {
    assert(size != null);

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = colorMain;
    final Paint paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 3,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}
