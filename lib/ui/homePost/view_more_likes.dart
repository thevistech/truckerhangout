import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/ui/avatar_widget.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:timeago/timeago.dart' as timeago;

class ViewMoreLikesWidget extends StatefulWidget {
  final LikeAndComment post;
  final String imgUrl;
  ViewMoreLikesWidget(this.post, this.imgUrl);

  @override
  _LikeWidgetState createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<ViewMoreLikesWidget> {
  final StreamController<void> _doubleTapImageEvents =
      StreamController.broadcast();
  bool _isSaved = false;
  var commentCreatedTime;
  @override
  void initState() {
    super.initState();
    commentCreatedTime = DateTime.now().subtract(Duration(
        minutes: widget.post.createdAt.minute,
        seconds: widget.post.createdAt.second,
        hours: widget.post.createdAt.hour));
  }

  @override
  void dispose() {
    _doubleTapImageEvents.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            AvatarWidget(
              imgUrl: "${widget.imgUrl}${widget.post.userImg}",
              isLarge: true,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${widget.post.userFullName}",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  timeago.format(commentCreatedTime, locale: 'en'),
                  style: TextStyle(
                    fontSize: 10,
                    color: smokeyColor,
                  ),
                ),
              ],
            )),
            followButton(),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ],
    );
  }

  followButton() {
    return Container(
      height: 30,
      // width: width,
      child: RaisedButton(
        onPressed: () {
          print('');
        },
        padding: EdgeInsets.all(0),
        color: colorMain,
        textColor: Colors.white,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Follow',
                style: TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide(color: colorMain)),
      ),
    );
  }
}
