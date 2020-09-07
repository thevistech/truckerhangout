/* import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/area_unit_model.dart';
import 'package:flutterapp/stores/create_property_store.dart';
import 'package:flutterapp/utills/config.dart';

class AreaUnit extends StatefulWidget {
  AreaUnitModel areaUnitModel;
  CreatePropertyStore store;
  AreaUnit({this.areaUnitModel, this.store});
  AreaUnitState createState() => AreaUnitState();
}

class AreaUnitState extends State<AreaUnit> {
  TextEditingController _textController = TextEditingController();
  List<Datum> _searchResult = [];
  List<Datum> _newResult = [];
  onItemChanged(String value) {
    _searchResult.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    }
    _newResult.forEach((data) {
      if (data.title.toLowerCase().contains(value.toLowerCase())) {
        _searchResult.add(data);
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newResult = widget.areaUnitModel.data;
    print(_newResult.length);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Material(
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
                          widget.store.areaUnits = _searchResult[index];

                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "${_searchResult[index].title}",
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
                          widget.store.areaUnits =
                          _newResult[index];
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "${_newResult[index].title}",
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
    );
  }
}
 */