import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:shimmer/shimmer.dart';

shimmerFollow() {
  return Shimmer.fromColors(
    baseColor: colorDivider,
    highlightColor: colorGrey[100],
    child: Container(
      height: 180,
      child: ListView.builder(
        itemBuilder: (ctx, i) {
          return makeFollowSuggestionWidget();
        },
        itemCount: 6,
        scrollDirection: Axis.horizontal,
      ),
    ),
  );
}

Widget makeFollowSuggestionWidget() {
  return AspectRatio(
    aspectRatio: 1.6 / 2,
    child: Container(
      margin: EdgeInsets.only(right: 10, left: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.3),
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 10.0, top: 5.0),
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.clear,
                size: 18,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 4,
              width: 50,
              color: Colors.black,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 4,
              width: 80,
              color: Colors.black,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 20,
              width: 80,
              color: Colors.black,
            )
          ],
        ),
      ),
    ),
  );
}
