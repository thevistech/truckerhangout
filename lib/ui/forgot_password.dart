import 'dart:ui';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/country_code_model.dart';
import 'package:flutterapp/stores/forget_password_store.dart';
import 'package:flutterapp/stores/sign_in_store.dart';
import 'package:flutterapp/ui/SignIn.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/ui/verification_code.dart';
import 'package:flutterapp/ui/signup/country_drop_down.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../utills/config.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  FocusNode emailFocus = FocusNode();
  final numberController = TextEditingController();
  final store = ForgetPasswordStore();
  CountryCodeModel _countryCodeModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.setupValidations();
    store.getCountryCodes(context).then((value) {
      store.isMobileCodeLoaded = true;
      _countryCodeModel = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 1.1;
    double height = MediaQuery.of(context).size.height / 15;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: SizedBox(
            height: height * 15,
            child: Column(
              children: <Widget>[
                Expanded(child: Container()),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.lock,
                                color: colorMain,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "FORGOT PASSWORD ?",
                                style: TextStyle(
                                    fontSize: headingFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          Text(
                            "Enter your registered email address or number to receive password reset instruction",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: subHeadingFontSize),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 25, 0, 20),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: countryCodePiker(width),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.0)),
                                Expanded(
                                  flex: 2,
                                  child: numberWidget(height, width),
                                )
                              ],
                            ),
                          ),
                          nextButtonWidget(height, width),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Back to sign in",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    )),
                Expanded(child: bottomBarTextCopyright()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* countryCodePickerWidget(height, width) {
    return Container(
      height: height40,
      //width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: colorMain, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(32))),
      child: CountryCodePicker(
        onChanged: _onCountryChange,
        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
        initialSelection: 'PK',
        favorite: ['+92', 'PK'],
        // optional. Shows only country name and flag
        showCountryOnly: false,
        // optional. Shows only country name and flag when popup is closed.
        showOnlyCountryWhenClosed: false,
        // optional. aligns the flag and the Text left
        alignLeft: false,
      ),
    );
  } */

  countryCodePiker(width) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
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
              onChanged: (value) {
                _onCountryChange(store?.countryCodeAndFlag?.code.toString());
              },
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

  showCountryCodePickerDialog(context, countryCodeModel) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CountrySearch(
          countryCodeModel: countryCodeModel, forgetPasswordStore: store,
          isSignUp: false,
          //  signUpStore: store,
        );
      },
    );
  }

  numberWidget(height, width) {
    return Container(
      height: height40,
      //width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        controller: numberController,
        onChanged: (value) => store.number = value,
        // focusNode: numberFocusNode,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Number',
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.phone,
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

  emailWidget(height, width) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
      height: height40,
      width: width,
      child: TextField(
        focusNode: emailFocus,
        textInputAction: TextInputAction.next,
        onChanged: (value) => store.email = value,

        //controller: passController,
        decoration: InputDecoration(
          hintText: 'Email',
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.alternate_email,
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
        ),
      ),
    );
  }

  nextButtonWidget(height, width) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
      height: height40,
      width: width,
      child: RaisedButton(
        onPressed: () {
          store.validateNumber(store.number);
          if (store.error.number != null) {
            showToast(store.error.number, true);
            return;
          }
          store.userforgetPassword(context).then((response) {
            if (response.error == "false")
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      VerificationCode(mobileNumber: store.number)));
            else
              showToast(response.message, true);
          });
        },
        color: colorMain,
        disabledColor: colorMain,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              ' SEND NOW',
              style: TextStyle(
                  fontSize: buttonFontSize, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

  void _onCountryChange(countryCode) {
    //TODO : manipulate the selected country code here
    store.code = countryCode.toString().replaceAll('+', '');
    print("New Country selected: " + store.code);
  }
}
