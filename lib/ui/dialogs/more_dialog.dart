//import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/components/post_contact_us_page.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';

class LogoutOverlay extends StatefulWidget {
  String url;
  Datum post;
  LogoutOverlay({this.url, this.post});
  @override
  State<StatefulWidget> createState() => LogoutOverlayState();
}

class LogoutOverlayState extends State<LogoutOverlay>
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
    print("URL Sharrd  :;   " + widget.url);
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
              padding: EdgeInsets.all(15.0),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 20.0, right: 20.0),
                    child: Text(
                      "Report",
                      style: TextStyle(color: Colors.black, fontSize: 13.0),
                    ),
                  ),
                  Divider(
                    height: 24,
                    color: colorDivider,
                  ),
                  InkWell(
                    onTap: () {
                    /*  ClipboardManager.copyToClipBoard(widget.url)
                          .then((result) {
                        Fluttertoast.showToast(
                            msg: "Copied to Clipboard",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });*/
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 20.0, right: 20.0),
                      child: Text(
                        "Copy link",
                        style: TextStyle(color: Colors.black, fontSize: 13.0),
                      ),
                    ),
                  ),
                  /* Divider(
                    height: 24,
                    color: colorDivider,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactUsForm(
                          post: widget.post,
                        );
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 20.0, right: 20.0),
                      child: Text(
                        "Contact Us",
                        style: TextStyle(color: Colors.black, fontSize: 13.0),
                      ),
                    ),
                  ), */
                  Divider(
                    height: 24,
                    color: colorDivider,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Chat();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 20.0, right: 20.0),
                      child: Text(
                        "Message",
                        style: TextStyle(color: Colors.black, fontSize: 13.0),
                      ),
                    ),
                  ),
                  Divider(
                    height: 24,
                    color: colorDivider,
                  ),
                  InkWell(
                    onTap: () {
                      Share.share('${widget.url}');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 20.0, right: 20.0),
                      child: Text(
                        "Share to..",
                        style: TextStyle(color: Colors.black, fontSize: 13.0),
                      ),
                    ),
                  ),
                  Divider(
                    height: 24,
                    color: colorDivider,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 20.0, right: 20.0),
                    child: Text(
                      "Turn on Post Notifications",
                      style: TextStyle(color: Colors.black, fontSize: 13.0),
                    ),
                  ),
                  Divider(
                    height: 24,
                    color: colorDivider,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 20.0, right: 20.0),
                    child: Text(
                      "Mute",
                      style: TextStyle(color: Colors.black, fontSize: 13.0),
                    ),
                  ),
                  Divider(
                    height: 24,
                    color: colorDivider,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 20.0, right: 20.0),
                    child: Text(
                      "Unfollow",
                      style: TextStyle(color: Colors.black, fontSize: 13.0),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
