import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/filter_property_model.dart';
import 'package:flutterapp/stores/create_property_store.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:speech_to_text/speech_to_text.dart';

class LanguageList extends StatefulWidget {
  final CreatePropertyStore createPropertyStore;
  List<LocaleName> localeNames;
  LanguageList({this.createPropertyStore, this.localeNames});
  LanguageListState createState() => LanguageListState();
}

class LanguageListState extends State<LanguageList>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  TextEditingController _textController = TextEditingController();
  List<LocaleName> _searchResult = [];
  List<LocaleName> _newResult = [];
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
    _newResult = widget.localeNames;
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
                _searchResult.length > 0
                    ? Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _searchResult.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  widget.createPropertyStore.localeNames =
                                      _searchResult[index].name;
                                  widget.createPropertyStore.localeID =
                                      _searchResult[index].localeId;
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
                                              "${_searchResult[index].name}",
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
                            }),
                      )
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _newResult.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  widget.createPropertyStore.localeNames =
                                      _newResult[index].name;
                                  widget.createPropertyStore.localeID =
                                      _newResult[index].localeId;
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
                                              "${_newResult[index].name}",
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
