import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';

class CastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: kDefaultPadding),
      width: 80,
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('assets/property2.jpg',
                ),
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          Text(
            'Muhammad Uzair',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          SizedBox(height: kDefaultPadding / 4),
          Text(
            'CEO',
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(color: kTextLightColor),
          ),
        ],
      ),
    );
  }
}
