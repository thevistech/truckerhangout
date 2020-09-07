import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:lottie/lottie.dart';

class ComingSoonScreen extends StatefulWidget {
  @override
  _ComingSoonScreenState createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

//      appBar: AppBar(
//      backgroundColor: colorMain,
//      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset('assets/commingsoon.json'),
        ],
      ),
    );
  }
}

