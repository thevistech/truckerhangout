import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/country_code_model.dart';
import 'package:flutterapp/models/lcoation_content_model.dart';
import 'package:flutterapp/stores/signup_store.dart';
import 'package:flutterapp/ui/verification_code.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/constants.dart';
import 'package:flutterapp/ui/signup/country_drop_down.dart';
import 'package:flutterapp/ui/signup/company_drop_down.dart';
import 'package:flutterapp/ui/signup/custom_menu.dart';
import 'package:flutterapp/ui/signup/location_drop_down.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../location_picker_map.dart';

class SignUpNew extends StatefulWidget {
  @override
  _SignUpNewState createState() => _SignUpNewState();
}

class _SignUpNewState extends State<SignUpNew> {
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode numberFocusNode = FocusNode();

  var _addressController = TextEditingController();
  var _countryController = TextEditingController();
  var _cityController = TextEditingController();
  var _postalCodeController = TextEditingController();

  List<bool> _selection = List.generate(2, (_) => false);

  LocationContentModel _locationContentModel;
  CountryCodeModel _countryCodeModel;
  bool _visible = true;
  int counter = 0;
  var _information;
  static LatLng _initialPosition;

  bool passwordVisible;
  final store = SignUpStore();

  @override
  void initState() {
    super.initState();
    store.setupValidations();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCountryCodes();
    });
    passwordVisible = false;
    _selection[0] = true;
  }

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  void updateInformation(var information) {
    setState(() {
      _information = information;
      _addressController.text = _information.addressLine;
      //   _countryController.text = _information.countryName;
      _cityController.text = _information.locality;
      _postalCodeController.text = _information.postalCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 1.1;
    double height = MediaQuery.of(context).size.height / 15;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg_image.png'),
                  colorFilter: new ColorFilter.mode(
                      Colors.white.withOpacity(0.3), BlendMode.dstIn),
                  fit: BoxFit.fill)),

          child: SizedBox(
            height: height * 15,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Image.asset('assets/sizesvg.svg'),
                              Icon(
                                Icons.person_add,
                                color: colorMain,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "SIGN UP",
                                style: TextStyle(
                                    fontSize: headingFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Account Information",
                            style: TextStyle(fontSize: subHeadingFontSize),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
//                          Visibility(
//                            maintainSize: false,
//                            maintainAnimation: true,
//                            maintainState: true,
//                            visible: _visible,
//                            child: Container(
//                                margin:
//                                    EdgeInsets.only(bottom: _visible ? 50 : 0),
//                                alignment: Alignment.center,
//                                child: MyCustomMenu(store: store)),
//                          ),
                          Visibility(
                            maintainSize: false,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: _visible,
                            child: Column(
                              children: <Widget>[
                                fullNameWidget(height, width),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0)),
                                emailWidget(height, width),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0)),
                                passwordWidget(height, width),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0)),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: countryCodePiker(width),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: numberWidget(height, width),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: nextButtonWidget(height, width),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            maintainSize: false,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: !_visible,
                            child: Column(
                              children: <Widget>[
//                                Observer(
//                                  builder: (_) =>
//                                      store.userLoginAs != UserType.VISITOR
//                                          ? companyName(height, width)
//                                          : Container(),
//                                ),
                                companyName(height, width),
                                SizedBox(
                                  height: 15,
                                ),
                                addressWidget(height, width),
                                SizedBox(
                                  height: 15,
                                ),
                                country(height, width),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    showGenderToggle(),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        checkBox(),
                                        Text(
                                          'I accept all terms and conditions',
                                          style: TextStyle(color: Colors.black),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                            //  flex : 1,
                                            child: previousButtonWidget(
                                                height, width)),
                                        Expanded(
                                            // flex : 2,
                                            child: nextButtonNewWidget(
                                                height, width)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  Expanded(flex: 1, child: bottomBarTextCopyright()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  fullNameWidget(height, width) {
    return Container(
      height: height40,
      width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        onChanged: (value) => store.name = value,
        //controller: passController,
        focusNode: fullNameFocusNode,
        onFieldSubmitted: (term) {
          fieldFocusChange(context, fullNameFocusNode, emailFocusNode);
        },
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Full Name',
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.person,
              size: prefixIconSize,
              color: Colors.white,
            ),
          ),
          // suffixIcon: store.error.fullName == null
          //     ? (store.userNameValid
          //         ? Icon(
          //             Icons.check,
          //             size: prefixIconSize,
          //             color: Colors.green,
          //           )
          //         : Icon(Icons.clear,
          //             size: prefixIconSize, color: Colors.red))
          //     : Container(
          //         width: 0,
          //       ),
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

  emailWidget(height, width) {
    return Container(
      height: height40,
      width: width,
      child: Observer(
        builder: (_) => TextFormField(
          style: TextStyle(fontSize: 12),
          onChanged: (value) {
            store.email = value;
            store.isLoadingEmail = LoadingState.loading;
            if (store.error.email == null) {
              store.verifyUserEmail(context).then((value) {
                store.isLoadingEmail = LoadingState.none;
                if (value.error == "false")
                  store.emailValid = true;
                else
                  store.emailValid = false;
              });
            }
          },
          focusNode: emailFocusNode,
          onFieldSubmitted: (term) {
            print("$term");
            fieldFocusChange(context, emailFocusNode, passwordFocusNode);
          },
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.black),
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
              decoration:
                  BoxDecoration(color: colorMain, shape: BoxShape.circle),
              child: Icon(
                Icons.alternate_email,
                size: prefixIconSize,
                color: Colors.white,
              ),
            ),
            suffixIcon: store.error.email == null
                ? (store.isLoadingEmail == LoadingState.loading
                    ? Container(
                        padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                        child: SizedBox(
                          height: 2,
                          width: 2,
                          child: CircularProgressIndicator(
                            strokeWidth: 0.9,
                          ),
                        ),
                      )
                    : store.emailValid
                        ? Icon(
                            Icons.check,
                            size: prefixIconSize,
                            color: Colors.green,
                          )
                        : Icon(Icons.clear,
                            size: prefixIconSize, color: Colors.red))
                : Container(
                    width: 0,
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

  passwordWidget(height, width) {
    return Container(
      height: height40,
      width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        //controller: passController,
        focusNode: passwordFocusNode,
        obscureText: !passwordVisible,
        onChanged: (value) => store.password = value,
        onFieldSubmitted: (term) {
          fieldFocusChange(context, passwordFocusNode, numberFocusNode);
        },
        keyboardType: TextInputType.visiblePassword,
        // obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.black),
          suffixIcon: IconButton(
            icon: Icon(
                // Based on passwordVisible state choose the icon
                passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: colorMain),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.lock,
              size: prefixIconSize,
              color: Colors.white,
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

  numberWidget(height, width) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
      child: Container(
        height: height40,
        child: Observer(
          builder: (_) => TextFormField(
            style: TextStyle(fontSize: 12),
            //controller: passController,
            focusNode: numberFocusNode,
            onChanged: (value) {
              store.mobileNumber = value;
              store.isLoadingMobile = LoadingState.loading;
              if (store.error.mobileNumber == null) {
                store.verifyMobileNumber(context).then((value) {
                  store.isLoadingMobile = LoadingState.none;
                  if (value.error == "false")
                    store.mobileNumberValid = true;
                  else
                    store.mobileNumberValid = false;
                });
              }
            },
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Number',
              hintStyle: TextStyle(color: Colors.black),
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
              suffixIcon: store.error.mobileNumber == null
                  ? (store.isLoadingMobile == LoadingState.loading
                      ? Container(
                          padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                          child: SizedBox(
                            height: 2,
                            width: 2,
                            child: CircularProgressIndicator(
                              strokeWidth: 0.9,
                            ),
                          ),
                        )
                      : store.mobileNumberValid
                          ? Icon(
                              Icons.check,
                              size: prefixIconSize,
                              color: Colors.green,
                            )
                          : Icon(Icons.clear,
                              size: prefixIconSize, color: Colors.red))
                  : Container(
                      width: 0,
                      height: 0,
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
      ),
    );
  }

  countryCodePiker(width) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
        child: InkWell(
          onTap: () {
            if (store.isMobileCodeLoaded)
              showCountryCodePickerDialog(context, _countryCodeModel);
          },
          child: Container(
            height: height40,
            width: width,
            child: TextField(
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabled: false,
                  hintText: store?.countryCodeAndFlag?.code != null
                      ? store?.countryCodeAndFlag?.code
                      : '+92',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Container(
                      margin: EdgeInsets.fromLTRB(10, 4, 8, 4),
                      child: store?.countryCodeAndFlag?.countryFlag != null
                          ? Image.network(
                              "${store?.countryCodeAndFlag?.countryFlag}",
                              height: 5,
                              width: 5,
                            )
                          : SvgPicture.asset(
                              "assets/svg_flag.svg",
                              height: 20,
                            )),
                  contentPadding: EdgeInsets.all(10.0),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(32.0)),
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
      ),
    );
  }

  companyName(height, width) {
    return InkWell(
      onTap: () {
        showCompanyPickerDialog(context);
      },
      child: Observer(
        builder: (_) => Container(
          height: height40,
          width: width,
          child: TextField(
            style: TextStyle(fontSize: 12),
            //onChanged: (value) => store.company = value,
            decoration: InputDecoration(
                filled: true,
                enabled: false,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.black),
                hintText: store.companyDialogItemValue == null
                    ? 'Company Name'
                    : store.companyDialogItemValue.name,
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
        ),
      ),
    );
  }

  addressWidget(height, width) {
    return InkWell(
      onTap: () {
        // moveToSecondPage();
      },
      child: Container(
        height: height40,
        width: width,
        child: TextField(
          style: TextStyle(fontSize: 12),
          controller: _addressController,
          textInputAction: TextInputAction.done,
          onChanged: (value) => store.address = value,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(color: Colors.black),
              hintText: 'Address',
              prefixIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                decoration:
                    BoxDecoration(color: colorMain, shape: BoxShape.circle),
                child: Icon(
                  Icons.home,
                  size: prefixIconSize,
                  color: Colors.white,
                ),
              ),
              suffixIcon: InkWell(
                onTap: () {
                  moveToSecondPage();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(
                    Icons.map,
                    size: prefixIconSize,
                    color: colorMain,
                  ),
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
      ),
    );
  }

  country(height, width) {
    return InkWell(
      onTap: () {
        showLocationPickerDialog(context, _locationContentModel);
      },
      child: Observer(
        builder: (_) => Container(
          height: height40,
          width: width,
          child: TextField(
            style: TextStyle(fontSize: 12),
            // controller: _countryController,
            onChanged: (value) => store.location = value,
            decoration: InputDecoration(
                filled: true,
                enabled: false,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.black),
                hintText: store.location.isEmpty ? 'Location' : store.location,
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
//    return Container(
//      height: height40,
//      width: width,
//      child: Padding(
//        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//        child: TextField(
//          controller:_countryController,
//          decoration: InputDecoration(
//            hintText: 'Country',
//            prefixIcon: Icon(
//              Icons.flag,
//              color: colorMain,
//            ),
//            contentPadding: EdgeInsets.all(10.0),
//            labelStyle:
//            TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
//            focusedBorder: OutlineInputBorder(
//                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
//                borderSide: BorderSide(color: colorMain, width: 2.0)),
//            enabledBorder: OutlineInputBorder(
//              borderRadius: BorderRadius.all(Radius.circular(32.0)),
//              borderSide: BorderSide(color: colorMain, width: 2.0),
//            ),
//          ),
//        ),
//      ),
//    );
  }

  city(height, width) {
    return Container(
      height: height40,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 5.0),
        child: TextField(
          controller: _cityController,
          decoration: InputDecoration(
              enabled: false,
              hintText: 'City',
              prefixIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                decoration:
                    BoxDecoration(color: colorMain, shape: BoxShape.circle),
                child: Icon(
                  Icons.location_city,
                  size: prefixIconSize,
                  color: Colors.white,
                ),
              ),
              contentPadding: EdgeInsets.all(0.0),
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 2.0)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 2.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 2.0),
              )),
        ),
      ),
    );
  }

  location(height, width) {
    return Container(
      height: height40,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: TextField(
          //controller: passController,
          decoration: InputDecoration(
            hintText: 'Location',
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
            contentPadding: EdgeInsets.all(0.0),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 2.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }

  postalCode(height, width) {
    return Container(
      height: height40,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 15.0),
        child: TextFormField(
          controller: _postalCodeController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: 'Postal Code',
              prefixIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                decoration:
                    BoxDecoration(color: colorMain, shape: BoxShape.circle),
                child: Icon(
                  Icons.add,
                  size: prefixIconSize,
                  color: Colors.white,
                ),
              ),
              contentPadding: EdgeInsets.all(10.0),
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 2.0)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 2.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 2.0),
              )),
        ),
      ),
    );
  }

  checkBox() {
    return Observer(
      builder: (_) => Checkbox(
          activeColor: colorMain,
          value: store.acceptTerms,
          onChanged: (value) => store.acceptTerms = value),
    );
  }

  previousButtonWidget(heightButton, width) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 2.0),
      child: Container(
        //margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
        height: height40,
        // width: width,
        child: RaisedButton(
          onPressed: _toggle,
          color: colorMain,
          disabledColor: colorMain,
          textColor: Colors.white,
          disabledTextColor: Colors.white,
          padding: EdgeInsets.all(0.0),
          child: Stack(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  'PREV',
                  style: TextStyle(fontSize: buttonFontSize),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                //  padding: const EdgeInsets.symmetric(horizontal: 0),
                margin: EdgeInsets.all(4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_back,
                        size: prefixIconSize,
                        color: colorMain,
                      )),
                ),
              ),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }

  nextButtonNewWidget(heightButton, width) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 2.0),
      child: Observer(
        builder: (_) => Container(
          height: height40,
          // width: width,
          child: RaisedButton(
            onPressed: store.validateSecondViewData() ? null : callSignUpApi,
            color: colorMain,
            disabledColor: disabledButtonColor,
            textColor: Colors.white,
            disabledTextColor: Colors.white,
            padding: EdgeInsets.all(0.0),
            child: Stack(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(fontSize: buttonFontSize),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  //  padding: const EdgeInsets.symmetric(horizontal: 0),
                  margin: EdgeInsets.all(4),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Icon(
                          Icons.arrow_forward,
                          size: prefixIconSize,
                          color: colorMain,
                        )),
                  ),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
      ),
    );
  }

  callSignUpApi() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return VerificationCode();
    }));
  }

  void moveToSecondPage() async {
    var information = await Navigator.push(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true, builder: (context) => LocationPicker()),
    );
    print(information);
    updateInformation(information);
  }

  showGenderToggle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(
        alignment: Alignment.center,
        height: height40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: ToggleButtons(
          borderWidth: 1,
          borderRadius: BorderRadius.circular(20),
          borderColor: colorMain,
          color: colorMain,
          selectedBorderColor: colorMain,
          selectedColor: colorMain,
          fillColor: colorMain,
          highlightColor: colorMain,
          disabledBorderColor: colorLoadingBlue,
          disabledColor: colorDivider,
          children: <Widget>[
            Container(
              width: (MediaQuery.of(context).size.width / 2) - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Male',
                      style: TextStyle(
                        fontSize: 12,
                        color:
                            _selection[0] == true ? Colors.white : Colors.black,
                      )),
                ],
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width / 2) - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Female',
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          _selection[1] == true ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
          onPressed: (int index) {
            setState(() {
              for (int buttonIndex = 0;
                  buttonIndex < _selection.length;
                  buttonIndex++) {
                if (buttonIndex == index) {
                  _selection[buttonIndex] = true;
                } else {
                  _selection[buttonIndex] = false;
                }
                if (index == 0) {
                  print(index);
                  store.isMale = true;
                } else
                  print(index);
                store.isMale = false;
              }
            });
          },
          isSelected: _selection,
        ),
      ),
    );
  }

  nextButtonWidget(height, width) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Observer(
        builder: (_) => Container(
          height: height40,
          // width: width,
          child: RaisedButton(
            onPressed:
                store.validateFirstViewData() ? null : validateNextButton,
            padding: EdgeInsets.all(0),
            color: colorMain,
            disabledColor: disabledButtonColor,
            textColor: Colors.white,
            disabledTextColor: Colors.white,
            child: Stack(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                        fontSize: buttonFontSize, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 0),
                  // margin: EdgeInsets.fromLTRB(8, 5, 0, 5),
                  margin: EdgeInsets.all(4),
                  //   margin: EdgeInsets.all(0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        padding: EdgeInsets.all(5),
                        //  margin: EdgeInsets.fromLTRB(8, 5, 0, 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          size: prefixIconSize,
                          color: colorMain,
                        )),
                  ),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
      ),
    );
  }

  validateNextButton() {
    store.validateName(store.name);
    if (store.error.fullName != null) {
      showToast(store.error.fullName, true);
      return;
    }
    store.validateEmail(store.email);
    if (store.error.email != null) {
      showToast(store.error.email, true);
      return;
    }
    if (!store.emailValid) {
      showToast("Email Already Exist", true);
      return;
    }
    store.validateNumber(store.mobileNumber);
    if (store.error.mobileNumber != null) {
      showToast(store.error.mobileNumber, true);
      return;
    }
    if (!store.mobileNumberValid) {
      showToast("Mobile Number Already Exist", true);
      return;
    }
    _toggle();
  }

  void checkUserEmail() {
    store.verifyUserEmail(context).then((response) {
      if (response.error == "false") {
        store.validateNumber(store.mobileNumber);
        if (store.error.mobileNumber != null) {
          showToast(store.error.mobileNumber, true);
          return;
        }
        checkPhoneNumber();
      } else {
        showToast(response.message, true);
      }
    });
  }

  void checkPhoneNumber() {
    store.verifyMobileNumber(context).then((response) {
      if (response.error == "false") {
        getLocationBenchMarks();
      } else {
        showToast(response.message, true);
      }
    });
  }

  void getLocationBenchMarks() {
    store.getBenchmarkLocation(context).then((value) {
      _locationContentModel = value;
      store.getCompanies(context);
    });
  }

  showLocationPickerDialog(context, locationContentModel) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return ListSearch(
          locationContentModel: locationContentModel,
          signUpStore: store,
        );
      },
    );
  }

  void _getCountryCodes() {
    store.getCountryCodes(context).then((value) {
      _countryCodeModel = value;
      store.isMobileCodeLoaded = true;
      getLocationBenchMarks();
    });
  }

  showCountryCodePickerDialog(context, countryCodeModel) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CountrySearch(
          countryCodeModel: countryCodeModel,
          signUpStore: store,
        );
      },
    );
  }

  showCompanyPickerDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CompanySearch(
          companyDialog: store.companyDialog,
          signUpStore: store,
        );
      },
    );
  }

  void _getUserLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placeMark = placemark[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String country = placeMark.country;
    String address =
        "$name, $subLocality, $locality, $administrativeArea $postalCode, $country";
    print(address);
    setState(() {
      Constant.curentLoc = LatLng(position.latitude, position.longitude);
      print('${placemark[0].name}');
    });
  }
}
