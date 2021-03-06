import 'package:flutter/material.dart';
import 'package:flutterapp/utills/TabBar.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/custom_tab_bar.dart';

import 'myleads/lead_screen.dart';

class Favourite extends StatefulWidget {
  var currentUserImage;
  Favourite({this.currentUserImage});
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController scrollController;

  bool showFab = true;
  @override
  void initState() {
    scrollController = ScrollController();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 9);
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
                      title: Text('Favourite'),
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
                              text: 'Buy & Lease',
                            ),
                            Tab(
                              text: 'MarketPlace',
                            ),
                            Tab(
                              text: 'ELD/GPS Devices',
                            ),
                            Tab(
                              text: 'Finance/Factoring',
                            ),
                            Tab(
                              text: 'Question/Answer',
                            ),
                            Tab(
                              text: 'CDL Schools',
                            ),
                            Tab(
                              text: 'Insurance',
                            ),
                            Tab(
                              text: 'Company Reviews',
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
                    LeadsScreen(index: 2,),
                    LeadsScreen(index: 2,),
                    LeadsScreen(index: 2,),
                  ],
                ))));
  }
}
