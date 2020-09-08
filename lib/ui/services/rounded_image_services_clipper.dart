import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/profiles/user_profile.dart';
import 'package:flutterapp/ui/smart_search/rounded_clipper.dart';
import 'package:flutterapp/utills/config.dart';

class BackgroundImageServices extends StatefulWidget {
  const BackgroundImageServices({
    Key key,
    @required this.screenHeight,
    @required this.image,
    this.appBarLabel,
    this.imageUrl,
    this.pageLogoImage,
    this.pageTitle,
    this.pageDesc,
  }) : super(key: key);

  final double screenHeight;
  final String image;
  final String appBarLabel;
  final String imageUrl;
  final String pageLogoImage;
  final String pageTitle;
  final String pageDesc;

  @override
  _BackgroundImageServicesState createState() => _BackgroundImageServicesState();
}

class _BackgroundImageServicesState extends State<BackgroundImageServices> {
  var userid;
  @override
  void initState() {
    Config.getUserID().then((value) {
      setState(() {
        userid = value;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: widget.screenHeight * 0.5,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(widget.image),
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    widget.appBarLabel,
                    style: TextStyle(
                        color: Colors.white, fontSize: 18,fontWeight: FontWeight.w800 ),
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
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
                      GestureDetector(
                        onTap: (){
                          if (userid == null) return;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return UserProfile(
                                  id: userid,
                                  loginUserId: userid,
                                );
                              }));
                        },
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.transparent,
                          // radius: 45.0,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              height: 34,
                              width: 34,
                              imageUrl: '${this.widget.imageUrl}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Divider(color: Colors.white,height: 1,thickness: 2,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:18.0),
                      child:SvgPicture.asset(
                        widget.pageLogoImage,
                        width:60.0,
                        height: 100.0,
                        color: Colors.white,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:18.0),
                    child: Text(
                      widget.pageTitle,
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    widget.pageDesc,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
