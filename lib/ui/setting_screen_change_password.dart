import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/setting_screen_verify_code_screen.dart';
import '../utills/config.dart';
class ChangePasswordScreen extends StatefulWidget {
  final userImage;
  ChangePasswordScreen({this.userImage});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  double heightsFactor = 0.55;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        // ignore: missing_required_param
        bottom: PreferredSize(
          child: Container(
            height: 1,
            color: colorDivider,
          ),
        ),
        titleSpacing: 0.0,
        title: Text('Change Password',
            style: TextStyle(color: Colors.white, fontSize: 16)),
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
                imageUrl: "${widget.userImage}",
              ),
            ),
          ),
        ],
      ),
      body: Form(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: height, minHeight: height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: Container(
                    color: colorMain,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Image.asset(
                              'assets/logo.png',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Change Your Password?',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: height * 0.01),
                              Text(
                                'Enter your old and new Password',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                passwordWidget(height / 15, width / 1.1)
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    newPasswordWidget(height / 15, width / 1.1),
                                    SizedBox(height: height * 0.02),
                                    confirmNewPasswordWidget(
                                        height / 15, width / 1.1),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: nextWidget(height / 15, width),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: height * 0.014),
                                child: bottomBarTextCopyright(),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  nextWidget(heightButton, width) {
    return Observer(
      builder: (_) => Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        padding: EdgeInsets.all(0.0),
        height: height40,
        width: width,
        child: RaisedButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyCodeScreen(),
              ),
            );
          },
          color: colorMain,
          disabledColor: disabledButtonColor,
          textColor: Colors.white,
          disabledTextColor: Colors.white,
          child: Stack(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  'NEXT',
                  style: TextStyle(
                      fontSize: buttonFontSize, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                //  padding: const EdgeInsets.symmetric(horizontal: 0),
                margin: EdgeInsets.all(4),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_forward,
                        size: prefixIconSize,
                        color: colorMain,
                      )),
                ),
              ),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }

  confirmNewPasswordWidget(height, width) {
    return Container(
      height: height40,
      width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        //controller: passController,

        keyboardType: TextInputType.visiblePassword,
        // obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Confirm Password',
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.lock,
              size: prefixIconSize,
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.all(0.0),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: colorMain, width: 1.0),
          ),
        ),
      ),
    );
  }

  newPasswordWidget(height, width) {
    return Container(
      height: height40,
      width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        //controller: passController,

        keyboardType: TextInputType.visiblePassword,
        // obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.lock,
              size: prefixIconSize,
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.all(0.0),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: colorMain, width: 1.0),
          ),
        ),
      ),
    );
  }

  passwordWidget(height, width) {
    return Container(
      height: height40,
      width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        //controller: passController,

        keyboardType: TextInputType.visiblePassword,
        // obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Old password',
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.lock,
              size: prefixIconSize,
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.all(0.0),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(32.0)),
              borderSide: BorderSide(color: Colors.transparent, width: 1.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.transparent, width: 1.0),
          ),
        ),
      ),
    );
  }
}
