import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/smart_search/rounded_image_clipper.dart';
import 'package:flutterapp/utills/config.dart';

class SearchCdlSchoolsScreen extends StatefulWidget {
  SearchCdlSchoolsScreen({this.userImage});
  final userImage;
  @override
  _SearchCdlSchoolsScreenState createState() => _SearchCdlSchoolsScreenState();
}

class _SearchCdlSchoolsScreenState extends State<SearchCdlSchoolsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            RoundedImageWidget(
              screenHeight: screenHeight,
              image: 'assets/bg1.png',
              appBarLabel: 'CDL School',
              imageUrl: widget.userImage,
              pageLogoImage: 'assets/cdl_service.svg',
              pageTitle: 'Search CDL Schools',
              pageDesc: 'Find Truck Driving Schools in Your Area',
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.11, right: 15, left: 15),
              child: brokerWidget(screenHeight / 15, screenWidth),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: brokerWidget(screenHeight / 15, screenWidth),
            ),
            SizedBox(height: screenHeight * 0.03),
            widgetSearchBrokersButton(screenHeight / 15, screenWidth),
            SizedBox(height: screenWidth * 0.23),
            bottomBarTextCopyright()
          ],
        ),
      ),
    );
  }

  widgetSearchBrokersButton(heightButton, width) {
    return Observer(
      builder: (_) => Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        padding: EdgeInsets.all(0.0),
        height: height40,
        width: width,
        child: RaisedButton(
          padding: EdgeInsets.all(0),
          onPressed: () {},
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => VerifyCodeScreen(),
          //     ),
          //   );
          // },
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
                  'Search CDL Schools',
                  style: TextStyle(
                      fontSize: buttonFontSize, fontWeight: FontWeight.bold),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }

  SizedBox widgeSearchProjectButton(double width) {
    return SizedBox(
      width: width * 0.92,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        borderSide: BorderSide(color: Colors.white, width: 1),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: width * 0.9),
          borderRadius: new BorderRadius.circular(30.0),
        ),
        child: Text('Search CDL School',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600)),
      ),
    );
  }

  brokerWidget(height, width) {
    return Container(
      height: height40,
      width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        //controller: passController,
        keyboardType: TextInputType.visiblePassword,
        // obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Keywords, School name',
          hintStyle: TextStyle(color: Colors.black),
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

  locationWidget(height, width) {
    return Container(
      height: height40,
      width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        //controller: passController,
        keyboardType: TextInputType.visiblePassword,
        // obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Location, city, province, country',
          hintStyle: TextStyle(color: Colors.black),
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
}
