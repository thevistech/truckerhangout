import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/models/brokers_dashboard.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/stores/job_store.dart';
import 'package:flutterapp/ui/SignIn.dart';
import 'package:flutterapp/ui/aboutus/about_us_main.dart';
import 'package:flutterapp/ui/addListing/create_projects.dart';
import 'package:flutterapp/ui/addListing/my_listings_screen.dart';
import 'package:flutterapp/ui/addListing/post_job_screen.dart';
import 'package:flutterapp/ui/advertisements/create_advertisement_screen.dart';
import 'package:flutterapp/ui/auction/auction_screen.dart';
import 'package:flutterapp/ui/brokers/find_brokers.dart';
import 'package:flutterapp/ui/components/contact_us_form.dart';
import 'package:flutterapp/ui/drawer_menu_class.dart';
import 'package:flutterapp/ui/estates/estate_screen.dart';
import 'package:flutterapp/ui/events/event_home_page.dart';
import 'package:flutterapp/ui/favourite.dart';
import 'package:flutterapp/ui/invite/invite_screen.dart';
import 'package:flutterapp/ui/pricing/pricing_screen.dart';
import 'package:flutterapp/ui/settings_screen.dart';
import 'package:flutterapp/ui/smart_search/types_list_screen.dart';
import 'package:flutterapp/ui/proejcts.dart';
import 'package:flutterapp/ui/addListing/voice_property.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/search_bar_right.dart';
import '../stores/notification_store.dart';
import '../stores/projects_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'drawer_developer_list.dart';
import 'jobs.dart';
import 'dash_board_home.dart';
import 'maps.dart';
import 'mybusiness/my_business_screen.dart';
import 'myleads/my_leads_main_screen.dart';
import 'newsInfo/news_and_info.dart';
import 'notifications/notifications.dart';

class CardDasboard extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Search", "assets/ic_drawer_search.svg"),
    new DrawerItem("My Listings", "assets/ic_drawer_my_listing.svg"),
    new DrawerItem("My Business", "assets/ic_drawer_my_business.svg"),
    new DrawerItem("My Leads", "assets/ic_drawer_my_leads.svg"),
    new DrawerItem("My Favorites", "assets/ic_drawer_favroute.svg"),
    new DrawerItem("News & Blogs", "assets/ic_drawer_news_and_blogs.svg"),
    new DrawerItem("Invite", "assets/ic_drawer_invite.svg"),
    new DrawerItem("Advertisement", "assets/ic_drawer_advertisement.svg"),
    new DrawerItem("Events", "assets/ic_drawer_events.svg"),
    new DrawerItem("Pricing", "assets/price.svg"),
    new DrawerItem("About Us", "assets/aboutus.svg"),
    new DrawerItem("Contact Us", "assets/contactus.svg"),
    new DrawerItem("Settings", "assets/ic_drawer_setting.svg"),
    new DrawerItem("Sign Out", "assets/ic_drawer_sign_out.svg"),
  ];
  @override
  State<StatefulWidget> createState() {
    return new _CardsDasboardState();
  }
}

class _CardsDasboardState extends State<CardDasboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final dashBoardMainStore = DashBoardMainStore();
  final jobBoardStore = JobsStore();
  final notificationStore = NotificationStore();
  final projectStore = ProjectStore();

  int selectedIndex = 0;
  int _selectedDrawerIndex = 0;
  int _index = 0;
  Brokers brokers;
  var name = '';
  var email = '';
  double _lastFeedScrollOffset = 0;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    Config.getUserName().then((userName) {
      print("$userName");
      setState(() {
        name = userName;
      });
    });
    Config.getUserCompanyName().then((value) {
      if (value.toLowerCase().contains("general")) {
        Config.getUserEmail().then((value) {
          setState(() {
            email = value;
          });
        });
      } else
        setState(() {
          email = value;
        });
    });

    Config.getUserProfilePicture().then((value) {
      setState(() {
        imgUrl = value;
      });
    });
  }

  @override
  void dispose() {
    _disposeScrollController();
    super.dispose();
  }

  void _disposeScrollController() {
    if (_scrollController != null) {
      _lastFeedScrollOffset = _scrollController.offset;
      _scrollController.dispose();
      _scrollController = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 1.5;
    var drawerOptions = <Widget>[];
    drawerOptions.add(verifyStatus());
    drawerOptions.add(
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Divider(
          height: 1,
        ),
      ),
    );
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        Column(
          children: <Widget>[
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              dense: true,
              title: Text(
                '${d.title}',
                style:
                    TextStyle(color: i != _index ? Colors.black : Colors.black,fontSize: 12),
              ),
              selected: i == _index,
              leading: SvgPicture.asset(
                d.iconData,
              ),
              onTap: () {
                Navigator.of(context).pop();
                openDrwawerMenuScreens(i);
              },
            ),
            Divider(
              height: 1,
            ),
          ],
        ),
      );
    }
    drawerOptions.add(SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          bottomBarTextCopyright(color: colorGrey),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ));

    return Scaffold(
      appBar: MyCustomAppBarRight(height: 60, store: dashBoardMainStore),
      body: _bottomTabFragments(_selectedDrawerIndex),
      drawer: Drawer(
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: ListTile.divideTiles(
          color: Colors.white,
          context: context,
          tiles: [
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              child: DrawerHeader(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(2.0)),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(80.0),
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              width: 85,
                              height: 85,
                              imageUrl: imgUrl,
                              placeholder: (context, url) => Container(
                                    height: 85,
                                    width: 85,
                                    child: new CircularProgressIndicator(
                                      backgroundColor: colorMain,
                                    ),
                                  ),
                              errorWidget: (context, url, error) =>
                                  SvgPicture.asset(
                                    defaultUserImage,
                                    color: Colors.white,
                                    height: 85,
                                    width: 85,
                                  ))),
                      Padding(padding: EdgeInsets.all(5.0)),
                      Text(
                        "$name",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.all(2.0)),
                      Text("$email", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: colorMain,
                ),
              ),
            ),
            new Column(children: drawerOptions)
          ],
        ).toList(),
      )),
    );
  }



  _bottomTabFragments(int pos) {
    switch (pos) {
      case 0:
        //********************  BOTTOM TAB BAR HOME ********************//
        _scrollController =
            ScrollController(initialScrollOffset: _lastFeedScrollOffset);
        dashBoardMainStore.titleHeadingForAppBar = PROPERTIES;
        dashBoardMainStore.preferredSize = BigAppBar;
        dashBoardMainStore.isFilterVisible = true;
        dashBoardMainStore.isChatVisible = true;
        dashBoardMainStore.isMapAndListIconVisible = true;
        dashBoardMainStore.isSearchBarVisible = true;
        dashBoardMainStore.filterProperty = mainDashBoardMenu.none;
        return new DasboardHomeMain(
          store: dashBoardMainStore,
          scrollController: _scrollController,
          currentUserImage: imgUrl,
        );
      case 1:
        dashBoardMainStore.titleHeadingForAppBar = PROJECTS;
        dashBoardMainStore.preferredSize = smallAppBar;
        dashBoardMainStore.isFilterVisible = false;
        dashBoardMainStore.isChatVisible = true;
        dashBoardMainStore.isMapAndListIconVisible = true;
        dashBoardMainStore.isSearchBarVisible = true;
        dashBoardMainStore.filterProperty = mainDashBoardMenu.none;
        return new Projects(
          projectStore: projectStore,
          dashBoardMainStore: dashBoardMainStore,
          currentUserImage: imgUrl,
        );

      case 2:
        //********************  BOTTOM TAB BAR NOTIFICATION ********************//
        dashBoardMainStore.titleHeadingForAppBar = NOTIFICATIONS;
        dashBoardMainStore.preferredSize = smallAppBar;
        dashBoardMainStore.isFilterVisible = false;
        dashBoardMainStore.isChatVisible = true;
        dashBoardMainStore.isMapAndListIconVisible = false;
        dashBoardMainStore.isSearchBarVisible = false;
        dashBoardMainStore.filterProperty = mainDashBoardMenu.none;
        dashBoardMainStore.homeTypeParentID = '';
        return new NotificationsUI(
         // notificationStore: notificationStore,
        );

      case 3:
        //********************  BOTTOM TAB BAR JOBS ********************//
        dashBoardMainStore.titleHeadingForAppBar = JOBS;
        dashBoardMainStore.preferredSize = smallAppBar;
        dashBoardMainStore.isFilterVisible = false;
        dashBoardMainStore.isChatVisible = true;
        dashBoardMainStore.isMapAndListIconVisible = true;
        dashBoardMainStore.isSearchBarVisible = true;
        dashBoardMainStore.filterProperty = mainDashBoardMenu.none;
        dashBoardMainStore.homeTypeParentID = '';
        return new JobsUI(
          dashBoardMainStore: dashBoardMainStore,
          jobsStore: jobBoardStore,
          currentUserImage: imgUrl,
        );
    }
  }


  floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
//          Navigator.push(context, MaterialPageRoute(builder: (context) {
//            return VoiceProperty(
//              dashboardStore: dashBoardMainStore,
//              userImage: imgUrl,
//            );
//          }));
      },
      tooltip: "Centre FAB",
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: SvgPicture.asset("assets/add_line.svg",
          color: Colors.black,
          height: 25,
        ),
      ),
      elevation: 4.0,
    );
  }

  //call this method on click of each bottom app bar item to update the screen
  bottomNavigationBar() {
    return BottomAppBar(
      child: Container(
        margin: EdgeInsets.only(left: 12.0, right: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  updateTabSelection(0, "Home");
                  _onSelectItemFromBottomBar(0);
                },
                child: SvgPicture.asset(
                  selectedIndex == 0
                      ? "assets/icon_home_click.svg"
                      : "assets/icon_home.svg",
                  height: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  updateTabSelection(1, "Projects");
                 _onSelectItemFromBottomBar(1);
                },
                child: SvgPicture.asset(
                  selectedIndex == 1
                      ? "assets/truk_line.svg"
                      : "assets/truk_line.svg",
                  height: 25,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  updateTabSelection(2, "Notifications");
                  _onSelectItemFromBottomBar(2);
                },
                child: SvgPicture.asset(
                  selectedIndex == 2
                      ? "assets/icon_notification_click.svg"
                      : "assets/icon_notification.svg",
                  height: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  updateTabSelection(3, "Jobs");
                  _onSelectItemFromBottomBar(3);
                },
                child: SvgPicture.asset(
                  selectedIndex == 3
                      ? "assets/icon_jobs_click.svg"
                      : "assets/icon_jobs.svg",
                  height: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      //to add a space between the FAB and BottomAppBar
      shape: CircularNotchedRectangle(),
      //color of the BottomAppBar
      color: Colors.white,
    );
  }

  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
    });
  }

  _onSelectItemFromBottomBar(int index) {
    setState(() => _selectedDrawerIndex = index);
  }

  void openDrwawerMenuScreens(int i) {
    switch (i) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SmartSearchCategory(
            currentUserImage: imgUrl,
          );
        }));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MyListingsScreen(
            currentUserImage: imgUrl,
          );
        }));

        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MyBusinessScreen(currentUserImage: imgUrl);
        }));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MyLeadsScreen(
            currentUserImage: imgUrl,
            dashBoardMainStore: dashBoardMainStore,
          );
        }));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Favourite(
            currentUserImage: imgUrl,
          );
        }));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NewsAndInformation(
            currentUserImage: imgUrl,
          );
        }));

        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return InviteScreen(userImage: imgUrl);
        }));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CreateAdvertisementScreen();
        }));
        break;

      case 8:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EventHomeScreen(
              // userImage: imgUrl,
              );
        }));
        break;

      //pricing
      case 9:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PricingScreen(userImage: imgUrl);
        }));
        break;
      //about us
      case 10:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AboutUsScreen();
        }));
        break;
      //contact us
      case 11:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ContactUsForm();
        }));
        break;
      case 12:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChangeSettingsScreen(
            userImage: imgUrl,
          );
        }));
        break;
      case 13:
        Config.clearSharePreference();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
            (Route<dynamic> route) => false,
          );
        });
        break;
    }
  }

  searchPropertyByID(width) {
    return SizedBox(
      height: height40,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Observer(
          builder: (_) => TextFormField(
            style: TextStyle(fontSize: 12),
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              // errorText: store.error.email,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0)),
              hintText: 'Search Property By ID',
              hintStyle: TextStyle(fontSize: 12),
              suffixIcon: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorMain,
                    shape: BoxShape.rectangle,
                  ),
                  child: Icon(
                    Icons.search,
                    size: suffixIconSize,
                    color: Colors.white,
                  ),
                ),
              ),
              contentPadding: EdgeInsets.all(5),
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  verifyStatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Observer(
        builder: (context) => dashBoardMainStore.isFilterListLoaded
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Column(
                    children: <Widget>[
                      SvgPicture.asset(
                        dashBoardMainStore.filterPropertyModel.data.user
                                    .accountStatus ==
                                "Non-Verified"
                            ? "assets/ic_drawer_non_verify_fill.svg"
                            : "assets/ic_drawer_non_verify_line.svg",
                        color: dashBoardMainStore.filterPropertyModel.data.user
                                    .accountStatus ==
                                "Non-Verified"
                            ? colorMain
                            : Colors.black,
                        height: 40,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Non-Verified",
                        style: TextStyle(fontSize: 12.0),
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 1,
                          color: lightTxtColor,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SvgPicture.asset(
                        dashBoardMainStore.filterPropertyModel.data.user
                                    .accountStatus ==
                                "Semi-Verified"
                            ? "assets/ic_drawer_semi_verify_fill.svg"
                            : "assets/ic_drawer_semi_verify_line.svg",
                        color: dashBoardMainStore.filterPropertyModel.data.user
                                    .accountStatus ==
                                "Semi-Verified"
                            ? colorMain
                            : Colors.black,
                        height: 40,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Semi-Verified",
                        style: TextStyle(fontSize: 12.0),
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 1,
                          color: lightTxtColor,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: <Widget>[
                      SvgPicture.asset(
                        dashBoardMainStore.filterPropertyModel.data.user
                                    .accountStatus ==
                                "Verified"
                            ? "assets/ic_drawer_verify_fill.svg"
                            : "assets/ic_drawer_verify_line.svg",
                        color: dashBoardMainStore.filterPropertyModel.data.user
                                    .accountStatus ==
                                "Verified"
                            ? colorMain
                            : Colors.black,
                        height: 40,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Verified",
                        style: TextStyle(fontSize: 12.0),
                      )
                    ],
                  ),
                  Spacer(),
                ],
              )
            : Container(),
      ),
    );
  }
}
