import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/star_ratings.dart';

class PastDealings extends StatefulWidget {
  @override
  _PastDealingsState createState() => _PastDealingsState();
}

class _PastDealingsState extends State<PastDealings> {

  double rating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (ctx, int)
          {
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQUuY1oNRfRCLl56TdcQGE3oAd7lL4fcNIYcg&usqp=CAU'),
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(height: 5,),
                          Text('Muzammil Khan', style: TextStyle(fontSize: 12.0),),
                          SizedBox(height: 2,),
                          Text('Makki Real Estate', style: TextStyle(fontSize: 12.0, color: colorMain, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text('Dealing with', style: TextStyle(fontSize: 12.0),),
                              SizedBox(height: 5,),
                              Text('4.8', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              StarRating(
                                rating: rating,
                                onRatingChanged: (rating) => setState(() => this.rating = rating),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage(
                                    'https://i.dailymail.co.uk/i/pix/2017/04/20/13/3F6B966D00000578-4428630-image-m-80_1492690622006.jpg'),
                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(height: 5,),
                              Text('Usman Ahmed', style: TextStyle(fontSize: 12.0),),
                              SizedBox(height: 2,),
                              Text('Takaful Real Estate', style: TextStyle(fontSize: 12.0, color: colorMain, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Divider(
                  color: Colors.grey,
                  height: 2,
                ),
              ],
            );
          }
      ),
    );
  }
}
