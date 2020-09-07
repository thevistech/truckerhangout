/* import 'package:flutter/material.dart';
import 'package:flutterapp/ui/SignInOrSignUp.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/chats/chat_view_single.dart';
import 'package:flutterapp/ui/dashboard_main.dart';
import 'package:flutterapp/ui/drawer_menu_class.dart';
import 'package:flutterapp/ui/favourite.dart';
import 'package:flutterapp/ui/maps.dart';
import 'package:flutterapp/ui/news_and_info.dart';
import 'package:flutterapp/ui/notifications.dart';
import 'package:flutterapp/ui/proejcts.dart';
import 'package:flutterapp/utills/SearchBar.dart';
import 'package:flutterapp/utills/TabBar.dart';
import 'package:flutterapp/utills/config.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dasboard extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Find Broker", Icons.youtube_searched_for),
    new DrawerItem("Find Property", Icons.search),
    new DrawerItem("Invite Broker", Icons.forward),
    new DrawerItem("Projects", Icons.home),
    new DrawerItem("Favorite", Icons.favorite),
    new DrawerItem("Blogs", Icons.library_books),
    new DrawerItem("Maps", Icons.location_on),
    new DrawerItem("Settings", Icons.settings),
    new DrawerItem("Sign Out", Icons.exit_to_app),
  ];

  @override
  State<StatefulWidget> createState() {
    return new _DasboardState();
  }
}

class _DasboardState extends State<Dasboard> {
  PageController _myPage = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  int _selectedDrawerIndex = 0;
  var userName = "";
  var userEmail = "";

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    Config.getUserName().then((value) {
      setState(() {
        userName = value;
      });
    });
    Config.getUserEmail().then((value) {
      setState(() {
        userEmail = value;
      });
    });
  }

  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
    });
  }

  //Let's use a switch statement to return the Fragment for a selected item
  _getDrawerFragment(int pos) {
    switch (pos) {
      case 0:
        return new DashboardHome();
      case 1:
        return new Projects();
      case 2:
        return new Chat();
      case 3:
        return new Projects();
      case 4:
        return new Favourite();
      case 5:
        return new NewsAndInformation();
      case 6:
        return new Maps();
      case 7:
        return new Maps();
      case 8:
        Config.clearSharePreference();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignInOrSignUp()),
            (Route<dynamic> route) => false,
          );
        });
        return;
//      default:
//        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    //we close the drawer
    Navigator.of(context).pop();
  }

  _onSelectItemFromBottomBar(int index) {
    setState(() => _selectedDrawerIndex = index);
    //we close the drawer
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        Column(
          children: <Widget>[
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              dense: true,
              // contentPadding: EdgeInsets.all(0.0),
              title: Text(
                '${d.title}',
              ),
              selected: i == _selectedDrawerIndex,
              leading: new Icon(d.iconData),
//              leading: SvgPicture.asset(
//                '${d.icon}',
//                allowDrawingOutsideViewBox: true,
//                height: 20,
//                width: 20,
//                color: colorMain,
//              ),
              onTap: () {
                _onSelectItem(i);
              },
            ),
            Divider(
              height: 1,
            ),
          ],
        ),
      );
    }
    return Scaffold(
        key: _scaffoldKey,
        appBar: MyCustomAppBar(height: 70),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorMain,
          onPressed: () {},
          tooltip: "Centre FAB",
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Icon(Icons.add),
          ),
          elevation: 4.0,
        ),
        bottomNavigationBar: bottomNavigationBar(),
        drawer: Drawer(
            child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: DrawerHeader(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 45.0,
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                          backgroundColor: Colors.transparent,
                        ),
                        Padding(padding: EdgeInsets.all(5.0)),
                        Text(
                          "$userName",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.all(2.0)),
                        Text("$userEmail",
                            style: TextStyle(color: Colors.white)),
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
        body: _getDrawerFragment(_selectedDrawerIndex));
  }

  bottomNavigationBar() {
    return BottomAppBar(
      child: Container(
        margin: EdgeInsets.only(left: 12.0, right: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              //update the bottom app bar view each time an item is clicked
              onPressed: () {
                updateTabSelection(0, "Home");
                _onSelectItemFromBottomBar(2);
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.home,
                //darken the icon if it is selected or else give it a different color
                color: selectedIndex == 0 ? Colors.pink : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                updateTabSelection(1, "News");

                _onSelectItemFromBottomBar(3);
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.library_books,
                color: selectedIndex == 1 ? Colors.pink : Colors.black,
              ),
            ),
            //to leave space in between the bottom app bar items and below the FAB
            SizedBox(
              width: 50.0,
            ),
            IconButton(
              onPressed: () {
                updateTabSelection(2, "Notifications");
                _onSelectItemFromBottomBar(4);
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.notifications,
                color: selectedIndex == 2 ? Colors.pink : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                updateTabSelection(2, "Notifications");
                _onSelectItemFromBottomBar(5);
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.equalizer,
                color: selectedIndex == 3 ? Colors.pink : Colors.black,
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
}
 */