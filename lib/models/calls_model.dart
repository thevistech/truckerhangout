import 'package:flutter/material.dart';

class CallModel {
  final String imgurl;
  final String name;
  final String time;
  final Icon type;
  final Icon st;
  CallModel({this.name, this.time, this.imgurl, this.st, this.type});
}

List<CallModel> dummc = [
  new CallModel(
      name: "Jack",
      time: "Today, 4:33AM",
      imgurl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
      st: new Icon(Icons.call_made, color: Colors.green),
      type: new Icon(
        Icons.phone,
      )
  ),
  new CallModel(
      name: "Hero",
      time: "Today, 2:52AM",
      imgurl:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB0qsqzuV2X3LCCSeJujDyK8vg5SIz1JNAP-f5N_Tc2MQsNEEWGA",
      st: new Icon(Icons.call_received, color: Colors.green),
      type: new Icon(Icons.videocam)),
  new CallModel(
      name: "John",
      time: "Today, 1:32AM",
      imgurl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
      st: new Icon(Icons.call_received, color: Colors.red),
      type: new Icon(Icons.phone)),
];