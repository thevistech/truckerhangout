import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class ContactUsForm extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUsForm> {
  var imgUrl, userName, userEmail, userMobile, subject;
  @override
  void initState() {
    Config.getUserProfilePicture().then((value) {
      setState(() {
        imgUrl = value;
      });
    });
    Config.getUserName().then((value) {
      setState(() {
        userName = value;
      });
    });
    Config.getUserEmail().then((value) {
      setState(() {
        userEmail = value;
      });
    });
    // Config.getUserMobile().then((value) {
    //   setState(() {
    //     userMobile = value;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 4;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        centerTitle: false,
        title: Text('Contact Us'),
        titleSpacing: 0.0,
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Chat();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(
                "assets/message.svg",
                allowDrawingOutsideViewBox: true,
                height: 35,
                color: Colors.white,
              ),
            ),
          ),
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.transparent,
            // radius: 45.0,
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 34,
                width: 34,
                imageUrl: imgUrl,
              ),
            ),
          ),
        ],
        leading: InkWell(
            onTap: () {
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
            },
            child: Icon(Icons.arrow_back)),
        elevation: 0.0,
        // ignore: missing_required_param
        bottom: PreferredSize(
          child: Container(
            height: 1,
            color: Colors.white,
          ),
        ),
      ),
      body: moreFilters(height, width),
    );
  }

  moreFilters(height, width) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: height,
              color: colorMain,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:20.0,right: 20.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Observer(
          builder: (_) => Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                userNameTextFeild(width),
                SizedBox(
                  height: 10,
                ),
                userEmailTextFeild(width),
                SizedBox(
                  height: 10,
                ),
                userNumberTextFeild(width),
                SizedBox(
                  height: 10,
                ),
                messageTextFeild(width),
                SizedBox(
                  height: 10,
                ),
                sendButton(width)
              ],
            ),
          ),
        ),
      ],
    );
  }
  userNameTextFeild(width) {
    return Container(
      height: height40,
      width: width,
      child: Observer(
        builder: (_) => TextFormField(
          initialValue: userName,
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Name',
            hintStyle: TextStyle(fontSize: 12),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
              decoration:
              BoxDecoration(color: colorMain, shape: BoxShape.circle),
              child: Icon(
                Icons.person,
                size: prefixIconSize,
                color: Colors.white,
              ),
            ),
            contentPadding: EdgeInsets.all(5),
            labelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
  userEmailTextFeild(width) {
    return Container(
      height: height40,
      width: width,
      child: Observer(
        builder: (_) => TextFormField(
          initialValue: userEmail,
          style: TextStyle(fontSize: 12),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Email',
            hintStyle: TextStyle(fontSize: 12),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
              decoration:
              BoxDecoration(color: colorMain, shape: BoxShape.circle),
              child: Icon(
                Icons.alternate_email,
                size: prefixIconSize,
                color: Colors.white,
              ),
            ),
            contentPadding: EdgeInsets.all(5),
            labelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
  userNumberTextFeild(width) {
    return Container(
      height: height40,
      width: width,
      child: Observer(
        builder: (_) => TextFormField(
          initialValue: userMobile,
          style: TextStyle(fontSize: 12),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Mobile Number',
            hintStyle: TextStyle(fontSize: 12,color: Colors.black),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
              decoration:
              BoxDecoration(color: colorMain, shape: BoxShape.circle),
              child: Icon(
                Icons.mobile_screen_share,
                size: prefixIconSize,
                color: Colors.white,
              ),
            ),
            contentPadding: EdgeInsets.all(5),
            labelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
  subjectTextFeild(width) {
    return Container(
      height: height40,
      width: width,
      child: TextField(
        style: TextStyle(fontSize: 12),
        //onChanged: (value) => store.company = value,
        decoration: InputDecoration(
            filled: true,
            enabled: false,
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.black),
            hintText: subject == null ? 'Subject' : subject,
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
              decoration:
              BoxDecoration(color: colorMain, shape: BoxShape.circle),
              child: Icon(
                Icons.archive,
                size: prefixIconSize,
                color: Colors.white,
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            labelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            )),
      ),
    );
  }
  messageTextFeild(width) {
    return Container(
      width: width,
      child: TextField(
        maxLines: 10,
        style: TextStyle(fontSize: 12),
        //onChanged: (value) => store.company = value,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.black),
            hintText: 'Type your message here',
            contentPadding: EdgeInsets.all(10.0),
            labelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            )),
      ),
    );
  }
  sendButton(width) {
    return Observer(
      builder: (_) => RaisedButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          Navigator.pop(context);
        },
        color: colorMain,
        textColor: Colors.white,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'SEND',
                style: TextStyle(
                    fontSize: buttonFontSize, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }
}
