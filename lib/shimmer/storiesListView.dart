import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:shimmer/shimmer.dart';

shimmerStory() {
  return Shimmer.fromColors(
    baseColor: colorDivider,
    highlightColor: colorGrey[100],
    child: Container(
      height: 180,
      child: ListView.builder(
        itemBuilder: (ctx, i) {
          return makeStory();
        },
        itemCount: 6,
        scrollDirection: Axis.horizontal,
      ),
    ),
  );
}

Widget makeStory() {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
            Text(
              "",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    ),
  );
}
