import 'package:flutter/material.dart';
import '../utills/config.dart';
import 'package:shimmer/shimmer.dart';

shimmerProfileList() {
  return Shimmer.fromColors(
    baseColor: colorDivider,
      highlightColor: colorGrey[100],
    child: Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return BrokerAvatarShimmer();
        },
        itemCount: 12,
      ),
    ),
  );
}

class BrokerAvatarShimmer extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const BrokerAvatarShimmer({
    this.padding = const EdgeInsets.symmetric(vertical: 5.0),
  });

  static const _gradientBorderDecoration = BoxDecoration(
    shape: BoxShape.circle,
    // https://brandpalettes.com/instagram-color-codes/
    gradient: SweepGradient(
      colors: [
        Color(0xFF29326D), // Purple
        Color(0xFFF77737), // Orange
        Color(0xFFE1306C), // Red-pink
        Color(0xFFC13584), // Red-purple
      ],
    ),
  );
  static const _whiteBorderDecoration = BoxDecoration(
    shape: BoxShape.circle,
    border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 3.0)),
  );
  static const _greyBoxShadowDecoration = BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(color: Colors.grey, blurRadius: 1.0, spreadRadius: 1.0)
    ],
  );

  @override
  Widget build(BuildContext context) {
    final radius = 28.0;
    final avatar = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: radius * 2 + 9.0,
          width: radius * 2 + 9.0,
          decoration: _gradientBorderDecoration,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: _whiteBorderDecoration,
                child: Container(
                  decoration: _greyBoxShadowDecoration,
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: new BoxDecoration(
                      color: colorDivider,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              // Bottom right circular add icon
              Positioned(
                right: 5.0,
                bottom: 2.0,
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    border: Border.all(color: Colors.white),
                  ),
                ),
              ),
            ],
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
      ],
    );

    return Padding(
      padding: this.padding,
      child: GestureDetector(child: avatar),
    );
  }
}
