import 'package:flutter/material.dart';
import 'package:flutterapp/ui/brokers/brokers_map.dart';
import 'package:flutterapp/ui/smart_search/search_broker_screen.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import '../components/start_rating_widget.dart';
import '../../shimmer/simpleListView.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../utills/app_bar_for_drawer_with_search.dart';
import '../googleMapClustering/googleMap.dart';

class FindBrokers extends StatefulWidget {
  final DashBoardMainStore dashBoardMainStore;
  var currentUserImage;
  FindBrokers({this.dashBoardMainStore, Key key, this.currentUserImage})
      : super(key: key);
  @override
  _FindBrokersState createState() => _FindBrokersState();
}

class _FindBrokersState extends State<FindBrokers> {
  @override
  void initState() {
    widget.dashBoardMainStore.isbrokerMapVisible = false;
    if (!widget.dashBoardMainStore.isBrokerListLoaded)
      widget.dashBoardMainStore.getBrokers(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithSearch(
          height: 90,
          imageUrl: widget.currentUserImage,
          isBrokerScreen: true,
          store: widget.dashBoardMainStore),
      body: Container(
        child: Stack(
          children: <Widget>[
            backgroundNotification(),
            Observer(
                builder: (_) => widget.dashBoardMainStore.isBrokerListLoaded
                    ? visibilityListAndMapPage(
                        widget.dashBoardMainStore.isbrokerMapVisible)
                    : shimmerSimpleListView(context)),
          ],
        ),
      ),
    );
  }

  visibilityListAndMapPage(isVisible) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: IndexedStack(
          index: !isVisible ? 0 : 1,
          children: <Widget>[
            brokersList(),
            BrokersGoogleMap(
              dashBoardMainStore: widget.dashBoardMainStore,
              // items: widget.dashBoardMainStore.items,
            )

            //  flipWidgetGoogleMapView(),
          ],
        )),
      ],
    );
  }

  brokersList() {
    return widget.dashBoardMainStore.isBrokerListLoaded
        ? Positioned.fill(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount:
                    widget.dashBoardMainStore.brokersList.data.data.length,
                itemBuilder: (ctx, index) {
                  var profileImage =
                      "${widget.dashBoardMainStore.brokersList.url}${widget.dashBoardMainStore.brokersList.data.data[index].picture}";
                  var brokerName =
                      "${widget.dashBoardMainStore.brokersList.data.data[index].title}";
                  var companyName =
                      "${widget.dashBoardMainStore.brokersList.data.data[index].companyName}";
                  var companyRating = int.tryParse(
                      "${widget.dashBoardMainStore.brokersList.data.data[index].companyRating}");
                  return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(profileImage),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10.0)),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        brokerName,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            companyName,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 13.0),
                                          ),
                                          Spacer(),
                                          Container(
                                            child: IconTheme(
                                              data: IconThemeData(
                                                color: Colors.amber,
                                                size: 15,
                                              ),
                                              child: StarDisplay(
                                                  value: companyRating),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Divider(
                            color: colorDivider,
                            height: 2,
                          )
                        ],
                      ));
                }),
          )
        : shimmerSimpleListView(context);
  }

  backgroundNotification() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          "assets/building.png",
        ),
      ),
    );
  }
}
