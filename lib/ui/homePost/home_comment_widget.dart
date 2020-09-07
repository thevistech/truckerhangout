import 'package:flutter/material.dart';
import 'package:flutterapp/models/models.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/ui/avatar_widget.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/heart_icon_animator.dart';

class CommentWidget extends StatefulWidget {
  final LikeAndComment comment;
  var baseUrl;
  CommentWidget(this.comment, this.baseUrl);

  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  void _toggleIsLiked() {
    //setState(() => widget.comment.toggleLikeFor(currentUser));
  }

  _buildRichText() {
    var currentTextData = StringBuffer();
    var textSpans = <TextSpan>[
      TextSpan(
          text: '${widget.comment.userDisplayName} ',
          style: TextStyle(color: colorMain, fontWeight: FontWeight.bold)),
    ];
    this.widget.comment.text.split(' ').forEach((word) {
      if (word.startsWith('#') && word.length > 1) {
        if (currentTextData.isNotEmpty) {
          textSpans.add(TextSpan(text: currentTextData.toString()));
          currentTextData.clear();
        }
        textSpans.add(TextSpan(text: '$word ', style: link));
      } else {
        currentTextData.write('$word ');
      }
    });
    if (currentTextData.isNotEmpty) {
      textSpans.add(TextSpan(text: currentTextData.toString()));
      currentTextData.clear();
    }
    return Text.rich(TextSpan(children: textSpans),
        style: TextStyle(
          fontSize: 12,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Row(
          children: <Widget>[
            AvatarWidget(
              imgUrl: "${widget.baseUrl}${widget.comment.userImg}",
              padding: EdgeInsets.only(right: 0.0),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                  color: halfWhite,
                  border: Border.all(
                    color: halfWhite,
                  ),
                  borderRadius: BorderRadius.circular(32.0)),
              child: _buildRichText(),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
