import 'package:flutter/material.dart';
import 'package:flutterapp/ui/Reviews.dart';
import 'package:flutterapp/ui/past_dealings.dart';
import 'package:flutterapp/utills/SearchBar.dart';
import 'package:flutterapp/utills/app_bar_two.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/custom_tab_bar.dart';

class TabBarTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBarTwo(height: 70),
        body: new DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text('ABCD'),
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                  child: TabBar(
                    indicator: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(color: ratingColor, width: 3.0),
                    )),
                    isScrollable: true,
                    // indicatorPadding: EdgeInsets.all(10),
                    indicatorColor: colorMain,
                    labelColor: Colors.grey,
                    // indicatorSize: TabBarIndicatorSize.label,
                    tabs: <Widget>[
                      new Tab(
                        text: "LISTING",
                      ),
                      new Tab(
                        text: "PAST DEALING",
                      ),
                      new Tab(
                        text: "REVIEWS",
                      ),
                    ],
                  ),
                  preferredSize: Size.fromHeight(-5)),
            ),
            body: TabBarView(
              children: <Widget>[
                new Container(
                    //  color: Colors.deepOrangeAccent,
                    child: PastDealings()),
                new Container(
                    child: PastDealings()),
                new Container(
                    child: Reviews()),
              ],
            ),
          ),
        ));
  }
}
