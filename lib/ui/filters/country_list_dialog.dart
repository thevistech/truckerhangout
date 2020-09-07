import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/filter_property_model.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/config.dart';

class CountrySearch extends StatefulWidget {
  final DashBoardMainStore dashboardStore;
  CountrySearch({this.dashboardStore});
  CountrySearchState createState() => CountrySearchState();
}

class CountrySearchState extends State<CountrySearch>
    with SingleTickerProviderStateMixin {
  var preFill;
  AnimationController controller;
  Animation<double> scaleAnimation;
  TextEditingController _textController = TextEditingController();
  List<Country> _searchResult = [];
  List<Country> _newResult = [];
  onItemChanged(String value) {
    _searchResult.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    }
    _newResult.forEach((userDetail) {
      if (userDetail.name.toLowerCase().contains(value.toLowerCase())) {
        _searchResult.add(userDetail);
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newResult = widget.dashboardStore.filterPropertyModel.data.countries;
    preFill = widget.dashboardStore.filterPropertyModel.data;
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
                                  widget.dashboardStore.moreFiltercountryName =
                                      _searchResult[index].twoLetterCode;
                                  widget.dashboardStore.moreFiltercountryID =
                                      _searchResult[index].id;
                                  for (int i = 0;
                                      i < preFill.cities.length;
                                      i++) {
                                    if (widget.dashboardStore
                                            .moreFiltercountryID ==
                                        preFill.cities[i].countryId) {
                                      widget.dashboardStore.moreFiltercityName =
                                          preFill.cities[i].name;
                                      widget.dashboardStore.moreFiltercityID =
                                          preFill.cities[i].id;
                                      break;
                                    }
                                  }
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
                                              "${_searchResult[index].name} - ${_searchResult[index].twoLetterCode}",
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
                                  widget.dashboardStore.moreFiltercountryName =
                                      _newResult[index].twoLetterCode;
                                  widget.dashboardStore.moreFiltercountryID =
                                      _newResult[index].id;
                                  for (int i = 0;
                                      i < preFill.cities.length;
                                      i++) {
                                    if (widget.dashboardStore
                                            .moreFiltercountryID ==
                                        preFill.cities[i].countryId) {
                                      widget.dashboardStore.moreFiltercityName =
                                          preFill.cities[i].name;
                                      widget.dashboardStore.moreFiltercityID =
                                          preFill.cities[i].id;
                                      break;
                                    }
                                  }
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
                                              "${_newResult[index].name} - ${_newResult[index].twoLetterCode}",
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
