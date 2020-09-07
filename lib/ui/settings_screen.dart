import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/ui/setting_screen_change_password.dart';
import 'package:flutterapp/ui/smart_search/rounded_image_clipper.dart';
import 'package:flutterapp/utills/config.dart';

class ChangeSettingsScreen extends StatefulWidget {
  ChangeSettingsScreen({this.userImage});
  final userImage;
  @override
  _ChangeSettingsScreenState createState() => _ChangeSettingsScreenState();
}

class _ChangeSettingsScreenState extends State<ChangeSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            RoundedImageWidget(
              screenHeight: screenHeight,
              image: 'assets/blueimg.png',
              appBarLabel: 'Change Setting',
              imageUrl: widget.userImage,
              pageLogoImage: 'assets/logo.png',
              pageTitle: 'Change Setting',
              pageDesc: 'Change your password and profile settings',
            ),
            listTileChangeSettings(
              containerIcon: Icons.person,
              settingText: 'Change Profile',
              settingSubText: 'Update and modify your profile',
              onTap: () {},
            ),
            Divider(
              height: 1,
              color: colorDivider,
            ),
            listTileChangeSettings(
              containerIcon: Icons.lock,
              settingText: 'Change Password',
              settingSubText: "Update and modify your password",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChangePasswordScreen(
                    userImage: widget.userImage,
                  );
                }));
              },
            ),
            Divider(
              height: 1,
              color: colorDivider,
            ),
            listTileChangeSettings(
              containerIcon: Icons.notifications,
              settingText: 'Notifications',
              settingSubText: 'Active Notifications available',
              onTap: () {},
            ),
            SizedBox(
              height: 30,
            ),
            bottomBarTextCopyright()
          ],
        ),
      ),
    );
  }

  Widget listTileChangeSettings(
      {IconData containerIcon,
      String settingText,
      String settingSubText,
      Function onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: colorMain,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            containerIcon,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          settingText,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
        ),
        subtitle: Text(
          settingSubText,
          style: TextStyle(fontSize: 12),
        ),
        onTap: onTap,
      ),
    );
  }

  widgetChangePasswordButton(heightButton, width) {
    return Observer(
      builder: (_) => Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        padding: EdgeInsets.all(0.0),
        height: height40,
        width: width,
        child: RaisedButton(
          padding: EdgeInsets.all(0),
          onPressed: () {},
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => VerifyCodeScreen(),
          //     ),
          //   );
          // },
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
                  'Change Password',
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

  widgetChangeProfileButton(heightButton, width) {
    return Observer(
      builder: (_) => Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        padding: EdgeInsets.all(0.0),
        height: height40,
        width: width,
        child: RaisedButton(
          padding: EdgeInsets.all(0),
          onPressed: () {},
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => VerifyCodeScreen(),
          //     ),
          //   );
          // },
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
                  'Change Profile',
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
}
