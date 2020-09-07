import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/filter_property_model.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/filters/country_list_dialog.dart';
import 'package:flutterapp/ui/filters/city_list_dialog.dart';
import 'package:flutterapp/ui/filters/currency_list.dart';
import 'package:flutterapp/ui/filters/location_list_dialog.dart';
import 'package:flutterapp/ui/filters/min_and_max_price.dart';
import 'package:flutterapp/ui/filters/min_and_max_area.dart';
import 'package:flutterapp/ui/filters/more_filter_property_purpose_button.dart';
import 'package:flutterapp/ui/filters/unit_list.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';
import 'more_filter_property_type_buttons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class MoreFilter extends StatefulWidget {
  final DashBoardMainStore dashboardStore;
  bool isOpenFromFilterTab;
  var userImage;
  MoreFilter(
      {@required this.dashboardStore,
      this.isOpenFromFilterTab = true,
      this.userImage});
  @override
  _MoreFilterState createState() => _MoreFilterState();
}

class _MoreFilterState extends State<MoreFilter> {
  List<BathRange> bedrooms = [];
  List<BathRange> bathrooms = [];
  List<bool> propertyFeaturesSelected;
  List<bool> propertyNearBySelected;

  int tappedIndex;
  int tappedIndexRooms;
  int _selectedIndex;
  double heightDivider;
  double heightContainer;

  @override
  void initState() {
    tappedIndex = 0;
    tappedIndexRooms = 0;
    _selectedIndex = 0;
    heightDivider = 0.0;
    heightContainer = 30.0;

    bedrooms = widget.dashboardStore.filterPropertyModel.data.bedroomRanges;
    bathrooms = widget.dashboardStore.filterPropertyModel.data.bathRanges;

    var preFill = widget.dashboardStore.filterPropertyModel.data;
    widget.dashboardStore.moreFiltercountryName =
        preFill.countries[0].twoLetterCode;
    widget.dashboardStore.moreFiltercountryID = preFill.countries[0].id;
    widget.dashboardStore.moreFilterAreaUnit = preFill.units[0].code;
    widget.dashboardStore.moreFilterAreaUnitID = preFill.units[0].id;
    widget.dashboardStore.moreFilterCurrencyUnit = preFill.currencies[0].title;
    widget.dashboardStore.moreFilterCurrencyID = preFill.currencies[0].id;
    for (int i = 0; i < preFill.cities.length; i++) {
      if (preFill.countries[0].id == preFill.cities[i].countryId) {
        widget.dashboardStore.moreFiltercityName = preFill.cities[i].name;
        widget.dashboardStore.moreFiltercityID = preFill.cities[i].id;
        break;
      }
    }
    for (int i = 0; i < preFill.locations.length; i++) {
      if (preFill.cities[0].id == preFill.locations[i].cityId) {
        widget.dashboardStore.moreFilterlocationName =
            preFill.locations[i].name;
        widget.dashboardStore.moreFilterlocationID = preFill.locations[i].id;
        break;
      }
    }
    widget.dashboardStore.moreFilterHideShowAccordingToPropertyType =
        PropertyType.homes;
    widget.dashboardStore.categoryID = 0;
    propertyFeaturesSelected = List.generate(
        widget.dashboardStore.filterPropertyModel.data.propertyFeatures.length,
        (_) => false);
    propertyNearBySelected = List.generate(
        widget.dashboardStore.filterPropertyModel.data.propertyNearBy.length,
        (_) => false);
    widget.dashboardStore.propertySubTypeSelected = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 5.5;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: colorMain,
        centerTitle: false,
        title: Text(widget.isOpenFromFilterTab ? ' Filter' : 'Search'),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Chat();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(
                "assets/message.svg",
                allowDrawingOutsideViewBox: true,
                height: 35,
                color: Colors.white,
              ),
            ),
          ),
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.transparent,
            // radius: 45.0,
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 34,
                width: 34,
                imageUrl: "${widget.userImage}",
              ),
            ),
          ),
        ],
        leading: InkWell(
            onTap: () {
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
            },
            child: Icon(Icons.arrow_back)),
        elevation: 0.0,
        // ignore: missing_required_param
        bottom: PreferredSize(
          child: Container(
            height: 1,
            color: Colors.white,
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        buttonFilterProperty(),
      ],
      body: moreFilters(height),
    );
  }

  //*************** More Filter ***************//

  moreFilters(height) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: height,
              color: colorMain,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.isOpenFromFilterTab
                        ? ' Filter Property by option'
                        : ' Find desire property by option',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Just one tap and find yours',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyCustomMenuPropertyPurpose(
                    store: widget.dashboardStore,
                  ),
                ],
              ),
            ),
          ],
        ),
        Observer(
          builder: (_) => Column(
            children: <Widget>[
              // /* Purpose Type List */
              // MyCustomMenuPropertyPurpose(
              //   store: widget.dashboardStore,
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                height: heightDivider,
                color: Colors.grey[200],
              ),
              SizedBox(
                height: 10,
              ),
              labelTextsCountry("Country", "( Sale )", "Change Country"),
              SizedBox(
                height: 10,
              ),
              countryTextFilesWidget("City", "Location"),
              SizedBox(
                height: 10,
              ),
              Container(
                height: heightDivider,
                color: Colors.grey[200],
              ),
              propertyTypes("Property Types"),
              SizedBox(
                height: 10,
              ),
              /* Property Type List */
              MyCustomMenu(
                store: widget.dashboardStore,
              ),
              SizedBox(
                height: 10,
              ),
              //  peopertyTypeList(widget.store.filterPropertyModel, false),
              propertyCategoryChild(),
              SizedBox(
                height: 10,
              ),
              Container(
                height: heightDivider,
                color: Colors.grey[200],
              ),
              labelTextsArea("Area", "( Sq Ft )", "Change Area Unit"),
              SizedBox(
                height: 10,
              ),
              areaTextField("Min Area", "Max Area"),
              SizedBox(
                height: 10,
              ),
              Container(
                height: heightDivider,
                color: Colors.grey[200],
              ),
              labelTexts("Price", "( PKR )", "Change Currency"),
              SizedBox(
                height: 10,
              ),
              priceTextField("Min Price", "Max Price"),
              SizedBox(
                height: 10,
              ),
              Container(
                height: heightDivider,
                color: Colors.grey[200],
              ),
              /* Bedroom */
              widget.dashboardStore.moreFilterHideShowAccordingToPropertyType ==
                      PropertyType.homes
                  ? propertyTypes("Bedrooms")
                  : Container(),
              widget.dashboardStore.moreFilterHideShowAccordingToPropertyType ==
                      PropertyType.homes
                  ? bedRoomsList(bedrooms)
                  : Container(),
              SizedBox(
                height: widget.dashboardStore
                            .moreFilterHideShowAccordingToPropertyType ==
                        PropertyType.homes
                    ? 10
                    : 0,
              ),
              Container(
                height: heightDivider,
                color: Colors.grey[200],
              ),
              /* Bathroom */
              widget.dashboardStore.moreFilterHideShowAccordingToPropertyType ==
                          PropertyType.homes ||
                      widget.dashboardStore
                              .moreFilterHideShowAccordingToPropertyType ==
                          PropertyType.Commercial
                  ? propertyTypes("Baths")
                  : Container(),
              widget.dashboardStore.moreFilterHideShowAccordingToPropertyType ==
                          PropertyType.homes ||
                      widget.dashboardStore
                              .moreFilterHideShowAccordingToPropertyType ==
                          PropertyType.Commercial
                  ? washroomList(bathrooms)
                  : Container(),
              SizedBox(
                height: widget.dashboardStore
                                .moreFilterHideShowAccordingToPropertyType ==
                            PropertyType.homes ||
                        widget.dashboardStore
                                .moreFilterHideShowAccordingToPropertyType ==
                            PropertyType.Commercial
                    ? 10
                    : 0,
              ),
              Container(
                height: heightDivider,
                color: Colors.grey[200],
              ),
              /* Property Features */
              widget.dashboardStore.moreFilterHideShowAccordingToPropertyType ==
                          PropertyType.homes ||
                      widget.dashboardStore
                              .moreFilterHideShowAccordingToPropertyType ==
                          PropertyType.Commercial
                  ? propertyTypes("Property Features")
                  : Container(),
              SizedBox(
                height: widget.dashboardStore
                                .moreFilterHideShowAccordingToPropertyType ==
                            PropertyType.homes ||
                        widget.dashboardStore
                                .moreFilterHideShowAccordingToPropertyType ==
                            PropertyType.Commercial
                    ? 10
                    : 0,
              ),
              widget.dashboardStore.moreFilterHideShowAccordingToPropertyType ==
                          PropertyType.homes ||
                      widget.dashboardStore
                              .moreFilterHideShowAccordingToPropertyType ==
                          PropertyType.Commercial
                  ? propertyFeatures()
                  : Container(),
              SizedBox(
                height: widget.dashboardStore
                                .moreFilterHideShowAccordingToPropertyType ==
                            PropertyType.homes ||
                        widget.dashboardStore
                                .moreFilterHideShowAccordingToPropertyType ==
                            PropertyType.Commercial
                    ? 10
                    : 0,
              ),
              Container(
                height: heightDivider,
                color: Colors.grey[200],
              ),
              propertyTypes("Property Nearby"),
              SizedBox(
                height: 10,
              ),
              propertyNearBy(),
              SizedBox(
                height: 10,
              ),
              Container(
                height: heightDivider,
                color: Colors.grey[200],
              ),
              propertyTypes("Property Keyword "),
              SizedBox(
                height: 10,
              ),
              propertyKeywordAndIdTextFiled("Property Keyword"),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        Container(
          color: colorMain,
          height: 1,
        ),
      ],
    );
  }

//*************** More Filter Country Widget***************//

  countryTextFilesWidget(city, location) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                selectCityPicker(context, widget.dashboardStore);
              },
              child: Observer(
                builder: (_) => Container(
                  height: height40,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                    //controller: passController,
                    decoration: InputDecoration(
                      enabled: false,
                      fillColor: colorMain,
                      filled: true,
                      hintText: widget.dashboardStore.moreFiltercityName == null
                          ? "Select City"
                          : widget.dashboardStore.moreFiltercityName,
                      suffixIcon: Container(
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: prefixIconSize,
                          color: Colors.white,
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.all(0.0),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(const Radius.circular(32.0)),
                          borderSide: BorderSide(color: colorMain, width: 1.0)),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            topLeft: Radius.circular(32.0)),
                        borderSide: BorderSide(color: colorMain, width: 1.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () {
                selectLocationPicker(context, widget.dashboardStore);
              },
              child: Observer(
                builder: (_) => Container(
                  height: height40,
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 12),
                    //controller: passController,
                    decoration: InputDecoration(
                      enabled: false,
                      fillColor: UiColors.white,
                      filled: true,
                      hintText:
                          widget.dashboardStore.moreFilterlocationName == null
                              ? "Select Location"
                              : widget.dashboardStore.moreFilterlocationName,
                      hintStyle: TextStyle(color: hintText),
                      suffixIcon: Container(
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: prefixIconSize,
                          color: colorMain,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(10.0),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(const Radius.circular(32.0)),
                          borderSide: BorderSide(color: colorMain, width: 1.0)),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                        borderSide: BorderSide(color: colorMain, width: 1.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//*************** More Filter Location Widget***************//

  locationTextFilesWidget(width, height, value) {
    return Container(
      height: height40,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        //controller: passController,
        decoration: InputDecoration(
          fillColor: UiColors.white,
          filled: true,
          hintText: value,
          hintStyle: TextStyle(color: hintText),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.lock,
              size: prefixIconSize,
              color: colorMain,
            ),
          ),
          contentPadding: EdgeInsets.all(0.0),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: colorMain, width: 1.0),
          ),
        ),
      ),
    );
  }

//*************** More Filter / Home Type Filter Property List ***************//

  peopertyTypeList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 25,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount:
            widget.dashboardStore.filterPropertyModel.data.purposes.length,
        itemBuilder: (ctx, index) {
          var purpose = widget.dashboardStore.filterPropertyModel.data.purposes;
          return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      purpose[index]
                          .purpose
                          .title
                          .toString()
                          .replaceAll("For ", ""),
                      style: TextStyle(
                        fontSize: 14,
                        color: _selectedIndex == index ? colorMain : colorGrey,
                      ),
                    ),
                  ),
                  index != purpose.length - 1 ? Text("|") : Text("")
                ],
              ));
        },
      ),
    );
  }

//*************** More Filter Property Type ***************//

  propertyTypes(value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Text(
            value,
            style: TextStyle(color: Colors.black),
          ),
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
                  color: lighrgrey,
                  height: 36,
                )),
          ),
        ],
      ),
    );
  }

//*************** More Filter Washroom Widget ***************//

  washroomList(List<BathRange> list) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (ctx, index) {
          final item = list[index].text;

          return InkWell(
            onTap: () {
              setState(() {
                tappedIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.all(5.0),
              width: 55,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Container(
                    color: tappedIndex == index ? colorMain : halfWhite,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        item.toString(),
                        style: TextStyle(
                            color: tappedIndex == index
                                ? Colors.white
                                : Colors.black),
                      )),
                    )),
              ),
            ),
          );
        },
      ),
    );
  }

//*************** More Filter Bedroom Widget ***************//

  bedRoomsList(List<BathRange> list) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (ctx, index) {
          final item = list[index].text;
          return InkWell(
            onTap: () {
              setState(() {
                tappedIndexRooms = index;
              });
            },
            child: Container(
              padding: EdgeInsets.all(5.0),
              width: 70,
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Container(
                    color: tappedIndexRooms == index ? colorMain : halfWhite,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        item.toString(),
                        style: TextStyle(
                            color: tappedIndexRooms == index
                                ? Colors.white
                                : Colors.black),
                      )),
                    )),
              ),
            ),
          );
        },
      ),
    );
  }

//*************** More Filter Country Label Text Widget ***************//

  labelTextsCountry(s, t, u) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                selectCountryPicker(context, widget.dashboardStore);
              },
              child: Text(
                s,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectCountryPicker(context, widget.dashboardStore);
              },
              child: Container(
                child: Text(
                  " ( ${widget.dashboardStore.moreFiltercountryName} )",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: colorMain),
                ),
              ),
            ),
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Divider(
                    color: lighrgrey,
                    height: 36,
                  )),
            ),
            GestureDetector(
              onTap: () {
                selectCountryPicker(context, widget.dashboardStore);
              },
              child: Text(
                u,
                style: TextStyle(color: colorMain, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
//*************** More Filter Area Label Text Widget ***************//

  labelTextsArea(s, t, u) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                selectUnitPicker(context, widget.dashboardStore);
              },
              child: Text(
                s,
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                selectUnitPicker(context, widget.dashboardStore);
              },
              child: Text(
                "( ${widget.dashboardStore.moreFilterAreaUnit} )",
                style: TextStyle(color: colorMain, fontSize: 12),
              ),
            ),
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Divider(
                    color: lighrgrey,
                    height: 36,
                  )),
            ),
            GestureDetector(
              onTap: () {
                selectUnitPicker(context, widget.dashboardStore);
              },
              child: Text(
                u,
                style: TextStyle(color: colorMain, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

//*************** More Filter Generic Label Text Widget ***************//

  labelTexts(s, t, u) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                selectCurrencyPicker(context, widget.dashboardStore);
              },
              child: Text(
                s,
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                selectCurrencyPicker(context, widget.dashboardStore);
              },
              child: Text(
                " ( ${widget.dashboardStore.moreFilterCurrencyUnit} )",
                style: TextStyle(color: colorMain, fontSize: 12),
              ),
            ),
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Divider(
                    color: lighrgrey,
                    height: 36,
                  )),
            ),
            GestureDetector(
              onTap: () {
                selectCurrencyPicker(context, widget.dashboardStore);
              },
              child: Text(
                u,
                style: TextStyle(color: colorMain, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

//*************** More Filter Area Min And Max ***************//

  areaTextField(minarea, maxarea) {
    return Container(
      decoration: BoxDecoration(
          color: halfWhite,
          border: Border.all(
            color: halfWhite,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: InkWell(
          onTap: () {
            selectMinAndMaxAreaPicker(context, widget.dashboardStore);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  Text(
                    "Min",
                    style: TextStyle(fontSize: 16, letterSpacing: 1.0),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${widget.dashboardStore.moreFilterMinArea}",
                    style: TextStyle(color: colorMain, fontSize: 12),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: lighrgrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      "to",
                      style: TextStyle(color: colorMain, fontSize: 12),
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: lighrgrey,
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Text(
                    "Max",
                    style: TextStyle(fontSize: 16, letterSpacing: 1.0),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${widget.dashboardStore.moreFilterMaxArea}",
                    style: TextStyle(color: colorMain, fontSize: 12),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

//*************** More Filter Price Widget ***************//

  priceTextField(minArea, maxArea) {
    return Container(
      decoration: BoxDecoration(
          color: halfWhite,
          border: Border.all(
            color: halfWhite,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: InkWell(
          onTap: () {
            selectMinAndMaxPricePicker(context, widget.dashboardStore);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  Text(
                    "Min",
                    style: TextStyle(fontSize: 16, letterSpacing: 1.0),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${widget.dashboardStore.moreFilterMinPrice}",
                    style: TextStyle(color: colorMain, fontSize: 12),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: lighrgrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      "to",
                      style: TextStyle(color: colorMain, fontSize: 12),
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: lighrgrey,
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Text(
                    "Max",
                    style: TextStyle(fontSize: 16, letterSpacing: 1.0),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${widget.dashboardStore.moreFilterMaxPrice}",
                    style: TextStyle(color: colorMain, fontSize: 12),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

//*************** More Filter Property Category Child List ***************//

  propertyCategoryChild() {
    return SizedBox(
      height: 118,
      width: MediaQuery.of(context).size.width,
      child: Observer(
        builder: (_) => ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.dashboardStore.filterPropertyModel.data
              .categories[widget.dashboardStore.categoryID].childes.length,
          itemBuilder: (ctx, int) {
            var title = "";
            var image = "";
            title = widget
                .dashboardStore
                .filterPropertyModel
                .data
                .categories[widget.dashboardStore.categoryID]
                .childes[int]
                .child
                .title;
            image = widget.dashboardStore.filterPropertyModel.url +
                widget
                    .dashboardStore
                    .filterPropertyModel
                    .data
                    .categories[widget.dashboardStore.categoryID]
                    .childes[int]
                    .child
                    .image;

            return GestureDetector(
              onTap: () {
                // if (widget.dashboardStore.propertySubTypeSelected == int)
                //   widget.dashboardStore.propertySubTypeSelected = null;
                // else
                widget.dashboardStore.propertySubTypeSelected = int;

                setState(() {});
              },
              child: Container(
                width: 75,
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: widget.dashboardStore
                                              .propertySubTypeSelected ==
                                          int
                                      ? colorMain
                                      : halfWhite)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.contain,
                              height: 60,
                              imageUrl: image,
//                                'https://static.thenounproject.com/png/212328-200.png',
                              placeholder: (context, url) =>
                                  dummyMoreFilterImger(context, true),
                              errorWidget: (context, url, error) =>
                                  dummyMoreFilterImger(context, false),
                            ),
                          ),
                        ),
                        widget.dashboardStore.propertySubTypeSelected == int
                            ? Positioned(
                                top: 8,
                                right: 3,
                                child: Container(
                                  width: 16.0,
                                  height: 16.0,
                                  decoration: BoxDecoration(
                                      color: colorMain,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        int == 0 ? "All" : title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

//*************** More Filter Property Features List ***************//

  propertyFeatures() {
    return SizedBox(
      height: 118,
      width: MediaQuery.of(context).size.width,
      child: Observer(
        builder: (_) => ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget
              .dashboardStore.filterPropertyModel.data.propertyFeatures.length,
          itemBuilder: (ctx, int) {
            var title = widget.dashboardStore.filterPropertyModel.data
                .propertyFeatures[int].title;

            var image = widget.dashboardStore.filterPropertyModel.url +
                widget.dashboardStore.filterPropertyModel.data
                    .propertyFeatures[int].image;
            return GestureDetector(
              onTap: () {
                if (propertyFeaturesSelected[int])
                  propertyFeaturesSelected[int] = false;
                else
                  propertyFeaturesSelected[int] = true;
                setState(() {});
              },
              child: Container(
                width: 75,
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: propertyFeaturesSelected[int]
                                      ? colorMain
                                      : halfWhite)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.contain,
                              height: 60,
                              imageUrl: image,
                              placeholder: (context, url) =>
                                  dummyMoreFilterImger(context, true),
                              errorWidget: (context, url, error) =>
                                  dummyMoreFilterImger(context, true),
                            ),
                          ),
                        ),
                        propertyFeaturesSelected[int]
                            ? Positioned(
                                top: 8,
                                right: 3,
                                child: Container(
                                  width: 16.0,
                                  height: 16.0,
                                  decoration: BoxDecoration(
                                      color: colorMain,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

//*************** More Filter Property Near By List ***************//

  propertyNearBy() {
    return SizedBox(
      height: 118,
      width: MediaQuery.of(context).size.width,
      child: Observer(
        builder: (_) => ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget
              .dashboardStore.filterPropertyModel.data.propertyNearBy.length,
          itemBuilder: (ctx, int) {
            var title = widget.dashboardStore.filterPropertyModel.data
                .propertyNearBy[int].title;
            var image = widget.dashboardStore.filterPropertyModel.url +
                widget.dashboardStore.filterPropertyModel.data
                    .propertyNearBy[int].image;
            return InkWell(
              onTap: () {
                if (propertyNearBySelected[int])
                  propertyNearBySelected[int] = false;
                else
                  propertyNearBySelected[int] = true;
                setState(() {});
              },
              child: Container(
                width: 75,
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: propertyNearBySelected[int]
                                      ? colorMain
                                      : halfWhite)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.contain,
                              height: 60,
                              imageUrl: image,
                              placeholder: (context, url) =>
                                  dummyMoreFilterImger(context, true),
                              errorWidget: (context, url, error) =>
                                  dummyMoreFilterImger(context, true),
                            ),
                          ),
                        ),
                        propertyNearBySelected[int]
                            ? Positioned(
                                top: 8,
                                right: 3,
                                child: Container(
                                  width: 16.0,
                                  height: 16.0,
                                  decoration: BoxDecoration(
                                      color: colorMain,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

//*************** More Filter Property Keyword Id ***************//

  propertyKeywordAndIdTextFiled(keyword) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: height40,
        child: TextFormField(
          style: TextStyle(fontSize: 12),
          //controller: passController,
          decoration: InputDecoration(
            hintText: keyword,
            filled: true,
            fillColor: UiColors.white,
            hintStyle: TextStyle(color: hintText),
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 3, 10, 3),
              decoration:
                  BoxDecoration(color: colorMain, shape: BoxShape.circle),
              child: Icon(
                Icons.lock,
                size: prefixIconSize,
                color: colorMain,
              ),
            ),
            contentPadding: EdgeInsets.all(0.0),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }

//*************** More Filter (Fitler Property Button) ***************//

  buttonFilterProperty() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      padding: EdgeInsets.all(0.0),
      height: height40,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        onPressed: () {},
        color: colorMain,
        disabledColor: colorMain,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            widget.isOpenFromFilterTab
                ? ' Filter Property '
                : 'Search Property',
            style: TextStyle(fontSize: buttonFontSize),
            textAlign: TextAlign.center,
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }
}

selectCountryPicker(context, store) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return CountrySearch(dashboardStore: store);
    },
  );
}

selectUnitPicker(context, store) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return UnitList(dashboardStore: store);
    },
  );
}

selectCurrencyPicker(context, store) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return CurrencyList(dashboardStore: store);
    },
  );
}

selectMinAndMaxPricePicker(context, store) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return MinAndMaxPrice(dashboardStore: store);
    },
  );
}

selectMinAndMaxAreaPicker(context, store) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return MinAndMaxArea(dashboardStore: store);
    },
  );
}

selectCityPicker(context, store) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return CitySearch(dashboardStore: store);
    },
  );
}

selectLocationPicker(context, store) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return LcoationSearch(dashboardStore: store);
    },
  );
}
