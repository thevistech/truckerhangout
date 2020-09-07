import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/star_ratings.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {

  double rating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: MyCustomAppBar(height: 70),
      body : Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('5'),
                      LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.6,
                        lineHeight: 8.0,
                        percent: 0.9,
                        progressColor: ratingColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      Text('4'),
                      LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.6,
                        lineHeight: 8.0,
                        percent: 0.7,
                        progressColor: ratingColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      Text('3'),
                      LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.6,
                        lineHeight: 8.0,
                        percent: 0.1,
                        progressColor: ratingColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      Text('2'),
                      LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.6,
                        lineHeight: 8.0,
                        percent: 0.5,
                        progressColor: ratingColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      Text('1'),
                      LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.6,
                        lineHeight: 8.0,
                        percent: 1,
                        progressColor: ratingColor,
                      ),
                    ],
                  ),
                ],
              ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('4.5', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0, color: Colors.black),),
                          SizedBox(height: 10,),
                          StarRating(
                            rating: rating,
                            onRatingChanged: (rating) => setState(() => this.rating = rating),
                          ),
                          SizedBox(height: 20,),
                          Text('104 Reviews', style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25,),
          Divider(
            color: Colors.grey,
            height: 2,
          ),
          Expanded(
              child : ReviewsList())
        ],
      )
    );
  }
}


class ReviewsList extends StatefulWidget {
  @override
  _ReviewsListState createState() => _ReviewsListState();
}

class _ReviewsListState extends State<ReviewsList> {
  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (ctx, int) {
          return Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
              child: Column(

                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                            //  SizedBox(height: 2,),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                  //  maxLines: 1,
                                 // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                ),
                              ),
                              StarRating(
                                rating: rating,
                                onRatingChanged: (rating) => setState(() => this.rating = rating),
                              ),
                            //  Padding(padding: EdgeInsets.all(5.0)),
                            ],
                          ))
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Divider(
                    color: Colors.black,
                    height: 2,
                  )
                ],
              ));
        }
    );
  }
}

