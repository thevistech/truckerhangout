import 'dart:math';
import 'package:flutter/material.dart';

class FlippableBox extends StatelessWidget {
  final Container front;
  final Container back;

  final bool isFlipped;

  const FlippableBox({
    Key key,
    this.isFlipped = false,
    this.front,
    this.back,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 900),
      curve: Curves.easeOut,
      tween: Tween(begin: 0.0, end: isFlipped ? 180.0 : 0.0),
      builder: (context, value, child) {
        var content = value >= 90 ? back : front;
        return RotationY(
          rotationY: value,
          child: RotationY(
              rotationY: value > 90 ? 180 : 0,
              child: AnimatedBackground(child: content)),
        );
      },
    );
  }
}

class RotationY extends StatelessWidget {
  //Degrees to rads constant
  static const double degrees2Radians = pi / 180;

  final Widget child;
  final double rotationY;

  const RotationY({Key key, @required this.child, this.rotationY = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) //These are magic numbers, just use them :)
          ..rotateY(rotationY * degrees2Radians),
        child: child);
  }
}

class AnimatedBackground extends StatelessWidget {
  final Container child;
  const AnimatedBackground({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        width: child.constraints.maxWidth,
        height: child.constraints.maxHeight,
        duration: Duration(milliseconds: 900),
        curve: Curves.easeOut,
        child: child);
  }
}
