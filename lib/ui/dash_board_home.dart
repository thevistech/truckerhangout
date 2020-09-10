import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/shimmer/postListView.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/components/slider_widget.dart';
import 'package:flutterapp/ui/dialogs/brokers_profile.dart';
import 'package:flutterapp/ui/filters/home_type_filter.dart';
import 'package:flutterapp/ui/filters/listing_filter.dart';
import 'package:flutterapp/ui/filters/price_filter.dart';
import 'package:flutterapp/ui/googleMapClustering/googleMap.dart';
import 'package:flutterapp/ui/google_map_with_bottom_card.dart';
import 'package:flutterapp/ui/homePost/home_posts_widget.dart';
import 'package:flutterapp/ui/components/stories_widget.dart';
import 'package:flutterapp/ui/services/eld_gps_service_screen.dart';
import 'package:flutterapp/ui/services/finance_factoring_service_screen.dart';
import 'package:flutterapp/ui/services/question_answer_service.dart';
import 'package:flutterapp/ui/smart_search/search_cdl_schools_screen.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/brokers_avatar.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutterapp/models/services_model.dart';
import 'package:flutterapp/ui/services/job_services_screen.dart';
import 'package:flutterapp/ui/services/company_reviews_services.dart';
import 'package:flutterapp/ui/services/repair_services_screen.dart';
import 'package:flutterapp/ui/services/cdl_school_service_screen.dart';

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import '../utills/UiColors.dart';
import '../utills/config.dart';
import '../shimmer/profileListView.dart';
import 'components/follow_widget.dart';
import 'components/location_widget.dart';

class DasboardHomeMain extends StatefulWidget {
  final DashBoardMainStore store;
  var currentUserImage;
  final ScrollController scrollController;

  DasboardHomeMain(
      {this.store, this.scrollController, Key key, this.currentUserImage})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _DasboardHomeMainState();
  }
}

class _DasboardHomeMainState extends State<DasboardHomeMain> {
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  final Completer<GoogleMapController> _mapController = Completer();
  String currentUser;
  String basicImageUrl = "";
  String userName;
  String userFullName;

  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);
  @override
  void initState() {
    basicImageUrl = widget.currentUserImage;
    internetCheckApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.white,
      body: Observer(
        name: "mainObserver",
        builder: (_) => widget.store.isInternetConnected
            ? visibilityListAndMapPage(widget.store.isMapVisible)
            : noInternetWidget(),
      ),
    );
  }

  internetCheckApi() {
    widget.store.checkIntenetConnection().then((value) {
      if (value) {
        callApi();
      }
    });
  }

  callApi() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!widget.store.isPropertyPostLoaded)
        widget.store.getProperties(context);
      if (!widget.store.isFilterListLoaded)
        widget.store.getFiltersData(context);
      if (!widget.store.isBrokerListLoaded) widget.store.getBrokers(context);
      if (!widget.store.isAdvertisementsLoaded)
        widget.store.getAdvertisement(context);
      if (!widget.store.isStoryPostLoaded) widget.store.getStories(context);
      if (!widget.store.isFollowSuggestionLoaded)
        widget.store.getFollowSuggestion(context);
    });
    _mapController.complete();
    Config.getUserID().then((value) => currentUser = value);
    Config.getUserProfilePicture().then((value) => basicImageUrl = value);
    Config.getUserDisplayName().then((value) => userName = value);
    Config.getUserName().then((value) => userFullName = value);
    widget.store.isMapVisible = false;
  }

  noInternetWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 150,
        ),
        Center(child: Lottie.asset('assets/no_internet_connection.json')),
        GestureDetector(
          onTap: () {
            widget.store.isInternetConnected = true;
            Future.delayed(Duration(seconds: 3), () {
              internetCheckApi();
            });
          },
          child: Text(
            "Retry ?",
            style: TextStyle(color: colorMain, letterSpacing: 1.0),
          ),
        )
      ],
    );
  }

  visibilityListAndMapPage(isVisible) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: IndexedStack(
          index: !isVisible ? 0 : 1,
          children: <Widget>[
            showPostData(),
            widget.store.items != null
                ? MapSample(
                    postModel: widget.store.postModel,
                    items: widget.store.items,
                  )
                : Container(
                    width: double.infinity,
                    height: double.infinity,
                  ),
            //  flipWidgetGoogleMapView(),
          ],
        )),
        Align(
            alignment: Alignment.topCenter,
            child: Container(
                color: UiColors.white,
                child: filterSelection(widget.store.filterProperty))),
      ],
    );
  }

  showPostData() {
    return widget.store.isPropertyPostLoaded
        ? ScrollConfiguration(
            behavior: new ScrollBehavior()
              ..buildViewportChrome(context, null, AxisDirection.down),
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (ctx, i) {
                if (i == 0) return services();

                if(i==1)
                  return createPost(context);
                if(i == 2)
                  return Stories(
                    stories: widget.store.storiesModel,
                    dashboardStore: widget.store,
                  );
                if (i == 3)
                  return PostWidget(
                      post: widget.store.postModel.data[i - 3],
                      currentUser: currentUser,
                      baseUrl: widget.store.postModel.url,
                      dashBoardMainStore: widget.store,
                      currentUserImageUrl: basicImageUrl,
                      userName: userName,
                      userFullName: userFullName,
                      filterPropertyModel: widget.store.filterPropertyModel);

                if (i == 4)
                  return LocationWidget(
                    dashboardStore: widget.store,
                    currentUserImage: basicImageUrl,
                  );
                if (i == 5)
                  return PostWidget(
                    post: widget.store.postModel.data[i - 4],
                    currentUser: currentUser,
                    baseUrl: widget.store.postModel.url,
                    dashBoardMainStore: widget.store,
                    currentUserImageUrl: basicImageUrl,
                    userName: userName,
                    userFullName: userFullName,
                  );
                if (i == 6)
                  return SliderWidget(
                    dashboardStore: widget.store,
                    callType: DASHBOARD,
                  );


                if (i < 11)
                  return PostWidget(
                    post: widget.store.postModel.data[i - 5],
                    currentUser: currentUser,
                    baseUrl: widget.store.postModel.url,
                    dashBoardMainStore: widget.store,
                    currentUserImageUrl: basicImageUrl,
                    userName: userName,
                    userFullName: userFullName,
                  );
                if (i == 11) {
                  return Follow(
                    dashboardStore: widget.store,
                  );
                }
                return PostWidget(
                  post: widget.store.postModel.data[i - 6],
                  currentUser: currentUser,
                  baseUrl: widget.store.postModel.url,
                  dashBoardMainStore: widget.store,
                  currentUserImageUrl: basicImageUrl,
                  userName: userName,
                  userFullName: userFullName,
                );
              },
              itemCount: widget.store.postModel.data.length + 6,
              controller: widget.scrollController,
            ),
          )
        : shimmerPost(context);
  }

  brokersLists() {
    return Observer(
      builder: (context) => widget.store.isBrokerListLoaded
          ? Container(
              height: 105.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  var data = widget.store.brokersList.data.data;
                  var profilePicUrl =
                      widget.store.brokersList.url + "" + data[i].picture;
                  return BrokerAvatarWidget(
                    user: widget.store.brokersList.data.data[i],
                    onTap: () =>
                        showProfileDialog(context, data[i], profilePicUrl),
                    isLarge: true,
                    isCurrentUserStory: i == 0,
                    store: widget.store,
                  );
                },
                itemCount: widget.store.brokersList.noOfRecords,
              ),
            )
          : shimmerProfileList(),
    );
  }

  Widget services() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            height: 90,
            child: Padding(
              padding: const EdgeInsets.only(top:5.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: servicesList.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) {
                    var list = servicesList[i];
                    return GestureDetector(
                      onTap: (){
                        openServicePage(i);
                      },
                      child: Column(
                        children: <Widget>[

                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: colorDivider)
                               ),
                            child:Padding(padding: EdgeInsets.all(4),
                            child:    Container(
                              decoration: new BoxDecoration(
                                  color: smokeybgColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: colorDivider)),

                              child: Padding(
                                padding: EdgeInsets.all(09),
                                child:SvgPicture.asset(
                                  list.image,
                                  color: colorMain,
                                ) ,

                              ),
                            ),)

                          ),
                          Container(
                            width: 75,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                "${list.name}",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )),
      ],
    );
  }
  Widget createPost(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.only(top:8,bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(thickness: 1,color: smokeybgColor,height: 1,),
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width,
            color:Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child:
                      Container(
                        width: 40,
                        height: 40,
                        decoration:
                        ShapeDecoration(shape: CircleBorder(), color: Colors.white),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                width: 40,
                                height:40,
                                imageUrl: widget.currentUserImage,
                                placeholder: (context, url) =>
                                new CircularProgressIndicator(
                                  backgroundColor: colorMain,
                                ),
                                errorWidget: (context, url, error) => SvgPicture.asset(
                                  defaultUserImage,
                                  height: 40,
                                  width: 40,
                                ))),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              //color: smokeybgColor,
                               border: Border.all(color: UiColors.divider, width: 1),
                              borderRadius: BorderRadius.circular(32.0)),
                          child: Container(
                            child: GestureDetector(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 32,
                                padding: EdgeInsets.only(right: 7.0, left: 10.0),
                                child: Text(
                                  "What's on your mind?",
                                  style:
                                  TextStyle(color: UiColors.black, fontSize: 12.0),
                                ),
                              ),
                              onTap: () {

                              },
                              // onTap: _showAddCommentModal,
                            ),
                          ),
                        ),
                      ),
                    ),
                   // Text("What's on your mind?" , style: TextStyle(color: Colors.black54,fontSize: 12),)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Divider(height: 1, thickness: 1,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15.0,top:10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/photo.svg',
                            height:18,
                            width: 18,
                          ),
                          SizedBox(width: 5,),
                          Text('Photo/Video' , style: TextStyle(fontSize: 12.0,color: UiColors.black),),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: 20,
                        color: colorDivider,
                      ),
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/jobs_services.svg',
                            height:18,
                            width: 18,
                            color: UiColors.black,
                          ),
                          SizedBox(width: 5,),
                          Text('Jobs' , style: TextStyle(fontSize: 12.0,color: UiColors.black),),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: 20,
                        color: colorDivider,
                      ),
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/truck_line.svg',
                            height:20,
                            width: 20,
                          ),
                          SizedBox(width: 5,),
                          Text('Sell & Lease' , style: TextStyle(fontSize: 12.0,color: UiColors.black),),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: 20,
                        color: colorDivider,
                      ),
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/more.svg',
                            height:18,
                            width: 18,
                          ),
                          SizedBox(width: 2,),
                          Text('More' , style: TextStyle(fontSize: 12.0,color: UiColors.black),)
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Divider(height: 1, thickness: 1,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showProfileDialog(context, brokersList, profilePicUrl) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return RcustomDialog(
            brokersList: brokersList, profilePicUrl: profilePicUrl);
      },
    );
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

//*************** Flip Map Widget On Create ***************//

  void _onMapCreated(GoogleMapController controller) {
    if (!_mapController.isCompleted) _mapController.complete(controller);
  }

//*************** Fitler Selection Switch Case ***************//

  filterSelection(mainDashBoardMenu filterProperty) {
    switch (filterProperty) {
      case mainDashBoardMenu.none:
        return Container(
          height: 0,
          width: 0,
        );
      case mainDashBoardMenu.listing:
        return ListingFilter(
          dashboardStore: widget.store,
        );

      case mainDashBoardMenu.price:
        return PriceFilter(
          dashboardStore: widget.store,
        );

      case mainDashBoardMenu.hometype:
        return HomeTypeFilter(
          dashboardStore: widget.store,
        );
      case mainDashBoardMenu.more:
        // TODO: Handle this case.
        break;
    }
  }

  void openServicePage(int i) {

    switch(i){
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JobServicesScreen(
              currentUserImage: basicImageUrl,
            ),
          ),
        );
        break;

      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EldGpsServiceScreen(
              currentUserImage: basicImageUrl,
            ),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FinanceFactoringScreen(
              currentUserImage: basicImageUrl,
            ),
          ),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionAnswersScreen(
              currentUserImage: basicImageUrl,
            ),
          ),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CDLSchoolScreen(
              currentUserImage: basicImageUrl,
            ),
          ),
        );
        break;
      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompanyReviewsServiceScreen(
              currentUserImage: basicImageUrl,
            ),
          ),
        );
        break;
      case 9:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RepairServicesScreen(
              currentUserImage: basicImageUrl,
            ),
          ),
        );
        break;
    }
  }

}
