import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterapp/ui/SignIn.dart';
import 'package:flutterapp/ui/SignInOrSignUp.dart';
import 'package:flutterapp/ui/cards_dashboard.dart';
import 'package:flutterapp/ui/dashboard_main.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/intro_slider.dart';
import 'dashboard.dart';

class SplashScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isIntroViewed = false;
  bool isUserLoggedIn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Config.getIntroScreenViewed().then((value) {
      if (value == true)
        isIntroViewed = true;
      else
        isIntroViewed = false;
    });
    Config.getUserName().then((userName) {
      print("$userName");
      if (userName != null) {
        isUserLoggedIn = true;
      }
    });
    Timer(
        Duration(seconds: 2),
        () => isIntroViewed
            ? (isUserLoggedIn
                ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => CardDasboard()))
                : Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => SignInOrSignUp())))
            : Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => IntroSliderSplash())));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 1.1;
    double height = MediaQuery.of(context).size.height / 15;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
//          decoration: BoxDecoration(
//              image: DecorationImage(
//                  image: AssetImage('assets/bgimg.png'),
//                  colorFilter: new ColorFilter.mode(
//                      Colors.white.withOpacity(0.5), BlendMode.dstIn),
//                  fit: BoxFit.fill)),
          child: SizedBox(
            height: height * 15,
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 8,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //  SizedBox(height: 25,),
                          SizedBox(
                            height: 300,
                            width: 300,
                            child: Image.asset(
                              'assets/trucker_logo.png',
                            ),
                          ),

                          // Image.asset('assets/brokershub.png')
                        ],
                      ),
                    )),
                Expanded(flex: 2, child: bottomBarTextCopyright()),
                Expanded(
                    flex: 3,
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('Loading.'),
                              SpinKitThreeBounce(
                                color: Colors.black,
                                size: 18.0,
                                //  controller: AnimationController(vsync: SplashScreen(), duration: const Duration(milliseconds: 1200)),
                              )
                            ])))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
