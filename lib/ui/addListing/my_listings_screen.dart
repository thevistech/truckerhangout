import 'package:flutter/material.dart';
import 'package:flutterapp/ui/myleads/lead_screen.dart';
import 'package:flutterapp/utills/TabBar.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/custom_tab_bar.dart';

class MyListingsScreen extends StatefulWidget {
  var currentUserImage;
  MyListingsScreen({this.currentUserImage});
  @override
  _MyListingsScreenState createState() => _MyListingsScreenState();
}

class _MyListingsScreenState extends State<MyListingsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController scrollController;

  bool showFab = true;
  @override
  void initState() {
    scrollController = ScrollController();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 6);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(0.0), // here the desired height
                child: AppBar(
                  elevation: 0.0,
                  backgroundColor: colorMain,
                )),
            body: NestedScrollView(
                controller: scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      actions: actionWidgets(context),
                      pinned: true,
                      forceElevated: innerBoxIsScrolled,
                      floating: true,
                      centerTitle: false,
                      backgroundColor: colorMain,
                      title: Text('My Listings'),
                      leading: InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop("Discard");
                          },
                          child: Icon(Icons.arrow_back)),
                      titleSpacing: 0.0,
                      bottom: TabBar(
                          isScrollable: true,
                          indicatorWeight: 2.0,
                          indicatorColor: Colors.white,
                          controller: _tabController,
                          tabs: [
                            Tab(
                              text: 'Jobs',
                            ),
                            Tab(
                              text: 'Sell & Lease',
                            ),
                            Tab(
                              text: 'MarketPlace',
                            ),
                            Tab(
                              text: 'News & Blogs',
                            ),
                            Tab(
                              text: 'Rating',
                            ),
                            Tab(
                              text: 'Apply Job',
                            ),
                          ]),
                    )
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    LeadsScreen(index: 2,),
                    LeadsScreen(index: 2,),
                    LeadsScreen(index: 2,),
                    LeadsScreen(index: 2,),
                    LeadsScreen(index: 2,),
                    LeadsScreen(index: 2,),
                  ],
                ))));
  }
}
