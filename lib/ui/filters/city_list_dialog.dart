import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/filter_property_model.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/config.dart';

class CitySearch extends StatefulWidget {
  final DashBoardMainStore dashboardStore;
  CitySearch({
    this.dashboardStore,
  });
  CitySearchState createState() => CitySearchState();
}

class CitySearchState extends State<CitySearch>
    with SingleTickerProviderStateMixin {
  var preFill;
  AnimationController controller;
  Animation<double> scaleAnimation;
  TextEditingController _textController = TextEditingController();
  List<City> _searchResult = [];
  List<City> _newResult = [];
  List<City> _cityResult = [];
  onItemChanged(String value) {
    _searchResult.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    }
    _newResult.forEach((userDetail) {
      if (userDetail.name.toLowerCase().contains(value.toLowerCase()) ||
          userDetail.provinceTitle
              .toLowerCase()
              .contains(value.toLowerCase())) {
        _searchResult.add(userDetail);
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    preFill = widget.dashboardStore.filterPropertyModel.data;

    _cityResult = widget.dashboardStore.filterPropertyModel.data.cities;
    _cityResult.forEach((cityDetail) {
      if (cityDetail.countryId == widget.dashboardStore.moreFiltercountryID) {
        _newResult.add(cityDetail);
      }
    });
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          margin: EdgeInsets.all(25.0),
          padding: EdgeInsets.all(15.0),
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Search Here...',
                    ),
                    onChanged: onItemChanged,
                  ),
                ),
                Expanded(
                    child: _searchResult.length > 0
                        ? ListView.builder(
                            itemCount: _searchResult.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  widget.dashboardStore.moreFiltercityName =
                                      _searchResult[index].name;
                                  widget.dashboardStore.moreFiltercityID =
                                      _searchResult[index].id;

                                  for (int i = 0;
                                      i < preFill.locations.length;
                                      i++) {
                                    if (widget
                                            .dashboardStore.moreFiltercityID ==
                                        preFill.locations[i].cityId) {
                                      widget.dashboardStore
                                              .moreFilterlocationName =
                                          preFill.locations[i].name;
                                      widget.dashboardStore
                                              .moreFilterlocationID =
                                          preFill.locations[i].id;
                                      break;
                                    }
                                  }
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              "${_searchResult[index].name} - ${_searchResult[index].provinceTitle}",
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: colorDivider,
                                        height: 2,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })
                        : ListView.builder(
                            itemCount: _newResult.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  widget.dashboardStore.moreFiltercityName =
                                      _newResult[index].name;
                                  widget.dashboardStore.moreFiltercityID =
                                      _newResult[index].id;

                                  for (int i = 0;
                                      i < preFill.locations.length;
                                      i++) {
                                    if (widget
                                            .dashboardStore.moreFiltercityID ==
                                        preFill.locations[i].cityId) {
                                      widget.dashboardStore
                                              .moreFilterlocationName =
                                          preFill.locations[i].name;
                                      widget.dashboardStore
                                              .moreFilterlocationID =
                                          preFill.locations[i].id;
                                      break;
                                    }
                                  }
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              "${_newResult[index].name} - ${_newResult[index].provinceTitle}",
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: colorDivider,
                                        height: 2,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
