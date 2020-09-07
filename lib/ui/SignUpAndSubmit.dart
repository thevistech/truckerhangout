import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutterapp/utills/config.dart';

class SignUpAndSubmit extends StatefulWidget {
  @override
  _SignUpAndSubmitState createState() => _SignUpAndSubmitState();
}

class _SignUpAndSubmitState extends State<SignUpAndSubmit> {
  @override
  int counter = 0;
  bool checkBoxValue = false;

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height / 15;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signUpAndSubmitWidget(),
    );
  }

  signUpAndSubmitWidget() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height / 15;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height * 15,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.insert_drive_file),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'SIGN UP & SUBMIT',
                          style: TextStyle(
                              fontSize: headingFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        // Image.asset('assets/signupandsubmit.png')
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'You Are Almost There',
                      style: TextStyle(
                        fontSize: subHeadingFontSize,
                      ),
                    ),
                    // Image.asset('assets/youarealmost.png')
                  ],
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Column(
                    children: <Widget>[
                      addressWidget(height, width),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              //  flex : 1,
                              child: countryCodePickerWidget(height, width)),
                          Expanded(
                            // flex : 2,
                            child: city(height, width),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  //  flex : 1,
                                  child: location(height, width)),
                              Expanded(
                                // flex : 2,
                                child: postalCode(height, width),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              checkBox(),
                              Text('I accept all terms and conditions')
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  //  flex : 1,
                                  child: previousButtonWidget(height, width)),
                              Expanded(
                                  // flex : 2,
                                  child: nextButtonWidget(height, width)),
                            ],
                          ),
                        ],
                      ),
                      Expanded(flex: 2, child: bottomBarTextCopyright()),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  addressWidget(height, width) {
    return Container(
      height: height40,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          //controller: passController,
          decoration: InputDecoration(
            hintText: 'Address',
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

  country(height, width) {
    return Container(
      height: height40,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: TextField(
          //controller: passController,
          decoration: InputDecoration(
            hintText: 'Country',
            prefixIcon: Icon(
              Icons.flag,
              color: colorMain,
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
      ),
    );
  }

  city(height, width) {
    return Container(
      height: height40,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 15.0),
        child: TextField(
          //controller: passController,
          decoration: InputDecoration(
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
          ),
        ),
      ),
    );
  }

  location(height, width) {
    return Container(
      height: height40,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 0.0),
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
        padding: const EdgeInsets.only(left: 10.0, right: 15.0),
        child: TextField(
          //controller: passController,
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
          ),
        ),
      ),
    );
  }

  countryCodePickerWidget(height, width) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 0.0),
      child: Container(
        height: height40,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0),
          border: Border.all(
              color: colorMain, style: BorderStyle.solid, width: 2.0),
        ),
        child: CountryCodePicker(
          onChanged: _onCountryChange,
          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
          initialSelection: 'PK',
          favorite: ['+92', 'PK'],
          // optional. Shows only country name and flag
          showCountryOnly: true,
          // optional. Shows only country name and flag when popup is closed.
          showOnlyCountryWhenClosed: true,
          // optional. aligns the flag and the Text left
          alignLeft: true,
        ),
      ),
    );
  }

  void _onCountryChange(CountryCode countryCode) {
    //TODO : manipulate the selected country code here
    print("New Country selected: " + countryCode.toString());
  }

  checkBox() {
    return Checkbox(
      activeColor: colorMain,
      value: checkBoxValue,
      onChanged: (bool value) {
        setState(() {
          checkBoxValue = value;
        });
      },
    );
  }

  previousButtonWidget(heightButton, width) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
      padding: EdgeInsets.all(0.0),
      height: height40,
      width: width,
      child: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
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
    );
  }

  nextButtonWidget(heightButton, width) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
      padding: EdgeInsets.all(0.0),
      height: height40,
      width: width,
      child: RaisedButton(
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return SignUpAndSubmit();
          // }));
        },
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
                    )
                ),
              ),
            ),
          ],
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }
}
