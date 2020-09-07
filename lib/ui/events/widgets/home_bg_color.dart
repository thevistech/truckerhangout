import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';

class HomeBackgroundColor extends AnimatedWidget {
  final Animation<double> opacity;
  HomeBackgroundColor(this.opacity) : super(listenable: opacity);

  Animation<double> get progress => listenable;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              height: (MediaQuery.of(context).size.height / 3.5) ,
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorMain.withOpacity(lerpDouble(0.4, 1,1)),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(1)),
              ),
            ),
          ),
//          Positioned(
//            top: -80,
//            right: -10,
//            child: Container(
//              width: 150,
//              height: 150,
//              decoration: ShapeDecoration(shape: CircleBorder(), color: lime),
//            ),
//          ),

        ],
      ),
    );
  }
}
