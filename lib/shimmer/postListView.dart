import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ui/avatar_widget.dart';
import '../utills/config.dart';
import 'package:shimmer/shimmer.dart';

shimmerPost(context) {
  return Shimmer.fromColors(
    baseColor: colorDivider,
    highlightColor: colorGrey[100],
    child: Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (ctx, i) {
          return JobShimmer();
        },
        itemCount: 18,
      ),
    ),
  );
}

class JobShimmer extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const JobShimmer({
    this.padding = const EdgeInsets.symmetric(vertical: 5.0),
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right: 10,top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // User Details
          Container(
            child: Row(
              children: <Widget>[
                Container(
                    height: 45,
                    width: 45,
                  decoration: new BoxDecoration(
                    color: colorDivider,
                    shape: BoxShape.circle,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height:16,
                      width: 100,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),

                        height: 16,
                        width: 100,
                        color: colorDivider,
                      ),

                    ),
                    Container(
                      width: 75,
                      height: 12,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            height: 12,
                            width: 10,
                            color: colorDivider,
                          )),
                    )

                    //if (widget.post.location != null) Text(widget.post.location)
                  ],
                ),

              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),

                  color: colorDivider,
                )),
          ),
          // Photo Carosuel

          //bottomBar(),
          // Action Bar
        ],
      ),
    );

  }
}
