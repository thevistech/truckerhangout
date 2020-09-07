import 'package:flutter/material.dart';
import 'package:flutterapp/datetime_utils.dart';

import 'package:flutterapp/models/event_model.dart';
import 'package:flutterapp/ui/events/widgets/ui_helper.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/constants/text_style.dart';

class UpComingEventCard extends StatelessWidget {
  final Event event;
  final Function onTap;
  UpComingEventCard(this.event, {this.onTap});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: <Widget>[
          Expanded(child: buildImage()),
          UIHelper.verticalSpace(24),
          buildEventInfo(context),
        ],
      ),
    );
  }

  Widget buildImage() {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: smokeybgColor,
          width: double.infinity,
          child: Hero(
            tag: event.image,
            child: Image.network(
              event.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEventInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: smokeybgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("${DateTimeUtils.getMonth(event.eventDate)}", style: monthStyle),
                Text("${DateTimeUtils.getDayOfMonth(event.eventDate)}", style: titleStyle),
              ],
            ),
          ),
          UIHelper.horizontalSpace(15),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(event.name, style: titleStyle),
                  UIHelper.verticalSpace(4),
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on, size: 16, color: colorMain),
                      UIHelper.horizontalSpace(4),
                      Text(event.location.toUpperCase(), style: subtitleStyle),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
