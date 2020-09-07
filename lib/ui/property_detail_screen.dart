import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_star_rating/flutter_star_rating.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/UiStrings.dart';
import '../utills/config.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailsScreen extends StatefulWidget {
  final Datum post;
  final String baseUrl;

  DetailsScreen({this.post, this.baseUrl});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsScreen> {
  List<charts.Series<Task, String>> _seriesPieData;
  var imgUrl;
  var posteCreatedTime;

  _generateData() {
    var piedata = [
      new Task('Property Tax', 25.0, Color(0xff89DE53)),
      new Task('Principle Interest', 45.0, Color(0xff52A624)),
      new Task('HOA Fees', 15.0, Color(0xff4E76E6)),
      new Task('Home Ins', 5.0, Color(0xff193A99)),
      new Task('Mortgage Ins', 10.0, Color(0xffD2D2D2)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.task}:${row.taskvalue}',
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    Config.getUserProfilePicture().then((value) {
      setState(() {
        imgUrl = value;
      });
    });
    _generateData();
    timeData();
  }

  timeData() {
    posteCreatedTime = DateTime.now().subtract(Duration(
        minutes: widget.post.user.createdAt.minute,
        seconds: widget.post.user.createdAt.second,
        hours: widget.post.user.createdAt.hour));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0), // here the desired height
          child: AppBar()),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: colorMain,
              expandedHeight: 220.0,
              floating: false,
              pinned: true,
              title: Text('Property Details'),
              titleSpacing: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: widget.baseUrl + widget.post.info.thumbnail,
                      placeholder: (context, url) =>
                          dummyCoverImage(context, true),
                      errorWidget: (context, url, error) =>
                          dummyCoverImage(context, false))),
              actions: actionWidgets(context),
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
//                topSliderWidget(),
//                SizedBox(
//                  height: 4,
//                ),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    PhotoCarouselIndicator(
//                      photoCount: 1,
//                      activePhotoIndex: 1,
//                    ),
//                  ],
//                ),
                bottomBar(posteCreatedTime),
                imagesListWidget(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "PKR 2.5 Core",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Gulshan-e-Iqbal",
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  ClipOval(
                                    child: Material(
                                      color: smokeybgColor, // button color
                                      child: InkWell(
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: IconButton(
                                            padding: EdgeInsets.all(0),
                                            color: colorMain,
                                            iconSize: 20,
                                            icon: new Icon(
                                              Icons.favorite,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ClipOval(
                                    child: Material(
                                      color: UiColors.grey, // button color
                                      child: InkWell(
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: IconButton(
                                            padding: EdgeInsets.all(0),
                                            color: colorMain,
                                            iconSize: 20,
                                            icon: new Icon(
                                              Icons.phone_android,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ClipOval(
                                    child: Material(
                                      color: UiColors.grey, // button color
                                      child: InkWell(
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: IconButton(
                                            padding: EdgeInsets.all(0),
                                            color: colorMain,
                                            iconSize: 20,
                                            icon: new Icon(
                                              Icons.phone,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ClipOval(
                                    child: Material(
                                      color: UiColors.grey, // button color
                                      child: InkWell(
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: IconButton(
                                            padding: EdgeInsets.all(0),
                                            color: colorMain,
                                            iconSize: 20,
                                            icon: new Icon(
                                              Icons.play_arrow,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Gulshan Banglow",
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "(Karachi Pakistan)",
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: UiColors.primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('5',
                                  style: TextStyle(
                                      color: UiColors.black,
                                      fontWeight: FontWeight.bold)),
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 46.0,
                                        height: 38.0,
                                        alignment: Alignment.center,
                                        decoration: new BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(UiStrings.beds),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Beds',
                                      style: TextStyle(
                                        color: UiColors.lighrgrey,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('5',
                                  style: TextStyle(
                                      color: UiColors.black,
                                      fontWeight: FontWeight.bold)),
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 46.0,
                                        height: 38.0,
                                        alignment: Alignment.center,
                                        decoration: new BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  UiStrings.washrrom_icon),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Bathrooms',
                                      style: TextStyle(
                                        color: UiColors.lighrgrey,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('240',
                                  style: TextStyle(
                                      color: UiColors.black,
                                      fontWeight: FontWeight.bold)),
                              Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 46.0,
                                        height: 38.0,
                                        alignment: Alignment.center,
                                        decoration: new BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  UiStrings.sqft_big),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Square Ft',
                                      style: TextStyle(
                                        color: UiColors.lighrgrey,
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  color: UiColors.primaryColor,
                  child: SizedBox(
                    height: 25,
                    width: double.infinity,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            'How much home you can afford?',
                            style: TextStyle(color: UiColors.white),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.centerLeft,
                                    width: 32,
                                    height: 20,
                                    child: Image.asset(UiStrings.new_icon)),
                                Text('New',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: UiColors.black,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.centerLeft,
                                    width: 32,
                                    height: 20,
                                    child: Image.asset(UiStrings.list_today)),
                                Text('Listed Today',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: UiColors.black,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.centerLeft,
                                    width: 32,
                                    height: 20,
                                    child: Image.asset(UiStrings.bulit)),
                                Text('Built in 1987',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: UiColors.black,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.centerLeft,
                                    width: 32,
                                    height: 20,
                                    child: Image.asset(UiStrings.squate_ft)),
                                Text('PKR 1 lac per sq ft',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: UiColors.black,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.centerLeft,
                                    width: 32,
                                    height: 20,
                                    child: Image.asset(UiStrings.ask_broker)),
                                Text('Style Ask broker  ',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: UiColors.black,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.centerLeft,
                                    width: 32,
                                    height: 20,
                                    child: Image.asset(UiStrings.bulit)),
                                Text('Single Family',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: UiColors.black,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'View More Details',
                    style: TextStyle(color: UiColors.primaryColor),
                  ),
                ),
                contactBroketForDeatilsWidget(),
                Divider(
                  color: UiColors.greyLight,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Ask About this property',
                                  style: TextStyle(
                                    color: UiColors.black,
                                  ))
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              Image.asset(UiStrings.map_icon),
                              SizedBox(
                                width: 15,
                              ),
                              Text('View Map',
                                  style: TextStyle(
                                    color: UiColors.primaryColor,
                                  ))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.asset(UiStrings.call_icon),
                              SizedBox(
                                width: 15,
                              ),
                              Text('(+92) 30045677',
                                  style: TextStyle(
                                    color: UiColors.primaryColor,
                                  ))
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              Image.asset(UiStrings.car_icon),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Directions',
                                  style: TextStyle(
                                    color: UiColors.primaryColor,
                                  ))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: UiColors.greyLight,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10, right: 20.0),
                      child: Text(
                        'Overview',
                        style: TextStyle(
                            color: UiColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 5, right: 20.0),
                      child: Text(
                        widget.post.info.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
//                    Align(
//                      alignment: Alignment.bottomRight,
//                      child: Padding(
//                          padding: const EdgeInsets.only(right: 20.0),
//                          child: Text(
//                            '... more',
//                            style: TextStyle(color: UiColors.primaryColor),
//                          )),
//                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 10, right: 20.0),
                              child: Text(
                                'Monthly Cost',
                                style: TextStyle(
                                    color: UiColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Row(
                            children: <Widget>[
                              Image.asset(UiStrings.edit_icon),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Edit',
                                  style: TextStyle(
                                    color: UiColors.primaryColor,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    chartWidget(),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Last Price",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: UiColors.lighttxtxolor,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text("PKR 2.5 CORE",
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text("PKR 40,980 DOWN",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: UiColors.lighttxtxolor,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text("30 yr fixed at 4.763%",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: UiColors.lighttxtxolor,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: false,
                    onChanged: (bool value) {},
                  ),
                  Text(
                    'Apply Veteran Benefits',
                    style: TextStyle(color: UiColors.lighttxtxolor),
                  )
                ],
              ),
            ),
            getPerApprovedWidget(),
            postingUserDetails(),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text('Check Mortgage Rates',
                  style: TextStyle(
                      color: UiColors.lighttxtxolor,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
              child: Row(
                children: <Widget>[
                  propertySold(),
                  SizedBox(
                    width: 10,
                  ),
                  contactBrokerWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bottomBar(DateTime jobPostingdTime) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: smokeybgColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.post.info.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.post.info.unitId + " " + widget.post.info.unitTitle,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 18,
                      width: 18,
                      child: SvgPicture.asset('assets/calendar.svg')),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "posted ",
                    style: TextStyle(color: smokeyColor, fontSize: 11.0),
                  ),
                  Text(
                    timeago.format(jobPostingdTime, locale: 'en'),
                    style: TextStyle(color: smokeyColor, fontSize: 11.0),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  postingUserDetails() {
    return Column(
      children: <Widget>[
        Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                    imageUrl: widget.baseUrl + widget.post.info.userImg,
                    placeholder: (context, url) => Container(
                          height: 100,
                          width: 100,
                          child: new CircularProgressIndicator(
                            backgroundColor: colorMain,
                          ),
                        ),
                    errorWidget: (context, url, error) => SvgPicture.asset(
                          defaultUserImage,
                          height: 40,
                          width: 40,
                        )))),
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "${widget.post.info.userFullName}",
            style: TextStyle(letterSpacing: 2.0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "${widget.post.info.companyTitle}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            widget.post.info.companyVerificationStatus == "Verified"
                ? Icon(
                    Icons.verified_user,
                    size: 15,
                    color: colorMain,
                  )
                : Container()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 40,
              child: IconTheme(
                  data: IconThemeData(
                    color: Colors.amber,
                    size: 15,
                  ),
                  child: StarRating(
                      rating: 3,
                      starConfig: StarConfig(fillColor: colorMain, size: 15
                          // other props
                          ))),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "(${widget.post.info.companyNoOfReviews} Reviews)",
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  topSliderWidget() {
    return Container(
        child: CarouselSlider(
      height: 220,
      viewportFraction: 1.0,
      items: [widget.baseUrl + widget.post.info.thumbnail].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  child: CachedNetworkImage(
                      height: 190,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      imageUrl: i,
                      placeholder: (context, url) =>
                          dummyCoverImage(context, true),
                      errorWidget: (context, url, error) =>
                          dummyCoverImage(context, false))),

//                      Stack(children: <Widget>[
//
//                       /* Align(
//                          alignment: Alignment.bottomRight,
//                          child: Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: ClipOval(
//                              child: Material(
//                                color: Colors.white, // button color
//                                child: InkWell(
//                                  child: SizedBox(
//                                      width: 46,
//                                      height: 46,
//                                      child: Icon(
//                                        Icons.favorite,
//                                        color: UiColors.primaryColor,
//                                      )),
//                                  onTap: () {},
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),*/
//                      ])),
            );
          },
        );
      }).toList(),
    ));
  }

  chartWidget() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 260,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            charts.PieChart(_seriesPieData,
                animate: true,
                animationDuration: Duration(seconds: 5),
                behaviors: [
                  new charts.DatumLegend(
                    outsideJustification:
                        charts.OutsideJustification.endDrawArea,
                    horizontalFirst: false,
                    desiredMaxRows: 3,
                    showMeasures: false,
                    cellPadding: new EdgeInsets.only(right: 2.0, bottom: 2.0),
                    entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.black,
                        fontFamily: 'Georgia',
                        fontSize: 10),
                  )
                ],
                defaultRenderer: new charts.ArcRendererConfig(
                    arcWidth: 30,
                    arcRendererDecorators: [
                      new charts.ArcLabelDecorator(
                          labelPadding: 2,
                          labelPosition: charts.ArcLabelPosition.outside,
                          insideLabelStyleSpec: new charts.TextStyleSpec(
                              fontSize: 12, color: charts.Color.black))
                    ])),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 55,
                  ),
                  Text("PKR 1 LAC",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text("MONTH",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getPerApprovedWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
      child: Container(
        height: height40,
        width: double.infinity,
        child: MaterialButton(
          highlightColor: UiColors.blue,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Get Pre-Approved",
                style: TextStyle(
                    color: UiColors.primaryColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(
              color: UiColors.primaryColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }

  contactBroketForDeatilsWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
      child:
      Container(
        height: height40,
        width: double.infinity,
        child: MaterialButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "CONTACT BROKER FOT DETAILS",
                style: TextStyle(
                    color: UiColors.primaryColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(
              color: UiColors.primaryColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }

  contactBrokerWidget() {
    return Expanded(
      child: MaterialButton(
        color: UiColors.primaryColor,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Contact Broker",
              style:
                  TextStyle(color: UiColors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(
            color: UiColors.primaryColor,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }

  imagesListWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 120,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              child: Material(
                elevation: 5,
                shadowColor: colorMain.withOpacity(.05),
                child: CachedNetworkImage(
                    height: 120,
                    fit: BoxFit.cover,
                    width: 130,
                    imageUrl: widget.baseUrl + widget.post.info.thumbnail,
                    placeholder: (context, url) =>
                        dummyCoverImage(context, true),
                    errorWidget: (context, url, error) =>
                        dummyCoverImage(context, false)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  actionsWidgets() {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage(UiStrings.list_icon),
          ),
          SizedBox(
            width: 2,
          ),
          Image(
            image: AssetImage(UiStrings.chat_icon),
          ),
          SizedBox(
            width: 2,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Image.asset(
              UiStrings.user,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 2,
          ),
        ],
      ),
    );
  }

  appbarSearch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        SizedBox(
          height: 29,
          width: 29,
          child: Image(
            image: AssetImage(UiStrings.nav_sidebar),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
            child: Container(
          height: height40,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextFormField(
              //controller: passController,
              decoration: InputDecoration(
                hintText: 'Search Broker',
                prefixIcon: Container(
                  margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        bottomLeft: Radius.circular(32.0)),
                    boxShadow: [
                      BoxShadow(color: UiColors.primaryColor, spreadRadius: 3),
                    ],
                  ),
                  child: Icon(
                    Icons.search,
                    size: prefixIconSize,
                    color: Colors.white,
                  ),
                ),
                contentPadding: EdgeInsets.all(0.0),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                    borderSide: BorderSide(color: colorMain, width: 2.0)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0),
                ),
              ),
            ),
          ),
        )),
      ]),
    );
  }

  propertySold() {
    return Expanded(
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Property Sold",
              style: TextStyle(
                  color: UiColors.primaryColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(
            color: UiColors.primaryColor,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}

class PhotoCarouselIndicator extends StatelessWidget {
  final int photoCount;
  final int activePhotoIndex;

  PhotoCarouselIndicator({
    @required this.photoCount,
    @required this.activePhotoIndex,
  });

  Widget _buildDot({bool isActive}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: isActive ? 7.5 : 6.0,
          width: isActive ? 7.5 : 6.0,
          decoration: BoxDecoration(
            color: isActive ? Colors.blue : colorMain,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(photoCount, (i) => i)
          .map((i) => _buildDot(isActive: i == activePhotoIndex))
          .toList(),
    );
  }
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}
