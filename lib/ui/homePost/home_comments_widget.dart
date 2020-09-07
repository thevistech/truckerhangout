import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/models.dart';
import 'package:flutterapp/ui/homePost/home_avatar_widget.dart';
import 'package:flutterapp/utills/config.dart';

class CommentsWidget extends StatefulWidget {
  final Post post;
  CommentsWidget(this.post);

  @override
  _LikeWidgetState createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<CommentsWidget> {
  final StreamController<void> _doubleTapImageEvents =
  StreamController.broadcast();
  bool _isSaved = false;

  @override
  void dispose() {
    _doubleTapImageEvents.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // User Details
        Row(
          children: <Widget>[
          //  AvatarWidget(user: widget.post.user,isLarge: true,isCurrentUserStory: false,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.post.user.name,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                if (widget.post.location != null) Text(widget.post.location)
              ],
            ),
            Spacer(),

          ],
        ),

        Divider(
          height: 2,
          color: colorDivider,
        )
        // Action Bar
      ],
    );
  }
}



