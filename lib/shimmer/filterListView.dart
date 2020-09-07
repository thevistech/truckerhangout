import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:shimmer/shimmer.dart';

shimmerFilterListView(context) {
  return Shimmer.fromColors(
 baseColor: colorDivider,
      highlightColor: colorGrey[100],
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: 27,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.white,
                    border: Border.all(width: 1, color: colorMain)),
                padding: EdgeInsets.all(2.0),
                alignment: Alignment.center,
                child: Text(
                  "",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.white,
                    border: Border.all(width: 1, color: colorMain)),
                padding: EdgeInsets.all(2.0),
                alignment: Alignment.center,
                child: Text(
                  "",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.white,
                    border: Border.all(width: 1, color: colorMain)),
                padding: EdgeInsets.all(2.0),
                alignment: Alignment.center,
                child: Text(
                  "",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.white,
                    border: Border.all(width: 1, color: colorMain)),
                padding: EdgeInsets.all(2.0),
                alignment: Alignment.center,
                child: Text(
                  "",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
