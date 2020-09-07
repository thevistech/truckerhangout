import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/utills/config.dart';

class CreateProperty extends StatefulWidget {
  @override
  _CreatePropertyState createState() => _CreatePropertyState();
}

class _CreatePropertyState extends State<CreateProperty> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          topBackgroungImage((height / 2) + 120),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                bottom: PreferredSize(
                    child: Container(
                      color: Colors.white,
                      height: 2.0,
                    ),
                    preferredSize: Size.fromHeight(1.0)),
                title: Text(
                  'List Property',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.arrow_back),
                actions: actionWidgets(context),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              extendBodyBehindAppBar: true,
              body: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  propertyIconWidget(height),
                  textWidgetOne(height),
                  textWidgetTwo(height),
                  buttonWidget(height),
                  bottomBarTextCopyright()
                ],
              )),
        ],
      ),
    );
  }

  propertyIconWidget(height) {
    return Positioned.fill(
        top: height / 5,
        child: Container(
          alignment: Alignment.topCenter,
          child: Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2)),
            child: SvgPicture.asset(
              "assets/property_icon.svg",
              allowDrawingOutsideViewBox: true,
              height: 100,
              color: Colors.white,
            ),
          ),
        ));
  }

  textWidgetOne(height) {
    return Positioned.fill(
      top: height / 2.8,
      child: Text(
        "Add a new property to get started!",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: headingFontSize),
      ),
    );
  }

  textWidgetTwo(height) {
    return Positioned.fill(
      top: height / 2.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55.0),
        child: Text(
          "Add your property to start free marketing your listing",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: buttonFontSize),
        ),
      ),
    );
  }

  buttonWidget(height) {
    return Positioned.fill(
      top: height / 1.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: colorMain, width: 2)),
                  child: SvgPicture.asset(
                    "assets/microphone.svg",
                    allowDrawingOutsideViewBox: true,
                    height: 100,
                    color: colorMain,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Voice Recording",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: buttonFontSize,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: colorMain, width: 2)),
                  child: SvgPicture.asset(
                    "assets/info.svg",
                    allowDrawingOutsideViewBox: true,
                    height: 100,
                    color: colorMain,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Advance Form",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: buttonFontSize,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
