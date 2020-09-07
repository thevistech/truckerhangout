import 'package:flutter/material.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/TabBar.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/custom_tab_bar.dart';

import 'lead_screen.dart';

class MyLeadsScreen extends StatefulWidget {
  var currentUserImage;
  DashBoardMainStore dashBoardMainStore;
  MyLeadsScreen({this.currentUserImage,this.dashBoardMainStore});
  @override
  _MyLeadsScreenState createState() => _MyLeadsScreenState();
}

class _MyLeadsScreenState extends State<MyLeadsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController scrollController;

  bool showFab = true;
  @override
  void initState() {
    scrollController = ScrollController();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 3);
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
                      title: Text('My Leads'),
                      leading: InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop("Discard");
                          },
                          child: Icon(Icons.arrow_back)),
                      titleSpacing: 0.0,
                      bottom: TabBar(
                          isScrollable: false,
                          indicatorWeight: 2.0,
                          indicatorColor: Colors.white,
                          controller: _tabController,
                          tabs: [
                            Tab(
                              text: 'Lead',
                            ),
                            Tab(
                              text: 'Contact',
                            ),
                            Tab(
                              text: 'Applicant',
                            ),

                          ]),
                    )
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    LeadsScreen(index: 1,dashBoardMainStore:widget.dashBoardMainStore),
                    LeadsScreen(index: 2,dashBoardMainStore:widget.dashBoardMainStore),
                    LeadsScreen(index: 3,dashBoardMainStore:widget.dashBoardMainStore),
                  ],
                ))));
  }
}
