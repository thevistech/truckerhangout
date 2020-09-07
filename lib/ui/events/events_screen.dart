import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:lottie/lottie.dart';

import 'event_card.dart';

class EventScreen extends StatefulWidget {
  var userImage;
  EventScreen({this.userImage});
  @override
  _ComingSoonScreenState createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: 0.3,
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/blueimg.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: IconButton(
                                icon:
                                Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Live events',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  letterSpacing: 1),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return Chat();
                                        }));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
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
                                      imageUrl: '${widget.userImage}',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Find live events near you',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            heightFactor: 1 - 0.3,
            alignment: Alignment.bottomCenter,
            child: Container(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 8),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: colorMain)),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.backup,
                                color: colorMain,
                              ),
                              Text(
                                ' Today',
                                style: TextStyle(color: colorMain),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: colorMain)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'All Music ',
                                style: TextStyle(color: colorMain),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: colorMain,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(bottom: 3, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Tom\'s Bar  ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '2.5 Ml',
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 11.0),
                            ),
                          ],
                        ),
                        Text(
                          'Get Directions'.toUpperCase(),
                          style: TextStyle(
                            color: colorMain,
                            fontSize: 12,
                            letterSpacing: 1.5,
                          ),
                        )
                      ],
                    ),
                  ),
                  ListEventCard(),
                  ListEventCard(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 3, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Clancy\'s  ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '2.5 Ml',
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 11.0),
                            ),
                          ],
                        ),
                        Text(
                          'Get Directions'.toUpperCase(),
                          style: TextStyle(
                            color: colorMain,
                            fontSize: 12,
                            letterSpacing: 1.5,
                          ),
                        )
                      ],
                    ),
                  ),
                  ListEventCard(),
                  ListEventCard(),
                  ListEventCard(),
                ],
              ),
            ),
          ),
          FractionallySizedBox(
            heightFactor: 0.12,
            widthFactor: 0.93,
            alignment: Alignment.center,
            child: Container(
              transform: Matrix4.translationValues(0, -115, 0),
              height: height40,
              width: MediaQuery.of(context).size.width * 0.93,
              child: TextFormField(
                style: TextStyle(fontSize: 12),
                //controller: passController,
                keyboardType: TextInputType.visiblePassword,
                // obscureText: true,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search live events',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.all(0.0),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(const Radius.circular(32.0)),
                      borderSide: BorderSide(color: colorMain, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(color: colorMain, width: 1.0),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            height: 60,
            width: 60,
            child: FloatingActionButton(
              onPressed: null,
              child: Icon(Icons.account_balance),
            ),
          )
        ],
      ),

    );
  }
}
