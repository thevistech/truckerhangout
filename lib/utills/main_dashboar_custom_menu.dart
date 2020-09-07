import 'package:flutter/material.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/expansion_list.dart';
import 'package:flutterapp/ui/filters/more_filter.dart';
import 'package:flutterapp/utills/config.dart';

class MainDashBoardCustomMenu extends StatefulWidget {
  final DashBoardMainStore store;
  var userImage;
  MainDashBoardCustomMenu({
    Key key,
    this.userImage,
    this.store,
  }) : super(key: key);

  @override
  _MyCustomMenuState createState() => _MyCustomMenuState();
}

class _MyCustomMenuState extends State<MainDashBoardCustomMenu> {
  var _active = mainDashBoardMenu.none;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        // width: width,
        height: 25,
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (widget.store.filterProperty ==
                      mainDashBoardMenu.listing) {
                    widget.store.filterProperty = mainDashBoardMenu.none;

                    _active = mainDashBoardMenu.none;
                  } else {
                    widget.store.filterProperty = mainDashBoardMenu.listing;

                    _active = mainDashBoardMenu.listing;
                  }

                  setState(() {});
                },
                child: Container(
                  decoration: _active == mainDashBoardMenu.listing
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: colorMain,
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: Colors.white,
                          border: Border.all(width: 1, color: colorMain)),
                  padding: EdgeInsets.all(2.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Listing",
                    style: TextStyle(
                      fontSize: 12,
                      color: _active == mainDashBoardMenu.listing
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (widget.store.filterProperty == mainDashBoardMenu.price) {
                    widget.store.filterProperty = mainDashBoardMenu.none;

                    _active = mainDashBoardMenu.none;
                  } else {
                    widget.store.filterProperty = mainDashBoardMenu.price;

                    _active = mainDashBoardMenu.price;
                  }
                  setState(() {
                    //_active = mainDashBoardMenu.price;
                  });
                },
                child: Container(
                  decoration: _active == mainDashBoardMenu.price
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: colorMain,
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: Colors.white,
                          border: Border.all(width: 1, color: colorMain)),
                  padding: EdgeInsets.all(2.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Price",
                    style: TextStyle(
                      fontSize: 12,
                      color: _active == mainDashBoardMenu.price
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (widget.store.filterProperty ==
                      mainDashBoardMenu.hometype) {
                    widget.store.filterProperty = mainDashBoardMenu.none;

                    _active = mainDashBoardMenu.none;
                  } else {
                    widget.store.filterProperty = mainDashBoardMenu.hometype;

                    _active = mainDashBoardMenu.hometype;
                  }
                  setState(() {
                    //_active = mainDashBoardMenu.hometype;
                  });
                },
                child: Center(
                  child: Container(
                    decoration: _active == mainDashBoardMenu.hometype
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: colorMain,
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.white,
                            border: Border.all(width: 1, color: colorMain)),
                    padding: EdgeInsets.all(2.0),
                    alignment: Alignment.center,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 12,
                          color: _active == mainDashBoardMenu.hometype
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MoreFilter(
                      dashboardStore: widget.store,
                      isOpenFromFilterTab: true,
                      userImage: widget.userImage,
                    );
                  }));
                  //   if (widget.store.filterProperty == mainDashBoardMenu.more) {
                  //    // widget.store.filterProperty = mainDashBoardMenu.none;

                  //  //   _active = mainDashBoardMenu.none;
                  //   } else {
                  //     widget.store.filterProperty = mainDashBoardMenu.more;

                  //     _active = mainDashBoardMenu.more;
                  //   }
                  // setState(() {
                  //   //  _active = mainDashBoardMenu.more;
                  // });
                },
                child: Center(
                  child: Container(
                    decoration: _active == mainDashBoardMenu.more
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: colorMain,
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.white,
                            border: Border.all(width: 1, color: colorMain)),
                    padding: EdgeInsets.all(2.0),
                    alignment: Alignment.center,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "More",
                        style: TextStyle(
                          fontSize: 12,
                          color: _active == mainDashBoardMenu.more
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
