import 'package:flutter/material.dart';
import '../utills/config.dart';
import 'package:shimmer/shimmer.dart';

shimmerSimpleListView(context) {
  return Positioned.fill(
    child: Shimmer.fromColors(
      baseColor: colorDivider,
      highlightColor: colorGrey[100],
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 12,
          itemBuilder: (ctx, int) {
            return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 55,
                          width: 55,
                          decoration: new BoxDecoration(
                            color: colorDivider,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10.0)),
                        Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  color: colorDivider,
                                  height: 10,
                                ),
                                Padding(padding: EdgeInsets.only(top: 5)),
                                Container(
                                  color: colorDivider,
                                  width: MediaQuery.of(context).size.width / 4,
                                  height: 5,
                                ),
                              ],
                            ))
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Divider(
                      color: colorDivider,
                      height: 2,
                    )
                  ],
                ));
          }),
    ),
  );
}
