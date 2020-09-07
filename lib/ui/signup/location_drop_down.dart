import 'package:flutter/material.dart';
import 'package:flutterapp/models/lcoation_content_model.dart';
import 'package:flutterapp/stores/signup_store.dart';
import 'package:flutterapp/utills/config.dart';

class ListSearch extends StatefulWidget {
  LocationContentModel locationContentModel;
  SignUpStore signUpStore;
  ListSearch({this.locationContentModel, this.signUpStore});
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();
  List<Datum> _searchResult = [];
  List<Datum> _newResult = [];
  onItemChanged(String value) {
    _searchResult.clear();
    if (value.isEmpty) {
      setState(() {});
      return;
    }
    _newResult.forEach((userDetail) {
      if (userDetail.areaName.toLowerCase().contains(value.toLowerCase())) {
        _searchResult.add(userDetail);
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newResult = widget.locationContentModel.data;
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
                              widget.signUpStore.location =
                                  _searchResult[index].areaName;

                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("${_searchResult[index].areaName}"),
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
                              widget.signUpStore.location =
                                  _newResult[index].areaName;
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("${_newResult[index].areaName}"),
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
