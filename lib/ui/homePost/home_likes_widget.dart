import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/models.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/heart_icon_animator.dart';
import 'package:flutterapp/utills/heart_overlay_animator.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'home_avatar_widget.dart';

class LikeWidget extends StatefulWidget {
  final Post post;

  LikeWidget(this.post);

  @override
  _LikeWidgetState createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  final StreamController<void> _doubleTapImageEvents =
  StreamController.broadcast();
  bool _isSaved = false;

  @override
  void dispose() {
    _doubleTapImageEvents.close();
    super.dispose();
  }



  void _onDoubleTapLikePhoto() {
    setState(() => widget.post.addLikeIfUnlikedFor(currentUser));
    _doubleTapImageEvents.sink.add(null);
  }

  void _toggleIsLiked() {
    setState(() => widget.post.toggleLikeFor(currentUser));
  }

  void _toggleIsSaved() {
    setState(() => _isSaved = !_isSaved);
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
           Padding(
             padding: const EdgeInsets.only(right:8.0),
             child: RaisedButton(
               onPressed: () => showSnackbar(context, 'Added As Friend'),

               padding: EdgeInsets.all(0),
                color: colorMain,
                textColor: Colors.white,
                child: Stack(
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Add Friend',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    side: BorderSide(color: colorMain)),
              ),
           ),

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



