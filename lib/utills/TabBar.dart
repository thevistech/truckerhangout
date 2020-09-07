import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/custom_tab_bar.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  Color _iconColor = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    textStyle() {
      return new TextStyle(color: Colors.white, fontSize: 30.0);
    }

    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              child: TabBar(
                // indicatorPadding: EdgeInsets.all(10),
                indicatorColor: colorMain,
                labelColor: Colors.grey,
                // indicatorSize: TabBarIndicatorSize.label,
                tabs: <Widget>[
                  new Tab(
                    text: "BUY",
                  ),
                  new Tab(
                    text: "SELL",
                  ),
                  new Tab(
                    text: "RENT",
                  ),
                ],
              ),
              preferredSize: Size.fromHeight(-5)),
        ),
        body: TabBarView(
          children: <Widget>[
            new Container(
              //  color: Colors.deepOrangeAccent,
              child: CustomTabBar()
            ),
            new Container(
              child: CustomTabBar()
            ),
            new Container(
              child: CustomTabBar()
            ),
          ],
        ),
      ),
    );
  }
}

//tabBarBUYWidget()
//{
//  Color _iconColor = Colors.grey[300];
//
//  @override
//  Widget build(BuildContext) {}
//
// return ListView.builder(
//    itemCount: places.length,
//    itemBuilder: (context, index) {
//      return Container(
//        // height: 150,
//        padding: EdgeInsets.all(2),
//        margin: EdgeInsets.fromLTRB(4, 4, 4, 2),
//        decoration: BoxDecoration(
//            border: Border.all(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(6.0))
//        ),
//        child: Column(
//          children: <Widget>[
//            Row(
//              // crossAxisAlignment: CrossAxisAlignment.start,
//              //  mainAxisAlignment : MainAxisAlignment.start,
//              children: <Widget>[
//                Expanded(
//                  flex : 2,
//                  child: ClipRRect(
//                    borderRadius:
//                    BorderRadius.all(Radius.circular(6.0)),
//                    child: Image.network(
//                      places[index].imageUrl,
//                      fit: BoxFit.fill,
//                      //  width: 140,
//                      height: 120,
//                    ),
//                  ),
//                ),
//                Expanded(
//                  flex : 3,
//                  child: Padding(
//                    padding: const EdgeInsets.only(left: 10.0),
//                    child: Column(
//                      // mainAxisAlignment: MainAxisAlignment.start,
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text(places[index].stateName, style: TextStyle(color: colorMain, fontWeight: FontWeight.bold),),
//                          SizedBox(height: 5,),
//                          Text(places[index].description, style: TextStyle(fontSize: 11, color: Colors.black),),
//                          SizedBox(height: 5,),
//                          Text(places[index].location , style: TextStyle(color: colorMain, fontSize: 12.0)),
//                          SizedBox(height: 5,),
//                          Text(places[index].userName , style: TextStyle(color: colorMain)),
//                          SizedBox(height: 5,),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Row(
//                                children: <Widget>[
//                                  Container(
//                                    padding: EdgeInsets.all(5.0),
//                                    decoration:
//                                    BoxDecoration(color: _iconColor, shape: BoxShape.circle),
//                                    child: SizedBox(
//                                      height: 18,
//                                      width: 18,
//                                      child: IconButton(
//                                        padding: EdgeInsets.all(0.0),
//                                        onPressed: ()
//                                        {
//                                          setState
//                                        },
//                                        icon : Icon(Icons.favorite, size: 18),
//                                        //size: suffixIconSize,
//                                        color: Colors.black,
//                                      ),
//                                    ),
//                                  ),
//                                  Container(
//                                    margin: EdgeInsets.symmetric(horizontal: 5.0),
//                                    padding: EdgeInsets.all(5.0),
//                                    decoration:
//                                    BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
//                                    child: SizedBox(
//                                    height: 18,
//                                    width: 18,
//                                      child: IconButton(
//                                      padding: EdgeInsets.all(0.0),
//                                      onPressed: () {},
//                                        icon : Icon(Icons.phone_in_talk, size: 18),
//                                      //size: suffixIconSize,
//                                      color: Colors.black,
//                                    ),
//                                  ),
//                                  ),
//                                  Container(
//                                    padding: EdgeInsets.all(5.0),
//                                    decoration:
//                                    BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
//                                    child: SizedBox(
//                                      height: 18,
//                                      width: 18,
//                                      child: IconButton(
//                                        padding: EdgeInsets.all(0.0),
//                                        onPressed: () {},
//                                        icon : Icon(Icons.mail, size: 18),
//                                        //size: suffixIconSize,
//                                        color: Colors.black,
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                              Text(places[index].time, textAlign: TextAlign.right, style: TextStyle(fontSize: 12.0, color: Colors.grey))
//                            ],
//
//                          ),
//                        ]
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ],
//        ),
//      );
//    },
//  );
//}