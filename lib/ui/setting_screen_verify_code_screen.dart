import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';

class VerifyCodeScreen extends StatefulWidget {
  VerifyCodeScreen({Key key}) : super(key: key);

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  @override
  Widget build(BuildContext context) {
    String number = '+923457777444';
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        title: Text('Verification',
            style: TextStyle(color: Colors.white, fontSize: 16)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
          ),
          SizedBox(
            width: 12,
          ),
          Icon(Icons.account_circle),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Container(
        color: colorMain,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image.asset('assets/gps_PNG8.png'),
            SizedBox(height: height * 0.08),
            Text(
              'Verification Code',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            SizedBox(height: height * 0.02),
            Text(
              'please type the vetification code send to',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '$number',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: height * 0.07),
            codeWidget(height, width / 1.05),
            resendCodeText(),
            SizedBox(height: height * 0.021),
            widgetVerifyButton(width),
            SizedBox(height: height * 0.08),
            bottomBarTextCopyrightWhite()
          ],
        ),
      ),
    );
  }

  bottomBarTextCopyrightWhite() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          RichText(
            text: new TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: new TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
              children: <TextSpan>[
                new TextSpan(
                    text: 'Copyright © 2020 ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                new TextSpan(
                    text: 'Brokers Circle',
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Text(
            "www.brokerscircle.net",
            style: TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          Padding(padding: EdgeInsets.all(5.0))
        ],
      ),
    );
  }

  Row resendCodeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Did not get code?',
          style: TextStyle(color: Colors.white),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            ' Resent Code',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
      ],
    );
  }

  SizedBox widgetVerifyButton(double width) {
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
        child: Text('Verify',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600)),
      ),
    );
  }

  codeWidget(height, width) {
    return Container(
      height: 62,
      width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        //controller: passController,

        keyboardType: TextInputType.number,
        maxLength: 6,
        // obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Code',
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(2, 4, 8, 4),
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
              borderSide: BorderSide(color: Colors.transparent, width: 2.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.transparent, width: 2.0),
          ),
        ),
      ),
    );
  }
}
