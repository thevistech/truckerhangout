import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/shimmer/postListView.dart';
import 'package:flutterapp/ui/googleMapClustering/googleMap.dart';
import 'package:flutterapp/ui/homePost/home_posts_widget.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../stores/projects_store.dart';
import '../stores/dashboard_main_store.dart';
import '../ui/components/slider_widget.dart';

class Projects extends StatefulWidget {
  final ProjectStore projectStore;
  var currentUserImage;
  final DashBoardMainStore dashBoardMainStore;
  Projects(
      {this.projectStore,
      this.dashBoardMainStore,
      Key key,
      this.currentUserImage})
      : super(key: key);
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  int _current = 0;
  var currentUser;
  String basicImageUrl = "";
  String userName;
  String userFullName;

  static const LatLng _center = const LatLng(45.521563, -122.677433);
  final Completer<GoogleMapController> _mapController = Completer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!widget.projectStore.isProjectsPostLoaded)
        widget.projectStore.getProperties(context);
      if (!widget.projectStore.isAdvertisementsLoaded)
        widget.projectStore.getAdvertisement(context);
    });
    basicImageUrl = widget.currentUserImage;
    Config.getUserID().then((value) => currentUser = value);
    // Config.getUserProfilePicture().then((value) => basicImageUrl = value);
    Config.getUserDisplayName().then((value) => userName = value);
    Config.getUserName().then((value) => userFullName = value);
    _mapController.complete();
    // widget.dashBoardMainStore.isMapVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Observer(
        builder: (_) => visibilityListAndMapPage(
            widget.dashBoardMainStore.isMapVisible, height));
  }

  showPostData(height) {
    return Container(
      height: height,
      child: widget.projectStore.isProjectsPostLoaded
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: widget.projectStore.postModel.data.length + 1,
              itemBuilder: (ctx, int) {
                if (int == 0) {
                  return SliderWidget(
                    callType: PROJECTS,
                    projectStore: widget.projectStore,
                  );
                }
                return PostWidget(
                  post: widget.projectStore.postModel.data[int - 1],
                  currentUser: currentUser,
                  baseUrl: widget.projectStore.postModel.url,
                  dashBoardMainStore: widget.dashBoardMainStore,
                  currentUserImageUrl: basicImageUrl,
                  userName: userName,
                  userFullName: userFullName,
                );
              })
          : shimmerPost(context),
    );
  }

  //*************** Flip Map Widget On Create ***************//

  void _onMapCreated(GoogleMapController controller) {
    if (!_mapController.isCompleted) _mapController.complete(controller);
  }

  //*************** Flip Map Widget ***************//

  flipWidgetGoogleMapView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
      ),
    );
  }

  visibilityListAndMapPage(isVisible, height) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: IndexedStack(
          index: !isVisible ? 0 : 1,
          children: <Widget>[
            showPostData(height),
            widget.projectStore.items != null
                ? MapSample(
                    postModel: widget.projectStore.postModel,
                    items: widget.projectStore.items,
                  )
                : Container(
                    width: double.infinity,
                    height: double.infinity,
                  ),
          ],
        )),
      ],
    );
  }
}
