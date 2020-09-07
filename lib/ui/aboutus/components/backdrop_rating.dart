import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/utills/config.dart';


class BackdropAndRating extends StatelessWidget {
  const BackdropAndRating({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      // 40% of our total height
      height: size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.4 - 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/property3.jpg'),
              ),
            ),
          ),
          // Rating Box
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              // it will cover 90% of our total width
              width: size.width * 0.9,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Color(0xFF12153D).withOpacity(0.2),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Center(
                  child: Text(
                    'Broker Circle',
                    style: TextStyle(
                      fontSize: 32,
                      color: colorMain,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Back Button
          SafeArea(child: BackButton()),
        ],
      ),
    );
  }
}
