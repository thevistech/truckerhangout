import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:shimmer/shimmer.dart';

List<String> imgList = [
  'https://dp5zphk8udxg9.cloudfront.net/wp-content/uploads/2016/07/shutterstock_262923179-e1500871070126.jpg',
  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/amazon-rivet-furniture-1533048038.jpg'
];

shimmerAdvertisement() {
  return Shimmer.fromColors(
    baseColor: colorDivider,
    highlightColor: colorGrey[100],
    child: Container(height: 190, child: makeAdvertisement()),
  );
}

Widget makeAdvertisement() {
  return CarouselSlider(
    height: 190,
    enlargeCenterPage: true,
    viewportFraction: 0.9,
    aspectRatio: 2.0,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 3),
    autoPlayAnimationDuration: Duration(milliseconds: 800),
    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
    items: imgList.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
                child: Stack(children: <Widget>[
                  Image.network(
                    i,
                    fit: BoxFit.fill,
                    width: 1000.0,
                  ),
                ])),
          );
        },
      );
    }).toList(),
  );
}
