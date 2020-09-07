import 'package:flutter/material.dart';
import 'package:flutterapp/datetime_utils.dart';

import 'package:flutterapp/models/event_model.dart';
import 'package:flutterapp/ui/events/widgets/ui_helper.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/constants/text_style.dart';

class NearbyEventCard extends StatelessWidget {
  final Event event;
  final Function onTap;
  NearbyEventCard(this.event, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                buildImage(),
                buildEventInfo(context),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Divider(color: colorDivider,height: 1,),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: smokeybgColor,
        width: 80,
        height: 90,
        child: Hero(
          tag: event.image,
          child: Image.network(
            event.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildEventInfo(context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(DateTimeUtils.getFullDate(event.eventDate), style: monthStyle),
          UIHelper.verticalSpace(8),
          Text(event.name, style: titleStyle),
          UIHelper.verticalSpace(8),
          Row(
            children: <Widget>[
              Icon(Icons.location_on, size: 16, color: colorMain),
              UIHelper.horizontalSpace(4),
              Text(event.location.toUpperCase(), style: subtitleStyle),
            ],
          ),
        ],
      ),
    );
  }
}
