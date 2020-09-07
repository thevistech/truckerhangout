import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/models/filter_property_model.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';
import '../../shimmer/locationGridView.dart';
import 'location_full_screen.dart';

class LocationWidget extends StatefulWidget {
  final DashBoardMainStore dashboardStore;
  var currentUserImage;
  LocationWidget({this.dashboardStore, this.currentUserImage});
  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  var store;
  List<Area> areasList = [];
  bool isCityIDNull = true;
  List<Color> scream = [
    Color(0x33000000),
    Color(0x33000000),
  ];
  @override
  void initState() {
    if (widget.dashboardStore.moreFiltercityID != null) {
      for (int i = 0;
          i < widget.dashboardStore.filterPropertyModel.data.locations.length;
          i++) {
        if (widget
                .dashboardStore.filterPropertyModel.data.locations[i].cityId ==
            widget.dashboardStore.moreFiltercityID) {
          var cityID = widget
              .dashboardStore.filterPropertyModel.data.locations[i].cityId;
          var areaName = widget
              .dashboardStore.filterPropertyModel.data.locations[i].areaName;
          var areaID = widget
              .dashboardStore.filterPropertyModel.data.locations[i].areaId;
          Area area = new Area(cityId: cityID, name: areaName, id: areaID);
          areasList.add(area);
        }
      }
      isCityIDNull = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) => dashboardSliderWidget());
  }

  dashboardSliderWidget() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Areas",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black, letterSpacing: 1.0),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LocationFullScreenWidget(
                        dashboardStore: widget.dashboardStore,
                        currentUserImage: widget.currentUserImage,
                      );
                    }));
                  },
                  child: Text(
                    "See All",
                    textAlign: TextAlign.end,
                    style: TextStyle(color: colorMain),
                  ),
                )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          widget.dashboardStore.filterPropertyModel != null
              ? Container(
                  margin: EdgeInsets.only(top: 0, bottom: 10),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: new NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    children: List.generate(6, (index) {
                      return makeLocationGrid(index);
                    }),
                  ),
                )
              : shimmerLocation(),
        ],
      ),
    );
  }

  makeLocationGrid(index) {
    var baseurl = widget.dashboardStore.filterPropertyModel.url;

    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(right: 2, left: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            image: DecorationImage(
                image: NetworkImage(
                  baseurl +
                      '${widget.dashboardStore.filterPropertyModel.data.areas[index].image}',
                ),
                fit: BoxFit.cover),
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter,
                    colors: [
                      Colors.black.withOpacity(.5),
                      Colors.black.withOpacity(.2),
                    ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                    "${widget.dashboardStore.filterPropertyModel.data.areas[index].name}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Signika-Regular',
                    ))
              ],
            ),
          ),
        ),

//        Container(
//          child: Stack(
//            children: <Widget>[
//              Opacity(
//                opacity: 0.9,
//                child: ClipRRect(
//                  borderRadius: BorderRadius.circular(10.0),
//                  child: Image.network(
//                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTDYBWl8gDmaKMgW76MdlPX0JYl6fmIRCausw&usqp=CAU",
//                    fit: BoxFit.fill,
//                    height: 1000,
//                    width: 1000,
//                  ),
//                ),
//              ),
//              Center(
//                  child: Container(
//                margin: EdgeInsets.symmetric(horizontal: 2.0),
//                child: Text(
//                  isCityIDNull
//                      ? "${widget.dashboardStore.filterPropertyModel.data.areas[index].name}"
//                      : "${areasList[index].name}",
//                  textAlign: TextAlign.center,
//                  maxLines: 2,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontWeight: FontWeight.bold,
//                      letterSpacing: 1.0),
//                ),
//              )),
//            ],
//          ),
//        ),
      ),
    );
  }
}
