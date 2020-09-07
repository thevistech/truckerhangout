import 'package:flutter/material.dart';
import 'package:flutterapp/utills/TabBar.dart';
import 'package:flutterapp/utills/config.dart';

class DashboardHome extends StatefulWidget {
  @override
  _DashboardHomeState createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("BROKERS"),
                Text(
                  "VIEW ALL",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (ctx, int) {
                return Container(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                            backgroundColor: Colors.transparent,
                          ),
                          Positioned(
                            right: 5,
                            bottom: 0,
                            child: new Container(
                              alignment: Alignment.bottomRight,
                              width: 12.0,
                              height: 12.0,
                              decoration: BoxDecoration(
                                  color: Color(0xff3ED10A),
                                  shape: BoxShape.circle
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text("John"),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child : Tabs(),
          )
        ],
      ),
    );
  }
}