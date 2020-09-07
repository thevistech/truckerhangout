import 'package:flutter/material.dart';
import 'package:flutterapp/ui/dashboard.dart';
import 'package:flutterapp/ui/dashboard_main.dart';
import 'package:flutterapp/ui/signup/sign_up.dart';
import 'package:flutterapp/utills/config.dart';

class ThankyouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width / 1.1;
    double height = MediaQuery.of(context).size.height / 15;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
              //  Image.asset('assets/cloud.png')
              ],
            ),
          ),
          Expanded(
            flex: 7,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('THANK YOU', style: TextStyle(fontSize: headingFontSize, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5,),
                    Text('Your submission has been recieved', style: TextStyle(fontSize: subHeadingFontSize, color: Colors.black),
                    ),
                    Image.asset('assets/thankyoutick.png'),
                    Image.asset('assets/thankyougroup.png'),
                    SizedBox(height: 10,),
                    backToMainScreen(height, width, context),
                  ],
                ),
              )
          ),
          Expanded(
            flex: 1,
            child: bottomBarTextCopyright(),
          )
        ],
      ),
    );
  }

  backToMainScreen(height, width, context) {
    return Container(
     // margin: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
      height: height40,
      width: width,
      child: RaisedButton(
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) {
          //       return Dasboard();
          //     }));
        },
        color: colorMain,
        disabledColor: colorMain,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Back to main screen'.toUpperCase(),
              style: TextStyle(fontSize: buttonFontSize),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }
}
