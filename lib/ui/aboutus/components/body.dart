import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';
import 'backdrop_rating.dart';
import 'our_team.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // it will provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BackdropAndRating(size: size),
          Padding(
            padding: EdgeInsets.only(
              top: kDefaultPadding,
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding / 2
            ),
            child: Text(
              "Who We Are",
              style: TextStyle(
                  fontSize: 22,
                  color: colorMain,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding,right: kDefaultPadding),
            child: Text(
              about_us,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 13
              ),
            ),
          ),
          CastAndCrew(),
        ],
      ),
    );
  }
}
