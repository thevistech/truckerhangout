import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InviteScreen extends StatefulWidget {
  final userImage;
  InviteScreen({this.userImage});
  @override
  _InviteScreenState createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorMain,
      appBar: AppBar(
        titleSpacing: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: actionWidgets(context),
        backgroundColor: colorMain,
        title: Text(
          'Invite',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Image.asset('assets/logo.png'),
              )),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Invite Your Friends......',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.justify,
                maxLines: 7,
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    onPressed: () {},
                    color: Colors.white,
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                    shape: CircleBorder(),
                    child: Icon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.blueAccent,
                    ),
                  ),
                  OutlineButton(
                    onPressed: () {},
                    color: Colors.white,
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                    shape: CircleBorder(),
                    child: Icon(
                      FontAwesomeIcons.apple,
                      color: Colors.blueGrey,
                    ),
                  ),
                  OutlineButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    color: Colors.white,
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                    shape: CircleBorder(),
                    child: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 3,
            child: bottomBarTextCopyrightWhite(),
          )
        ],
      ),
    );
  }

  bottomBarTextCopyrightWhite() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          RichText(
            text: new TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: new TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
              children: <TextSpan>[
                new TextSpan(
                    text: 'Copyright © 2020 ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                new TextSpan(
                    text: 'Brokers Circle',
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Text(
            "www.brokerscircle.net",
            style: TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          Padding(padding: EdgeInsets.all(5.0))
        ],
      ),
    );
  }
}
