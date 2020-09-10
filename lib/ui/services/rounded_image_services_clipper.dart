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
    Size size = MediaQuery.of(context).size;
/*    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: RoundedClipper(),
          child: Container(
            height: widget.screenHeight * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(widget.image),
              ),
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
                    padding: const EdgeInsets.only(top:12.0),
                      child:SvgPicture.asset(
                        widget.pageLogoImage,
                        width:60.0,
                        height: 100.0,
                        color: Colors.white,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:2.0),
                    child: Text(
                      widget.pageTitle,
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.pageDesc,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 13),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );*/
    return SafeArea(
      child: Container(
        //margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
        // It will cover 20% of our total height
        height: size.height * 0.4,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
              //  left: kDefaultPadding,
                //right: kDefaultPadding,
                bottom: 36 + kDefaultPadding,
              ),
              height: size.height * 0.4 - 27,

              decoration: BoxDecoration(
                color: colorMain,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
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
          children: <Widget>[
            SvgPicture.asset(
              widget.pageLogoImage,
              width:60.0,
              height: 100.0,
              color: Colors.white,
            ),
            Text(
              widget.pageTitle,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),

            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10),
              child: Text(
                widget.pageDesc,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontSize: 12),
              ),
            ),
          ],
        )
        ],
      ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 6,
                      color: colorMain.withOpacity(0.13),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.black
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          // surffix isn't working properly  with SVG
                          // thats why we use row
                          // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                        ),
                      ),
                    ),
                    SvgPicture.asset("assets/icons/search.svg"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }

