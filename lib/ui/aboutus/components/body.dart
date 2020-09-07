import 'package:flutter/cupertino.dart';
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
                bottom: kDefaultPadding / 2),

          ),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultPadding, right: kDefaultPadding),
            child: Text(
              "Who We Are",
              style: TextStyle(
                  fontSize: 22, color: colorMain, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding, right: kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10,),

                Text(
                    about_us,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 13),
                  ),

                SizedBox(height: 10,),
                Text(
                  "What do we do for you?",
                  style: TextStyle(
                      fontSize: 22, color: colorMain, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10,),
                Text(
                  what_we_do,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 10,),
                Text(
                  "Our goal is your goal",
                  style: TextStyle(
                      fontSize: 22, color: colorMain, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10,),
                Text(
                  our_goal,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
