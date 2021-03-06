import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/country_code_model.dart';
import 'package:flutterapp/stores/forget_password_store.dart';
import 'package:flutterapp/stores/signup_store.dart';
import 'package:flutterapp/stores/signup_store.dart';
import '../../stores/forget_password_store.dart';
import 'package:flutterapp/utills/config.dart';

class CountrySearch extends StatefulWidget {
  CountryCodeModel countryCodeModel;
  SignUpStore signUpStore;
  ForgetPasswordStore forgetPasswordStore;
  bool isSignUp;
  CountrySearch(
      {this.countryCodeModel,
      this.signUpStore,
      this.forgetPasswordStore,
      this.isSignUp = true});
  CountrySearchState createState() => CountrySearchState();
}

class CountrySearchState extends State<CountrySearch> {
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
      if (userDetail.countryTitle.toLowerCase().contains(value.toLowerCase()) ||
          userDetail.code.toLowerCase().contains(value.toLowerCase())) {
        _searchResult.add(userDetail);
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newResult = widget.countryCodeModel.data;
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
                              if (widget.isSignUp)
                                widget.signUpStore.countryCodeAndFlag =
                                    _searchResult[index];
                              else
                                widget.forgetPasswordStore.countryCodeAndFlag =
                                    _searchResult[index];

                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      _searchResult[index].countryFlag == null
                                          ? Expanded(
                                              child: SvgPicture.asset(
                                              "assets/svg_flag.svg",
                                              height: 20,
                                            ))
                                          : Expanded(
                                              child: Image.network(
                                              "${_searchResult[index].countryFlag}",
                                              height: 20,
                                            )),
                                      Expanded(
                                        child: Center(
                                            child: Text(
                                                "${_searchResult[index].code}")),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          "${_searchResult[index].countryTitle}",
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
                              if (widget.isSignUp)
                                widget.signUpStore.countryCodeAndFlag =
                                    _newResult[index];
                              else
                                widget.forgetPasswordStore.countryCodeAndFlag =
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
                                      _newResult[index].countryFlag == null
                                          ? Expanded(
                                              child: SvgPicture.asset(
                                              "assets/svg_flag.svg",
                                              height: 20,
                                            ))
                                          : Expanded(
                                              child: Image.network(
                                              "${_newResult[index].countryFlag}",
                                              height: 20,
                                            )),
                                      Expanded(
                                        child: Center(
                                            child: Text(
                                                "${_newResult[index].code}")),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          "${_newResult[index].countryTitle}",
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
