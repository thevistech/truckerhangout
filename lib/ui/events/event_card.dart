import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ListEventCard extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Card(
elevation: 5,
clipBehavior: Clip.antiAlias,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20),
),
child: Padding(
padding: const EdgeInsets.all(8.0),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: <Widget>[
Expanded(
flex: 2,
child: ClipRRect(
borderRadius: BorderRadius.circular(20),
child: Container(
width: 100,
height: 100,
foregroundDecoration: const BoxDecoration(
image: DecorationImage(
image: AssetImage('assets/blueimg.png'),
fit: BoxFit.cover),
),
),
),
),
Expanded(
flex: 5,
child: Padding(
padding: const EdgeInsets.only(left: 8.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.stretch,
children: <Widget>[
ListTile(
contentPadding:
EdgeInsets.fromWindowPadding(WindowPadding.zero, 10),
title: Text(
'Ashley Thompson',
textAlign: TextAlign.start,
textDirection: TextDirection.ltr,
textScaleFactor: 1.2,
),
subtitle: Text('Jazz'),
trailing: IconButton(
padding: EdgeInsets.zero,
icon: Icon(Icons.star_border),
onPressed: () {},
),
),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: <Widget>[
Text(
'Tom\'s Bar',
style: TextStyle(
fontSize: 17, fontWeight: FontWeight.w700),
),
Text(
'8:00 PM',
style: TextStyle(
fontSize: 15,
color: Colors.grey,
),
),
],
),
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