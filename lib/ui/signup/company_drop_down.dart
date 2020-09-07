import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/company_model.dart';
import 'package:flutterapp/stores/signup_store.dart';
import 'package:flutterapp/utills/config.dart';

class CompanySearch extends StatefulWidget {
  CompanyDialog companyDialog;
  SignUpStore signUpStore;
  CompanySearch({
    this.companyDialog,
    this.signUpStore,
  });
  CompanySearchState createState() => CompanySearchState();
}

class CompanySearchState extends State<CompanySearch> {
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
    _newResult = widget.companyDialog.data;
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
                              widget.signUpStore.companyDialogItemValue =
                                  _searchResult[index];
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("${_searchResult[index].name}"),
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
                              widget.signUpStore.companyDialogItemValue =
                                  _newResult[index];
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("${_newResult[index].name}"),
                                  Divider(
                                    color: colorDivider,
                                    height: 2,
                                  ),
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
