import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/models/brokers_dashboard.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/notifications/notifications.dart';
import 'package:flutterapp/ui/smart_search/search_job_screen.dart';
import 'package:flutterapp/ui/smart_search/search_eldgps_screen.dart';
import 'package:flutterapp/ui/smart_search/search_buy_lease_screen.dart';
import 'package:flutterapp/ui/smart_search/types_list_screen.dart';
import 'package:flutterapp/ui/profiles/user_profile.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/main_dashboar_custom_menu.dart';
import '../shimmer/filterListView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCustomAppBarRight extends StatefulWidget
    implements PreferredSizeWidget {
  final double height;
  final DashBoardMainStore store;
  MyCustomAppBarRight({this.height, this.store});
  @override
  State<StatefulWidget> createState() {
    return new _MyCustomAppBarRight();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _MyCustomAppBarRight extends State<MyCustomAppBarRight> {
  List<Datum> brokerslist = [];
  var imgUrl = "";
  var imageClipSize = 25.0;
  var userid;
  @override
  void initState() {
    super.initState();
    Config.getUserProfilePicture().then((value) => imgUrl = value);
    Config.getUserID().then((value) => userid = value);
    print('login userid $userid');
  }

  @override
  Widget build(BuildContext context) {
    imageClipSize = 28.0;
    return Container(
      child: Observer(
        builder: (_) => Container(
          height: widget.store.preferredSize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Container(
                  color: Colors.white,
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.menu,
                          color: Colors.black87,),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                    widget.store.isSearchBarVisible
                        ? Expanded(
                            flex: 4,
                            child: showSearchBar(
                                widget.store.titleHeadingForAppBar))
                        : Expanded(
                            flex: 4,
                            child: Container(
                              child: Text(
                                "${widget.store.titleHeadingForAppBar}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )),
                    widget.store.isMapAndListIconVisible
                        ? Expanded(
                            child: InkWell(
                              onTap: () {
                                widget.store.setValue();
                              },
                              child: SvgPicture.asset(
                                !widget.store.isMapVisible
                                    ? "assets/icon_map_click.svg"
                                    : "assets/icon_list_view.svg",
                                height: 30,
                                color: Colors.black45,
                              ),
                            ),
                          )
                        : Expanded(child: Container()),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NotificationsUI();
                          }));
                        },
                        child: SvgPicture.asset(
                          "assets/icon_notification.svg",
                          allowDrawingOutsideViewBox: true,
                          height: 30,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return Chat();
                              }));
                        },
                        child: SvgPicture.asset(
                          "assets/message.svg",
                          allowDrawingOutsideViewBox: true,
                          height: 30,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          if (userid == null) return;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return UserProfile(
                              id: userid,
                              loginUserId: userid,
                            );
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 10.0),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                height: 34,
                                width: 34,
                                imageUrl: "$imgUrl",
                              ),
                            ),
                          ), /*  ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: imgUrl,
                                  width: 8,
                                  height: 30,
                                  placeholder: (context, url) => Container(
                                        width: 8,
                                        height: 30,
                                        child: new CircularProgressIndicator(
                                          backgroundColor: colorMain,
                                        ),
                                      ),
                                  errorWidget: (context, url, error) =>
                                      SvgPicture.asset(
                                        defaultUserImage,
                                        color: Colors.white,
                                        width: 8,
                                        height: 30,
                                      ))), */
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Divider(
                color: colorDivider,
                height: 2,
              ),

            ],
          ),
        ),
      ),
    );
  }

  showSearchBar(title) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SmartSearchCategory(
                  currentUserImage: imgUrl,
                );
              }));
              },
            child: Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              height: 28,
              decoration: BoxDecoration(
                border: Border.all(width: 1,
                  color: Colors.black45,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.all(
                   Radius.circular(32),
                ),
              ),
              child: Row(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: Text("Search",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12,color: Colors.black45),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  searchTitle(title) {
    switch (title) {
      case PROPERTIES:
        return "Search Property";
        break;
      case PROJECTS:
        return "Search Projects";
        break;
      case JOBS:
        return "Search Jobs";
        break;
    }
  }

//  searchRoutes(title) {
//    switch (title) {
//      case PROPERTIES:
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => SearchPropertyScreen(
//              userImage: imgUrl,
//            ),
//          ),
//        );
//        break;
//      case PROJECTS:
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => SearchProjectsScreen(
//              userImage: imgUrl,
//            ),
//          ),
//        );
//        break;
//      case JOBS:
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => SearchJobsScreen(
//              userImage: imgUrl,
//            ),
//          ),
//        );
//        break;
//    }
//  }
}
