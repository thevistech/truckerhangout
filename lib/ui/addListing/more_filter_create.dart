import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/models/filter_property_model.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/filters/country_list_dialog.dart';
import 'package:flutterapp/ui/filters/city_list_dialog.dart';
import 'package:flutterapp/ui/filters/currency_list.dart';
import 'package:flutterapp/ui/filters/location_list_dialog.dart';
import 'package:flutterapp/ui/addListing/more_filter_property_type_buttons.dart';
import 'package:flutterapp/ui/filters/unit_list.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

// ignore: must_be_immutable
class MoreFilterCreate extends StatefulWidget {
  final DashBoardMainStore dashboardStore;
  bool isOpenFromProperty;

  MoreFilterCreate({
    @required this.dashboardStore,
    this.isOpenFromProperty = true,
  });
  @override
  _MoreFilterState createState() => _MoreFilterState();
}

class _MoreFilterState extends State<MoreFilterCreate> {
  List<BathRange> bedrooms = [];
  List<BathRange> bathrooms = [];
  List<bool> propertyFeaturesSelected;
  List<bool> propertyNearBySelected;

  int tappedIndex;
  int tappedIndexRooms;
  int _selectedIndex;
  double heightDivider;
  double heightContainer;

  List<Asset> images = List<Asset>();
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
    return moreFilters(height);
  }

  //*************** More Filter ***************//

  moreFilters(height) {
    return Observer(
      builder: (_) => Column(
        children: <Widget>[
          // /* Purpose Type List */
          // MyCustomMenuPropertyPurpose(
          //   store: widget.dashboardStore,
          // ),
          // SizedBox(
          //   height: 10,
          // ),

          titleTextFeild(),
          SizedBox(
            height: 10,
          ),
          descriptionTextFeild(),
          SizedBox(
            height: 10,
          ),
          labelTextsArea("Area", "( Sq Ft )", "Change Area Unit"),
          SizedBox(
            height: 10,
          ),
          areaTextField(),
          SizedBox(
            height: 10,
          ),

          labelTexts("Price", "( PKR )", "Change Currency"),
          SizedBox(
            height: 10,
          ),
          priceTextField(),
          SizedBox(
            height: 10,
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
          propertyTypes("Property Nearby"),
          SizedBox(
            height: 10,
          ),
          propertyNearBy(),
          propertyTypes("Select Images"),

          widget.isOpenFromProperty == true ? buildGridView() : Container(),
          labelTextsCountry("Country", "( Sale )", "Change Country"),
          SizedBox(
            height: 10,
          ),
          countryTextFilesWidget("City", "Location"),
          SizedBox(
            height: 15,
          ),

          addressTextFiled(height, 45),
          SizedBox(
            height: 10,
          ),
          emailTextFiled(height, 45),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  flex : 1,
                  child: countryCodePiker()),
              Expanded(
                 flex : 2,
                child: mobileNumberTextFiled(height, 45),
              ),
            ],
          ),
        ],
      ),
    );
  }


  mobileNumberTextFiled(height, width) {
    return Container(
      height: height40,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        //controller: passController,
        decoration: InputDecoration(
          hintText: 'Mobile number',
          hintStyle: TextStyle(fontSize: 12,color: UiColors.black),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration:
            BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.phone,
              size: prefixIconSize,
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.all(10.0),
          labelStyle:
          TextStyle(fontSize: 12, color: Colors.black),
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
  emailTextFiled(height, width) {
    return Container(
      height: height40,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        //controller: passController,
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(fontSize: 12,color: UiColors.black),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration:
            BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.email,
              size: prefixIconSize,
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.all(10.0),
          labelStyle:
          TextStyle(fontSize: 12, color: Colors.black),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 2.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: colorMain, width: 1.0),
          ),
        ),
      ),
    );
  }
  addressTextFiled(height, width) {
    return Container(
      height: height40,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        //controller: passController,
        decoration: InputDecoration(
          hintText: 'Address',
          hintStyle: TextStyle(fontSize: 12,color: UiColors.black),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration:
            BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.location_on,
              size: prefixIconSize,
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.all(10.0),
          labelStyle:
          TextStyle(fontSize: 12, color: Colors.black),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 2.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: colorMain, width: 1.0),
          ),
        ),
      ),
    );
  }
  countryCodePiker() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:10.0),
      child: InkWell(
        onTap: () {
          //showCountryCodePickerDialog(context);
        },
        child: Container(
          height: height40,
          child: TextField(
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabled: false,
                hintText: '+92',
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Container(
                    margin: EdgeInsets.fromLTRB(10, 4, 8, 4),
                    child: SvgPicture.asset(
                      "assets/svg_flag.svg",
                      height: 20,
                    )),
                contentPadding: EdgeInsets.all(10.0),
                labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                    borderSide: BorderSide(color: colorMain, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0),
                )),
          ),
        ),
      ),
    );
  }

  buildGridView() {
    return Container(
      child: InkWell(
        onTap: () {
          loadAssets();
        },
        child: Container(
          height: 250 /*  (images.length <= 3 ? 135 : 270) */,
          padding: EdgeInsets.all(15.0),
          child: DottedBorder(
            color: colorMain,
            strokeWidth: 1,
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(6, (index) {
                Asset asset;
                try {
                  if (images[index] != null) asset = images[index];
                } catch (e) {
                  print("Exception: " + e.toString());
                }
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: smokeybgColor,
                      ),
                      borderRadius: BorderRadius.circular(2.0)),
                  margin: EdgeInsets.all(5.0),
                  child: asset != null
                      ? AssetThumb(
                    asset: asset,
                    width: 300,
                    height: 300,
                  )
                      : Icon(Icons.add,color: colorMain,),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }


  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 6,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          startInAllView: true,
          statusBarColor: "#2A326D",
          actionBarColor: "#2A326D",
          actionBarTitle: "Select Pictures",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      //_error = error;
    });
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

  areaTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      height: height40,
      child: TextField(
        style: TextStyle(fontSize: 12),
        //onChanged: (value) => store.company = value,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.black),
            hintText: 'Area',
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
              decoration:
                  BoxDecoration(color: colorMain, shape: BoxShape.circle),
              child: Icon(
                Icons.flag,
                size: prefixIconSize,
                color: Colors.white,
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            )),
      ),
    );
  }

//*************** More Filter Price Widget ***************//

  priceTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      height: height40,
      child: TextField(
        style: TextStyle(fontSize: 12),
        //onChanged: (value) => store.company = value,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.black),
            hintText: 'Price',
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
              decoration:
                  BoxDecoration(color: colorMain, shape: BoxShape.circle),
              child: Icon(
                Icons.attach_money,
                size: prefixIconSize,
                color: Colors.white,
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            )),
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
            var title = widget
                .dashboardStore
                .filterPropertyModel
                .data
                .categories[widget.dashboardStore.categoryID]
                .childes[int]
                .child
                .title;
            var image = widget.dashboardStore.filterPropertyModel.url + widget
                .dashboardStore
                .filterPropertyModel
                .data
                .categories[widget.dashboardStore.categoryID]
                .childes[int]
                .child
                .image;
            return GestureDetector(
              onTap: () {
                // if (widget.dashboardStore.propertySubTypeSelected == int)y
                //   widget.dashboardStore.propertySubTypeSelected = null;
                // elseyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy
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
                          padding: const EdgeInsets.all(5.0),
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
                              imageUrl:image,
//                                'https://static.thenounproject.com/png/212328-200.png',
                              placeholder:(context,url)=>dummyMoreFilterImger(context, true),
                              errorWidget: (context,url,error)=>dummyMoreFilterImger(context, false),
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
            var image = widget.dashboardStore.filterPropertyModel.url + widget
                .dashboardStore
                .filterPropertyModel.data.propertyFeatures[int]
                .image;
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
                              imageUrl:image,
                              placeholder: (context,url)=>dummyMoreFilterImger(context,true),
                              errorWidget: (context,url,error)=>dummyMoreFilterImger(context,true),
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
            return GestureDetector(
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
                              imageUrl:image,
                              placeholder: (context,url)=>dummyMoreFilterImger(context,true),
                              errorWidget: (context,url,error)=>dummyMoreFilterImger(context,true),
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

  titleTextFeild() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      height: height40,
      child: TextField(
        style: TextStyle(fontSize: 12),
        //onChanged: (value) => store.company = value,
        decoration: InputDecoration(
            filled: true,
            enabled: false,
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.black),
            hintText: 'Title',
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
              decoration:
                  BoxDecoration(color: colorMain, shape: BoxShape.circle),
              child: Icon(
                Icons.archive,
                size: prefixIconSize,
                color: Colors.white,
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            )),
      ),
    );
  }

  descriptionTextFeild() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        maxLines: 5,
        style: TextStyle(fontSize: 12),
        //onChanged: (value) => store.company = value,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.black),
            hintText: 'Description',
            contentPadding: EdgeInsets.all(10.0),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            )),
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
            widget.isOpenFromProperty ? ' Filter Property ' : 'Search Property',
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
