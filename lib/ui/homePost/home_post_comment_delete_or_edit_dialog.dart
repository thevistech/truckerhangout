import 'package:flutter/material.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/stores/home_comments_screen_store.dart';
import 'package:flutterapp/utills/config.dart';

class CommentEditAndDeleteDialog extends StatefulWidget {
  final LikeAndComment post;
  final String currentUserID;
  CommentEditAndDeleteDialog(
      {this.post, this.currentUserID});
  @override
  State<StatefulWidget> createState() => LogoutOverlayState();
}

class LogoutOverlayState extends State<CommentEditAndDeleteDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: EdgeInsets.all(25.0),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, "0");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ),
                  ),
                  widget.currentUserID == widget.post.createdByUserId
                      ? Divider(
                          height: 1,
                          color: colorDivider,
                        )
                      : Container(),
                  widget.currentUserID == widget.post.createdByUserId
                      ? InkWell(
                          onTap: () {
                            Navigator.pop(context, "1");
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              "Delete",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                          ),
                        )
                      : Container(),
                  Divider(
                    height: 1,
                    color: colorDivider,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, "2");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
