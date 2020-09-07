import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/app_utils.dart';
import 'package:flutterapp/models/event_model.dart';
import 'package:flutterapp/ui/events/event_detail_page.dart';
import 'package:flutterapp/ui/events/widgets/home_bg_color.dart';
import 'package:flutterapp/ui/events/widgets/nearby_event_card.dart';
import 'package:flutterapp/ui/events/widgets/ui_helper.dart';
import 'package:flutterapp/ui/events/widgets/upcoming_event_card.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/constants/text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventHomeScreen extends StatefulWidget {
  @override
  _EventHomeScreenState createState() => _EventHomeScreenState();
}

class _EventHomeScreenState extends State<EventHomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;

  ScrollController scrollController;
  AnimationController controller;
  AnimationController opacityController;
  Animation<double> opacity;

  var userid;
  var currentUserImage;

  void viewEventDetail(Event event) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (BuildContext context, animation, __) {
          return FadeTransition(
            opacity: animation,
            child: EventDetailPage(event),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    scrollController = ScrollController();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1))..forward();
    opacityController = AnimationController(vsync: this, duration: Duration(microseconds: 1));
    opacity = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: opacityController,
    ));
    scrollController.addListener(() {
      opacityController.value = offsetToOpacity(currentOffset: scrollController.offset, maxOffset: scrollController.position.maxScrollExtent / 2);
    });
    Config.getUserID().then((value) {
      setState(() {
        userid = value;
      });
    });
    Config.getUserProfilePicture().then((value) {
      setState(() {
        currentUserImage = value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    opacityController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colorMain,
        titleSpacing: 0.0,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
        title: Text('Events'),
        bottom: PreferredSize(
          preferredSize: null,
          child: Container(
            height: 2,
            color: Colors.white,
          ),
        ),
        actions: actionWidgets(context),
      ),
      body: Stack(
        children: <Widget>[
          HomeBackgroundColor(opacity),
          SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildSearchAppBar(),
                UIHelper.verticalSpace(16),
                buildUpComingEventList(),
                UIHelper.verticalSpace(16),
                buildNearbyConcerts(),
              ],
            ),
          ),
        ],
      ),

    );
  }

  Widget buildSearchAppBar() {
    return Container(
      height: height40,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            enabled: true,
            fillColor: Colors.white,
            filled: true,
            hintText:  "Search Event",
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
              decoration:
              BoxDecoration(color: colorMain, shape: BoxShape.circle),
              child: Icon(
                Icons.search,
                size: prefixIconSize,
                color: Colors.white,
              ),
            ),
            hintStyle: TextStyle(
              color: colorMain,
            ),
            contentPadding: EdgeInsets.all(10.0),
            labelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            )
          ),
        ),
    );
  }

  Widget buildUpComingEventList() {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Upcoming Events", style: headerStyle.copyWith(color: Colors.white)),
          UIHelper.verticalSpace(16),
          Container(
            height: 250,
            child: ListView.builder(
              itemCount: upcomingEvents.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final event = upcomingEvents[index];
                return UpComingEventCard(event, onTap: () => viewEventDetail(event));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNearbyConcerts() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Nearby Events", style: headerStyle),
              Spacer(),
              UIHelper.horizontalSpace(16),
            ],
          ),
          SizedBox(height: 20,),
          ListView.builder(
            itemCount: nearbyEvents.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              final event = nearbyEvents[index];
              var animation = Tween<double>(begin: 800.0, end: 0.0).animate(
                CurvedAnimation(
                  parent: controller,
                  curve: Interval((1 / nearbyEvents.length) * index, 1.0, curve: Curves.decelerate),
                ),
              );
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) => Transform.translate(
                  offset: Offset(animation.value, 0.0),
                  child: NearbyEventCard(
                    event,
                    onTap: () => viewEventDetail(event),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
