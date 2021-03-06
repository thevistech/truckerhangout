import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/country_code_model.dart';
import 'package:flutterapp/models/filter_property_model.dart';
import 'package:flutterapp/utills/config.dart';

class CountrySearch extends StatefulWidget {
  FilterPropertyModel filterPropertyModel;
  CountrySearch({
    this.filterPropertyModel,
  });
  CountrySearchState createState() => CountrySearchState();
}

class CountrySearchState extends State<CountrySearch> {
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
    _newResult = widget.filterPropertyModel.data.countries;
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
                              // if (widget.isSignUp)
                              //   widget.signUpStore.countryCodeAndFlag =
                              //       _searchResult[index];

                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      _searchResult[index].flag == null
                                          ? Expanded(
                                              child: SvgPicture.asset(
                                              "assets/svg_flag.svg",
                                              height: 20,
                                            ))
                                          : Expanded(
                                              child: Image.network(
                                              "${_searchResult[index].flag}",
                                              height: 20,
                                            )),
                                      Expanded(
                                        child: Center(
                                            child: Text(
                                                "${_searchResult[index].threeLetterCode}")),
                                      ),
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
                        })
                    : ListView.builder(
                        itemCount: _newResult.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // if (widget.isSignUp)
                              //   widget.signUpStore.countryCodeAndFlag =
                              //       _newResult[index];
                              // else
                              //   widget.forgetPasswordStore.countryCodeAndFlag =
                              //       _newResult[index];
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      _newResult[index].flag == null
                                          ? Expanded(
                                              child: SvgPicture.asset(
                                              "assets/svg_flag.svg",
                                              height: 20,
                                            ))
                                          : Expanded(
                                              child: Image.network(
                                              "${_newResult[index].flag}",
                                              height: 20,
                                            )),
                                      Expanded(
                                        child: Center(
                                            child: Text(
                                                "${_newResult[index].threeLetterCode}")),
                                      ),
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
    );
  }
}
