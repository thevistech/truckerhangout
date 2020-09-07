import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:shimmer/shimmer.dart';

shimmerLocation() {
  return Shimmer.fromColors(
    baseColor: colorDivider,
    highlightColor: colorGrey[100],
    child: Container(
      height: 360,
      margin: EdgeInsets.only(top: 0, bottom: 10),
      child: GridView.count(
        physics: new NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        children: List.generate(6, (index) {
          return makeLocationGrid(index);
        }),
      ),
    ),
  );
}

makeLocationGrid(index) {
  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
    margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
    child: InkWell(
      onTap: () {},
      child: Container(
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.black,
                )),
          ],
        ),
      ),
    ),
  );
}
