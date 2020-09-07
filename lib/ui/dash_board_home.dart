import 'dart:async';
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
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/brokers_avatar.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutterapp/models/services_model.dart';

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
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

                if (i == 1)
                  return PostWidget(
                      post: widget.store.postModel.data[i - 1],
                      currentUser: currentUser,
                      baseUrl: widget.store.postModel.url,
                      dashBoardMainStore: widget.store,
                      currentUserImageUrl: basicImageUrl,
                      userName: userName,
                      userFullName: userFullName,
                      filterPropertyModel: widget.store.filterPropertyModel);

                if (i == 2)
                  return LocationWidget(
                    dashboardStore: widget.store,
                    currentUserImage: basicImageUrl,
                  );
                if (i == 3)
                  return PostWidget(
                    post: widget.store.postModel.data[i - 2],
                    currentUser: currentUser,
                    baseUrl: widget.store.postModel.url,
                    dashBoardMainStore: widget.store,
                    currentUserImageUrl: basicImageUrl,
                    userName: userName,
                    userFullName: userFullName,
                  );
                if (i == 4)
                  return SliderWidget(
                    dashboardStore: widget.store,
                    callType: DASHBOARD,
                  );

                if (i < 6)
                  return PostWidget(
                    post: widget.store.postModel.data[i - 3],
                    currentUser: currentUser,
                    baseUrl: widget.store.postModel.url,
                    dashBoardMainStore: widget.store,
                    currentUserImageUrl: basicImageUrl,
                    userName: userName,
                    userFullName: userFullName,
                  );

                if (i == 6)
                  return Stories(
                    stories: widget.store.storiesModel,
                    dashboardStore: widget.store,
                  );

                if (i < 11)
                  return PostWidget(
                    post: widget.store.postModel.data[i - 4],
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
                  post: widget.store.postModel.data[i - 5],
                  currentUser: currentUser,
                  baseUrl: widget.store.postModel.url,
                  dashBoardMainStore: widget.store,
                  currentUserImageUrl: basicImageUrl,
                  userName: userName,
                  userFullName: userFullName,
                );
              },
              itemCount: widget.store.postModel.data.length + 5,
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
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: servicesList.length,
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  var list = servicesList[i];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: <Widget>[
                     /*   Container(
                          width: 67.0,
                          height: 67.0,

                          child: Container(
                            width: 65,
                              height: 65,
                              decoration: BoxDecoration(

                                color:  UiColors.red,
                                borderRadius: BorderRadius.circular(80.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(13),
                                child:SvgPicture.asset(
                                  list.image,
                                  color: UiColors.white,
                                ) ,
                              )),
                          decoration: BoxDecoration(
                            border: Border.fromBorderSide(
                                BorderSide(color:UiColors.white, width: 2.0)),
                            color:  list.color,
                            // image: DecowrationImage(image:  , fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(80.0),
//                      border: Border.all(
//                          color: Colors.deepPurple,
//                          width: 4.0
//                      )
                          ),
                        ),
*/
                        Container(
                          width: 67.0,
                          height: 67.0,
                          decoration: new BoxDecoration(
                            color: list.color,
                              shape: BoxShape.circle,
                             ),
                          child:Padding(padding: EdgeInsets.all(4),
                          child:    Container(
                            decoration: new BoxDecoration(
                                color: list.color,
                                shape: BoxShape.circle,
                                border: Border.all(color: UiColors.white)),

                            child: Padding(
                              padding: EdgeInsets.all(13),
                              child:SvgPicture.asset(
                                list.image,
                                color: UiColors.white,
                              ) ,

                            ),
                          ),)

                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            list.name,
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  );
                })),
      ],
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
/* 
  //*************** Fitler API Call ***************//

  void getFilterData() {
    widget.store.getFiltersData(context).then((value) {
      if (value.error == "false") {
        widget.store.isFilterListLoaded = true;
        widget.store.filterPropertyModel = value;
      }
    });
  }

  //*************** Brokers List API Call ***************//

  void getBrokersList() {
    widget.store.getBrokers(context).then((value) {
      widget.store.isBrokerListLoaded = true;
      widget.store.brokersList = value;
    });
  }
 */

/* 
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    //widget.store.brokersList.add((widget.store.brokersList.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }
 */
/* 
  refresh() {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("release to load more");
          } else {
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        itemBuilder: (c, i) => Card(child: Center(child: Text(" asd"))),
        itemExtent: 100.0,
        itemCount: 5,
      ),
    );
  }
 */

//*************** More Filter / Home Type Filter Property List ***************//

/*  peopertyTypeList(FilterPropertyModel response, isHomeType) {
    List<PropertyParentCategory> _propertyParentCategory;
    if (widget?.store?.filterPropertyModel?.data?.propertyParentCategory !=
        null) {
      _propertyParentCategory =
          widget.store.filterPropertyModel.data.propertyParentCategory;
      // for (int i = 0; i < response.data.propertyParentCategory.length; i++) {
      //   for (int j = 0; j < response.data.propertyChildCategory.length; j++) {
      //     if (response.data.propertyParentCategory[i].id ==
      //         response.data.propertyChildCategory[j].propertyParentCategoryId) {
      //       propertyListingHashMap[
      //               "$response.data.propertyParentCategory[j].id}"] =
      //           "${response.data.propertyChildCategory[j].propertyParentCategoryId}";
      //     }
      //   }
      // }
      return Container(
        height: 25,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _propertyParentCategory?.length,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                if (!isHomeType) return;
                for (int i = 0;
                    i < propertyParentCategoryIsClicked.length;
                    i++) {
                  propertyParentCategoryIsClicked[i] = false;
                }

                if (propertyParentCategoryIsClicked[index] == true)
                  propertyParentCategoryIsClicked[index] = false;
                else
                  propertyParentCategoryIsClicked[index] = true;

                widget.store.homeTypeParentID =
                    response.data.propertyParentCategory[index].id;
              },
              child: Container(
                margin: EdgeInsets.only(
                    right: _propertyParentCategory.length != int ? 5.0 : 0.0),
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: propertyParentCategoryIsClicked[index]
                        ? colorMain
                        : Colors.white,
                    border: Border.all(width: 1, color: colorMain)),
                padding: EdgeInsets.all(2.0),
                alignment: Alignment.center,
                child: Text(
                  _propertyParentCategory[index].title,
                  style: TextStyle(
                    fontSize: 12,
                    color: propertyParentCategoryIsClicked[index]
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else
      Container(
        width: 0,
        height: 0,
      );
  }
 */
//*************** More Filter Purpose List ***************//

/* purposeTypeList(FilterPropertyModel response) {
    return Container(
      height: 45,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: response.data?.propertyPurposes?.length,
        itemBuilder: (ctx, int) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 5),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  color: Colors.white,
                  border: Border.all(width: 1, color: colorMain)),
              padding: EdgeInsets.all(2.0),
              alignment: Alignment.center,
              child: Text(
                response.data?.propertyPurposes[int].title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
 */
}
/* Widget cards(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.asset('assets/bhariaimg.png',
            fit: BoxFit.cover, height: 200.0, width: width),
      ),
    );
  }
 */
/*   flippableBoxView(isVisible) {
    return FlippableBox(
      front: listOfBrokersAndProperties(),
      back: flipWidgetGoogleMapView(),
      isFlipped: isVisible,
    );
  }
 */
/* Widget topFavouriteWidget() {
    return Positioned(
      top: 15,
      right: 10,
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration:
            BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
        child: SizedBox(
          height: 18,
          width: 18,
          child: IconButton(
            padding: EdgeInsets.all(0.0),
            onPressed: () {},
            icon: Icon(Icons.favorite, size: 18, color: colorMain),
            //size: suffixIconSize,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
 */
/*   listOfBrokersAndProperties() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: brokersData(),
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(height: 1, color: colorDivider),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                          color: Colors.white,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              padding: EdgeInsets.only(bottom: 50),
                              child: Stack(
                                overflow: Overflow.visible,
                                children: <Widget>[
                                  cards(context),
                                  topFavouriteWidget(),
                                  bottomWidget(context)
                                ],
                              ),
                            ),
                          ),
                        ),
                    childCount: 5),
              )
            ],
          ),
          // listingFilters(),
        ],
      ),
    );
  }
 */
/*   Widget bottomWidget(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Positioned(
        bottom: -50,
        right: 0,
        left: 0,
        child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            //  color: Colors.blue,
            height: 100,
            width: width,
            child: Card(
              //   color: Colors.blue,
              child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('from'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'PKR 1.5 Crore',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              Container(
                                  width: 35,
//child: Icon(Icons.airline_seat_individual_suite),
//                            child: Icon(Icons.hotel),
//                            child: Icon(Icons.open_with),
                                  child: Image.asset(
                                    'assets/beds.png',
                                    fit: BoxFit.fill,
                                  )),
                              Positioned(
                                  top: 4,
                                  left: -10,
                                  child: Text('4',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              Container(
                                  width: 30,
                                  child: Image.asset(
                                    'assets/washroom.png',
                                    fit: BoxFit.fill,
                                  )),
                              Positioned(
                                  top: 4,
                                  left: -10,
                                  child: Text('4',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '120 Sqft',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset('assets/squareft.png')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Bahria Town',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Iqbal Villa Karachi',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(Pakistan)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: colorMain),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: IconButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone_android,
                                  size: 18,
                                  color: colorMain,
                                ),
                                //size: suffixIconSize,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: IconButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone_in_talk,
                                  size: 18,
                                  color: colorMain,
                                ),
                                //size: suffixIconSize,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: IconButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 18,
                                  color: colorMain,
                                ),
                                //size: suffixIconSize,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            )));
  }
 */
/*  brokersData() {
    return Observer(
      name: "brokerList",
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: widget?.store?.brokersList?.noOfRecords == 0 ||
                widget?.store?.brokersList?.noOfRecords == null
            ? new Container(
                alignment: Alignment.center,
                height: 85,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Text(
                  '',
                  textAlign: TextAlign.center,
                ),
              )
            : SizedBox(
                height: 85,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.store.brokersList.noOfRecords,
                  itemBuilder: (ctx, int) {
                    var data = widget.store.brokersList.data.data;
                    var profilePicUrl =
                        widget.store.brokersList.url + "" + data[int].picture;
                    return InkWell(
                      onTap: () {
                        showProfileDialog(context, data[int], profilePicUrl);
                      },
                      child: Container(
                        width: 60,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                CircleAvatar(
                                    radius: 28.0,
                                    backgroundImage:
                                        NetworkImage(profilePicUrl),
                                    backgroundColor: disabledButtonColor),
                                Positioned(
                                  right: 5,
                                  bottom: 0,
                                  child: (data[int].status == "true")
                                      ? new Container(
                                          alignment: Alignment.bottomRight,
                                          width: 12.0,
                                          height: 12.0,
                                          decoration: BoxDecoration(
                                              color: Color(0xff3ED10A),
                                              shape: BoxShape.circle),
                                        )
                                      : new Container(),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "${data[int].title}",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
 */
//*************** Listing Filter ***************//
/*   listingFilter() {
    List<PropertyPurpose> filterPropertyPurposes;
    if (widget?.store?.filterPropertyModel != null) {
      FilterPropertyModel data = widget?.store?.filterPropertyModel;
      for (int i = 0; i < data.data?.propertyPurposes?.length; i++) {
        for (int j = 0; j < data.data?.propertyPurposeTypes?.length; j++) {
          if (data.data.propertyPurposes[i].id ==
              data.data.propertyPurposeTypes[j].propertyPurposeId) {
            propertyListingHashMap["${data.data.propertyPurposeTypes[j].id}"] =
                "${data.data.propertyPurposeTypes[j].propertyPurposeId}";
          }
        }
        propertyPurposesCheckBox.add(false);
        propertyPurposesTypeExpandable.add(false);
      }
      filterPropertyPurposes =
          widget?.store?.filterPropertyModel?.data?.propertyPurposes;
    }
    return Container(
      child: widget.store.filterPropertyModel != null
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    color: colorMain,
                    height: 1,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: filterPropertyPurposes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15, top: 8),
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32),
                                  border:
                                      Border.all(color: colorMain, width: 1.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      width: 10,
                                      height: 10,
                                      color: setColor(
                                          filterPropertyPurposes[index].title),
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child: Text(
                                            filterPropertyPurposes[index]
                                                .title)),
                                    propertyListingHashMap.containsValue(
                                            filterPropertyPurposes[index].id)
                                        ? InkWell(
                                            child: Container(
                                              alignment: Alignment.topCenter,
                                              child: Icon(
                                                !propertyPurposesTypeExpandable[
                                                        index]
                                                    ? Icons.keyboard_arrow_down
                                                    : Icons.keyboard_arrow_up,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                propertyPurposesTypeExpandable[
                                                        index] =
                                                    !propertyPurposesTypeExpandable[
                                                        index];
                                              });
                                            },
                                          )
                                        : new Container(),
                                    Expanded(
                                      child: Theme(
                                        data: ThemeData(
                                          unselectedWidgetColor: colorMain,
                                        ),
                                        child: Checkbox(
                                            checkColor: Colors
                                                .white, // color of tick Mark
                                            activeColor: colorMain,
                                            value:
                                                propertyPurposesCheckBox[index],
                                            onChanged: (bool val) {
                                              setState(() {
                                                propertyPurposesCheckBox[
                                                        index] =
                                                    !propertyPurposesCheckBox[
                                                        index];
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ExpandableContainer(
                            expanded: propertyPurposesTypeExpandable[index],
                            list: widget.store.filterPropertyModel.data
                                .propertyPurposeTypes,
                            index: index,
                            propertyListingParentID:
                                int.tryParse(filterPropertyPurposes[index].id),
                          )
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(child: resetButton()),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: filterButton(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: colorMain,
                    height: 1,
                  )
                ],
              ),
            )
          : Container(
              height: 0,
              width: 0,
            ),
    );
  }
 */
//*************** Home Type Filter ***************//
/*  homeTypeFilter() {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          //   peopertyTypeList(widget.store.filterPropertyModel, true),
          SizedBox(
            height: 10,
          ),
          // homeTypeFilterGridView(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(child: resetButton()),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: filterButton(),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: colorMain,
            height: 1,
          )
        ],
      ),
    );
  }
 */
//*************** Home Type Filter Grid View ***************//
/* homeTypeFilterGridView() {
    List<PropertyChildCategory> _propertyChildCategory = [];
    if (widget.store.homeTypeParentID != "") {
      for (int i = 0;
          i <
              widget
                  .store.filterPropertyModel.data.propertyChildCategory.length;
          i++) {
        if (widget.store.filterPropertyModel.data.propertyChildCategory[i]
                .propertyParentCategoryId ==
            widget.store.homeTypeParentID) {
          _propertyChildCategory.add(
              widget.store.filterPropertyModel.data.propertyChildCategory[i]);
        }
      }
      countGridView = _propertyChildCategory.length;
      widget.store.propertyChildCategoryIsClicked =
          List.generate(countGridView, (_) => false);
    }
    return widget.store.homeTypeParentID.isNotEmpty ||
            widget.store.homeTypeParentID != ""
        ? Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: countGridView.isEven
                  ? countGridView / 2 * 23.0
                  : countGridView / 2 * 27.0,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 8.0,
                children: List.generate(countGridView, (index) {
                  return Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          _propertyChildCategory[index].title,
                          textAlign: TextAlign.center,
                        )),
                        Expanded(
                          child: SizedBox(
                              height: 27,
                              child: CheckBoxForHomeType(
                                index: index,
                                dashBoardMainStore: widget.store,
                              )),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          )
        : Container(
            height: 0,
            width: 0,
          );
  }
 */
