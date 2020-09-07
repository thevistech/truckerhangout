import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/stores/notification_store.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/utills/heart_overlay_animator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:shared_preferences/shared_preferences.dart';
import '../ui/newsInfo/news_info_detail.dart';
import '../ui/auction/auction_detail.dart';

const PROPERTIES = "Properties";
const PROJECTS = "Projects";
const DASHBOARD = "Dashboard";
const FINDBROKERS = "Find Brokers";
const NOTIFICATIONS = "Notifications";
const MAPS = "Maps";
const FAVOURITE = "Favourites";
const JOBS = "Job Board";
const NEWSANDBLOGS = "News And Blogs";
const smallAppBar = 83.0;
const BigAppBar = 120.0;
const colorMain = Color(0xffFD4F1C);
const ratingColor = Color(0xffFD4F1C);
const colorDivider = Color(0xffE1E1E1);
const colorIconDefault = Color(0xffD1D1D1);
const colorGrey = Colors.grey;
const halfWhite = Color(0xffEFEFEF);
const lighrgrey = Color(0xFF837676);
const lightTxtColor = Color(0xFFD1D1D1);
const hintText = Colors.black;
var disabledButtonColor = Color(0xffF88F6F);
const subHeadingFontSize = 12.0;
const headingFontSize = 22.0;
const buttonFontSize = 14.0;
const height40 = 40.0;
const suffixIconSize = 18.0;
const prefixIconSize = 20.0;
const drawerListColor = Color(0xffFBFBFB);
const technicalErrorMessage =
    "Something went wrong please contact system administrator";
const colorLoadingRed = Color(0xffC40B0B);
const colorLoadingLightBlue = Color(0xff5592F8);
const colorLoadingBlue = Color(0xff29316C);
const colorExpandableFill = Color(0xffF4F4F4);
const bold = TextStyle(fontWeight: FontWeight.bold);
const link = TextStyle(color: Color(0xFF3F729B));
const smokeyColor = Color(0xff808080);
const smokeybgColor = Color(0xffEFEFEF);
var imgUrl;

// Colos that use in our app
const kSecondaryColor = Color(0xFFFE6D8E);
const kTextColor = Color(0xFF12153D);
const kTextLightColor = Color(0xFF9A9BB2);
const kFillStarColor = Color(0xFFFCC419);

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);

enum UserType { VISITOR, REALESTATE, BUILDERANDDEVELOPER }
enum mainDashBoardMenu { none, listing, price, hometype, more }
enum PropertyType { homes, Plots, Commercial }
enum propertyType { forsell, rent, wanted }
enum packageType { Free, Premium, Custom}

const appId = '8796465435325434324';
const appkey = 'zc54dfsfgdg3434vdfd';
const appIDAndAppKey = "app_id=$appId&app_key=$appkey";

const defaultUserImage = "assets/default_user.svg";

const String about_us =
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum';

showToast(msg, error) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: error == true ? Colors.red : Colors.green,
      textColor: error == true ? Colors.white : Colors.black,
      fontSize: 16.0);
}

dummyMoreFilterImger(contxt, isLodading) {
  return Container(
    height: 60,
    width: 60,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(60.0),
      child: Image.asset(
        'assets/no_img.png',
        color: colorIconDefault,
      ),
    ),
  );
}

dummyCoverImage(context, isLoading) {
  return Container(
      color: colorDivider,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            isLoading ? "Loading..." : "No Image",
            style: TextStyle(fontSize: 18.0, letterSpacing: 1.0),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: new TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: new TextStyle(
                fontSize: 12.0,
                color: Colors.black,
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
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ));
}

postUiDesign(
    {context,
    postUserImage,
    postUserfullName,
    postUsercompanyTitle,
    carosalImage,
    updateImageIndex,
    onDoubleTapLikePhoto,
    doubleTapImageEvents,
    title,
    description,
    unitId,
    unitTitle,
    jobPostingdTime,
    isDetail = false,
    auctionTimerEndDate}) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.transparent,
            // radius: 45.0,
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 40,
                width: 40,
                imageUrl: "$postUserImage",
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("$postUserfullName",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
              Text("$postUsercompanyTitle", style: TextStyle(fontSize: 12.0))
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return PropertyContactUsForm(
              //     post: widget.post,
              //     baseUrl: widget.baseUrl,
              //     filterPropertyModel: widget.filterPropertyModel,
              //   );
              // }));
              if (auctionTimerEndDate != null) if (!isDetail)
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AuctionDetail();
                }));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: colorMain,
                  ),
                  borderRadius: BorderRadius.circular(3.0)),
              child: Text(
                auctionTimerEndDate != null ? "Bid Now" : "Contact",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // showDialog(
              //   context: context,
              //   builder: (_) => LogoutOverlay(
              //     post: widget.post,
              //     url: "$BaseUrl$pageType/${widget.post.info.slug}",
              //   ),
              // );
            },
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      GestureDetector(
        onTap: () {
          if (auctionTimerEndDate != null) if (!isDetail)
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AuctionDetail();
            }));
          if (auctionTimerEndDate == null) if (!isDetail)
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NewsAndInfoDetail();
            }));
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CarouselSlider(
              items: [carosalImage].map((url) {
                return CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    imageUrl: url,
                    placeholder: (context, url) =>
                        dummyCoverImage(context, true),
                    errorWidget: (context, url, error) =>
                        dummyCoverImage(context, false));
              }).toList(),
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              onPageChanged: updateImageIndex,
            ),
            //uncomment when we want to use
            // HeartOverlayAnimator(
            //     triggerAnimationStream: doubleTapImageEvents == null
            //         ? null
            //         : doubleTapImageEvents.stream),
          ],
        ),
        onDoubleTap: onDoubleTapLikePhoto,
      ),
      bottomBar(title, description, unitId, unitTitle, jobPostingdTime,
          auctionTimerEndDate)
    ],
  );
}

bottomBar(title, description, unitId, unitTitle, DateTime jobPostingdTime,
    auctionTimerEndDate) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      color: Color(0xffEFEFEF),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            title != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "$title",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                  )
                : Container(),
            description != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "$description",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: TextStyle(
                        color: smokeyColor,
                        fontSize: 11.0,
                      ),
                    ),
                  )
                : Container(),
            (unitId != null && unitTitle != null)
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "$unitId + " " + $unitTitle",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                      ),
                    ),
                  )
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                jobPostingdTime != null
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                height: 18,
                                width: 18,
                                child: SvgPicture.asset('assets/calendar.svg')),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "posted ",
                              style:
                                  TextStyle(color: smokeyColor, fontSize: 11.0),
                            ),
                            Text(
                              timeago.format(jobPostingdTime, locale: 'en'),
                              style:
                                  TextStyle(color: smokeyColor, fontSize: 11.0),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Spacer(),
                //auctionTimerEndDate != null ? TimerApp() : Container()
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

dummyDeveloperImage(context, isLoading) {
  return Container(
      color: colorDivider,
      width: 60,
      height: 60,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            isLoading ? "Loading..." : "No Image",
            style: TextStyle(fontSize: 14.0, letterSpacing: 1.0),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "www.brokerscircle.net",
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ));
}

bottomBarTextCopyright({color}) {
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
              color: color == null ? Colors.black : color,
            ),
            children: <TextSpan>[
              new TextSpan(
                  text: 'Copyright © 2020 ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              new TextSpan(
                  text: 'Trucker Hangout',
                  style: new TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Text(
          "www.truckerhangout.net",
          style: TextStyle(
              fontSize: 12.0, color: color == null ? Colors.black : color),
        ),
        Padding(padding: EdgeInsets.all(5.0))
      ],
    ),
  );
}

topBackgroungImage(height) {
  return Container(
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/blueimg.png'),
        fit: BoxFit.fill,
      ),
    ),
  );
}

backgroundImage() {
  return Positioned.fill(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        "assets/trucker_logo.png",
      ),
    ),
  );
}

actionWidgets(context) {
  return <Widget>[
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
            fit: BoxFit.cover, height: 34, width: 34, imageUrl: imgUrl),
      ),
    ),
  ];
}

setColor(String title) {
  if (title == 'For Sale') {
    return colorMain;
  } else if (title == 'For Rent') {
    return Colors.yellow;
  } else if (title == 'For Wanted') {
    return Colors.red;
  } else if (title == 'Off Plan') {
    return Colors.green;
  } else {
    return Colors.red;
  }
}

void showSnackbar(BuildContext context, String text) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1),
    ),
  );
}

fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

class Config {
  static Future<bool> getIntroScreenViewed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('introScreen');
  }

  static isIntroScreenViewed(bool introScreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('introScreen', introScreen);
  }

  static Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName');
  }

  static setUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', userName);
  }

  static Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userEmail');
  }

  static setUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userEmail', userEmail);
  }

  static Future<String> getUserProfilePicture() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userProfilePicture');
  }

  static setUserProfilePicture(String userProfilePicture) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userProfilePicture', userProfilePicture);
  }

  static Future<String> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userID');
  }

  static setUserID(String userID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', userID);
  }

  static Future<String> getCompanyID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('companyID');
  }

  static setCompanyID(String companyID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('companyID', companyID);
  }

  static Future<String> getBasicImageUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('imageURL');
  }

  static setBasicImageUrl(String imageURL) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('imageURL', imageURL);
  }

  static Future<String> getUserDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('displayName');
  }

  static setUserDisplayName(String displayName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('displayName', displayName);
  }

  static Future<String> getUserMobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userMobile');
  }

  static setUserMobile(String userMobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userMobile', userMobile);
  }

  static Future<String> getUserCompanyName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userCompanyName');
  }

  static setUserCompanyName(String userMobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userCompanyName', userMobile);
  }

  static clearSharePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userName");
  }
}

int secondsPassed = 0;

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  static const duration = const Duration(seconds: 1, days: 5);

  bool isActive = true;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LabelText(label: 'HRS', value: hours.toString().padLeft(2, '0')),
          LabelText(label: 'MIN', value: minutes.toString().padLeft(2, '0')),
          LabelText(label: 'SEC', value: seconds.toString().padLeft(2, '0')),
        ],
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  LabelText({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: colorDivider),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: colorMain, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            '$label',
            style: TextStyle(color: colorMain, fontSize: 8),
          ),
        ],
      ),
    );
  }
}
