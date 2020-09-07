import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutterapp/models/stories_model.dart';
import 'package:flutterapp/ui/property_detail_screen.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/start_rating_widget.dart';

class RcustomDialog extends StatelessWidget {
  Datum stories;
  String profilePicUrl;
  RcustomDialog({this.stories, this.profilePicUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      alignment: Alignment.center,
      child: SingleChildScrollView(
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Consts.radiusBorder),
                  topRight: Radius.circular(Consts.radiusBorder),
                  bottomLeft: Radius.circular(Consts.radiusBorder),
                  bottomRight: Radius.circular(Consts.radiusBorder)),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: dialogContent(context),
          )),
    );
  }

  dialogContent(BuildContext context) {
    return ContainerWithCircle(
        stories: stories, profilePicUrl: profilePicUrl);
  }
}

class Consts {
  Consts._();

  static const double radiusBorder = 5.0;
  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class ContainerWithCircle extends StatefulWidget {
  Datum stories;
  String profilePicUrl;
  ContainerWithCircle({this.stories, this.profilePicUrl});

  @override
  _ContainerWithCircleState createState() => _ContainerWithCircleState();
}

class _ContainerWithCircleState extends State<ContainerWithCircle>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  final double circleRadius = 100.0;

  final double circleBorderWidth = 8.0;
  double buy = 0.0;
  double sell = 0.0;
  double rent = 0.0;
  double deal = 0.0;
  double dealCancel = 0.0;

  bool ifPieChartIsEmpty = false;

  List<charts.Series<Task, String>> _seriesPieData;

  _generateData(buy, sell, rent, deal, dealCancel) {
    var piedata = [
      new Task('Buy', buy, colorMain),
      new Task('Sell', sell, colorLoadingRed),
      new Task('Rent', rent, colorLoadingLightBlue),
      new Task('Deal', deal, colorExpandableFill),
      new Task('Deal Cancel', dealCancel, Color(0xffD2D2D2)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.task}',
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

  controller.addListener(() {
      setState(() {});
    });

   controller.forward();
//
//    _seriesPieData = List<charts.Series<Task, String>>();
//    buy = double.tryParse(widget.brokersList.noOfBuy);
//    sell = double.tryParse(widget.brokersList.noOfSell);
//    rent = double.tryParse(widget.brokersList.noOfRent);
//    deal = double.tryParse(widget.brokersList.noOfDeal);
//    dealCancel = double.tryParse(widget.brokersList.noOfDealCancel);
//
    if (buy == 0.0 &&
        sell == 0.0 &&
        rent == 0.0 &&
        deal == 0.0 &&
        dealCancel == 0.0)
      ifPieChartIsEmpty = true;
    else
      ifPieChartIsEmpty = false;

//    _generateData(buy, sell, rent, deal, dealCancel);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: circleRadius / 2.0),
            child: Container(
              //replace this Container with your Card
              color: Colors.white,
              height: 375.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 30.0, top: 25.0),
                            child: Icon(
                              Icons.call,
                              color: colorMain,
                              size: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 30.0, top: 25.0),
                            child: Icon(
                              Icons.chat,
                              color: colorMain,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "${widget.stories.userDisplayName}",
                      style: TextStyle(letterSpacing: 2.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "${widget.stories.companyTitle}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      widget.stories.companyVerificationStatus == "Verified"
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
                        child: IconTheme(
                          data: IconThemeData(
                            color: Colors.amber,
                            size: 15,
                          ),
                          child: StarDisplay(
                              value: int.tryParse(
                                  "${6}")),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "(${3} Reviews)",
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        Divider(
                          color: colorDivider,
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "${23}",
                                  ),
                                  Text(
                                    "Followers",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "${23}",
                                  ),
                                  Text(
                                    "Following",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: colorDivider,
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.home, size: 18, color: colorMain),
                        ),
                        Expanded(
                          child: Text(
                            "${widget.stories.companySlug}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.location_city,
                              size: 18, color: colorMain),
                        ),
                        Expanded(
                          child: Text(
                            "${widget.stories.companySince}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //ifPieChartIsEmpty ? Container() : chartWidget(),
                ],
              ),
            ),
          ),
          Container(
            width: circleRadius,
            height: circleRadius,
            decoration:
            ShapeDecoration(shape: CircleBorder(), color: Colors.white),
            child: Padding(
                padding: EdgeInsets.all(circleBorderWidth),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                        imageUrl: widget.profilePicUrl,
                        placeholder: (context, url) =>
                        new CircularProgressIndicator(
                          backgroundColor: colorMain,
                        ),
                        errorWidget: (context, url, error) => SvgPicture.asset(
                          defaultUserImage,
                          height: 50,
                          width: 50,
                        )))
            ),
          ),
          Positioned(
            bottom: 1.0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                child: closeButtonWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  closeButtonWidget() {
    return Container(
      height: 20,
      // width: width,
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        padding: EdgeInsets.all(0),
        color: colorMain,
        textColor: Colors.white,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Close',
                style: TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
            side: BorderSide(color: colorMain)),
      ),
    );
  }

  chartWidget() {
    return Container(
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          charts.PieChart(_seriesPieData,
              animate: true,
              animationDuration: Duration(seconds: 2),
              behaviors: [
                new charts.DatumLegend(
                  outsideJustification:
                  charts.OutsideJustification.startDrawArea,
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
                  arcWidth: 15,
                  arcRendererDecorators: [
                    new charts.ArcLabelDecorator(
                        labelPadding: 2,
                        labelPosition: charts.ArcLabelPosition.outside,
                        insideLabelStyleSpec: new charts.TextStyleSpec(
                            fontSize: 10, color: charts.Color.black))
                  ])),
        ],
      ),
    );
  }
}
