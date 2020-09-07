import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/stores/home_comments_screen_store.dart';
import 'package:flutterapp/ui/avatar_widget.dart';
import 'package:flutterapp/utills/config.dart';
import 'home_post_comment_delete_or_edit_dialog.dart';
import 'package:timeago/timeago.dart' as timeago;

class ViewMoreCommentsWidget extends StatefulWidget {
  final LikeAndComment post;
  final String imgUrl;
  final String currentUserID;
  final HomeCommentScreenStore homeCommentScreenStore;
  ViewMoreCommentsWidget(
      this.post, this.imgUrl, this.currentUserID, this.homeCommentScreenStore);

  @override
  _LikeWidgetState createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<ViewMoreCommentsWidget> {
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
    // print("Image ::    ${widget.imgUrl}${widget.post.userImg}");
  }

  @override
  void dispose() {
    _doubleTapImageEvents.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (widget.post.createdByUserId == widget.currentUserID)
          commentEditAndDeleteDialog(context, widget.post, widget.currentUserID,
              widget.homeCommentScreenStore);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                AvatarWidget(
                  imgUrl: "${widget.imgUrl}${widget.post.userImg}",
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${widget.post.text}",
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
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

commentEditAndDeleteDialog(
    context, store, currentUserID, homeCommentScreenStore) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return CommentEditAndDeleteDialog(
          post: store,
          currentUserID: currentUserID);
    },
  );
}
