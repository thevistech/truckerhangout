import 'package:flutter/material.dart';
import 'package:flutterapp/models/brokers_dashboard.dart';
import 'package:flutterapp/models/models.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';

class BrokerAvatarWidget extends StatelessWidget {
  final Datum user;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;
  final bool isLarge;
  final bool isCurrentUserStory;
  final DashBoardMainStore store;

  const BrokerAvatarWidget(
      {@required this.user,
      this.onTap,
      this.padding = const EdgeInsets.symmetric(vertical: 5.0),
      this.isLarge = false,
      this.isCurrentUserStory = false,
      this.store});

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
    final radius = isLarge ? 32.0 : 14.0;
    final avatar = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: radius * 2 + 10.0,
          width: radius * 2 + 10.0,
          decoration: user == null ? null : null,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: _whiteBorderDecoration,
                child: Container(
                  decoration: _greyBoxShadowDecoration,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    radius: radius,
                    backgroundImage:
                        NetworkImage(store.brokersList.url + "" + user.picture),
                  ),
                ),
              ),
              if (user.status == 'Active')
                // Bottom right circular add icon
                Positioned(
                  right: 9.0,
                  bottom: 5.0,
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
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              "${user.title}",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        )
      ],
    );

    return Padding(
      padding: this.padding,
      child: GestureDetector(child: avatar, onTap: onTap),
    );
  }
}
