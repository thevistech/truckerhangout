import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/ui/SignIn.dart';
import 'package:flutterapp/ui/SignUpAndSubmit.dart';
import 'package:flutterapp/ui/signup/sign_up.dart';
import 'package:flutterapp/utills/config.dart';

class SignInOrSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height / 15;

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg_image.png'),
                  colorFilter: new ColorFilter.mode(
                      Colors.white.withOpacity(0.3), BlendMode.dstOver),
                  fit: BoxFit.fill)),
      child: SizedBox(
        height: height * 15,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 10,
                child: Container(
                  //  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset(
                          'assets/trucker_logo.png',
                        ),
                      ),
                      // Image.asset('assets/logoblackshade.png'),
                      // Image.asset('assets/brokershub.png')
                    ],
                  ),
                )),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22.0, 0.0, 26.0, 0.0),
                    child: new Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //  Padding(padding: EdgeInsets.only(left: 20)),
                          new Text(
                            "Already have an account",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.black),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          new Text("Don't have an account",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.black))
                        ]),
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 140,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignIn();
                              }));
                            },
                            color: colorMain,
                            textColor: Colors.white,
                            child: Text("Sign In".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        new Text(
                          "or",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 140,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignUpNew();
                              }));
                            },
                            color: colorMain,
                            textColor: Colors.white,
                            child: Text("Sign Up".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ]),
                  /* Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 20.0, right: 20.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: colorMain)),
                        onPressed: () {},
                        color: Colors.white,
                        textColor: colorMain,
                        child: Text("Continue Without login".toUpperCase(),
                            style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ), */
                ],
              ),
            ),
            Expanded(flex: 2, child: bottomBarTextCopyright()),
          ],
        ),
      ),
    ));
  }
}
