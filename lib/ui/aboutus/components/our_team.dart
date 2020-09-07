import 'package:flutter/material.dart';
import 'package:flutterapp/ui/aboutus/components/team_widget.dart';
import 'package:flutterapp/utills/config.dart';
import 'team_card.dart';

class CastAndCrew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Our Team",
            style: TextStyle(
                fontSize: 22,
                color: colorMain,
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 10),
          TeamCardView(),
//          SizedBox(
//            height: 160,
//            child: ListView.builder(
//              scrollDirection: Axis.horizontal,
//              itemCount: 5,
//              itemBuilder: (context, index) => CastCard(),
//            ),
//          )
        ],
      ),
    );
  }


}
