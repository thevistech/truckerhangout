import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/smart_search/search_cdl_schools_screen.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/ui/smart_search/search_marketplace_screen.dart';
import 'package:flutterapp/ui/brokers/brokers_map.dart';

class appBarWithSearch extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  String imageUrl;
  bool isBrokerScreen;
  DashBoardMainStore store;
  appBarWithSearch(
      {this.height, this.imageUrl, @required this.isBrokerScreen, this.store});

  @override
  State<StatefulWidget> createState() {
    return new _appBarWithSearch();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _appBarWithSearch extends State<appBarWithSearch> {
  var imgUrl = "";
  var imageClipSize = 25.0;
  var loggedinUserId;

  @override
  void initState() {
    getloggedinuserid();
    Config.getUserProfilePicture().then((value) => imgUrl = value);

    super.initState();
  }

  getloggedinuserid() async {
    loggedinUserId = await Config.getUserID();
    print('login user id ::$loggedinUserId');
  }

  @override
  Widget build(BuildContext context) {
    imageClipSize = 28.0;
    return Container(
      color: colorMain,
      child: Observer(
        builder: (_) => Container(
          height: widget.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Container(
                  color: colorMain,
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Expanded(flex: 5, child: Container()),
                    InkWell(
                      onTap: () {
                        widget.store.isbrokerMapVisible =
                            !widget.store.isbrokerMapVisible;
//                        Navigator.push(context,
//                            MaterialPageRoute(builder: (context) {
//                              return BrokersGoogleMap();
//                            }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: SvgPicture.asset(
                          !widget.store.isbrokerMapVisible
                              ? "assets/icon_map_click.svg"
                              : "assets/icon_list_view.svg",
                          allowDrawingOutsideViewBox: true,
                          height: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Chat();
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: SvgPicture.asset(
                          "assets/message.svg",
                          allowDrawingOutsideViewBox: true,
                          height: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.transparent,
                      // radius: 45.0,
                      child: ClipOval(
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            height: 34,
                            width: 34,
                            imageUrl: "${widget.imageUrl}"),
                      ),
                    ),
                  ]),
                ),
              ),
              Divider(
                color: Colors.white,
                height: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
/*
  showSearchBar() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 28,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              color: colorMain,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.zero,
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.zero,
              ),
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: () {
              widget.isBrokerScreen
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchBrokersScreen(
                          userImage: widget.imageUrl,
                        ),
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchDeveloperScreen(
                          userImage: widget.imageUrl,
                        ),
                      ),
                    );
            },
            child: Container(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              height: 28,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Text(
                widget.isBrokerScreen ? "Seach Brokers" : "Search Developers",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }*/
}
