import 'package:flutter/material.dart';
import 'package:flutterapp/ui/avatar_widget.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutterapp/utills/UiColors.dart';

class AuctionDetail extends StatefulWidget {
  @override
  _AuctionDetailState createState() => _AuctionDetailState();
}

class _AuctionDetailState extends State<AuctionDetail> {
  final _textController = TextEditingController();
  bool _canPost = false;

  var imgUrl =
      "https://cdn.carrot.com/uploads/sites/15714/2016/12/how-to-auction-your-house-easy-sale-today.jpg";
  var posteCreatedTime = DateTime.now()
      .subtract(Duration(minutes: 59, seconds: 2, hours: 23, days: 2));
  var title = "Foreign buyers are turning their back on";

  var description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce euismod dolor libero, at mattis purus egestas ac. Duis sollicitudin lacus in molestie fringilla. Ut quis maximus eros. Phasellus eleifend, tortor eu varius imperdiet, nisl quam dapibus dolor, eu gravida ligula est a mauris. Mauris elementum malesuada maximus. Nulla molestie est sed ipsum tristique interdum. Integer sit amet arcu nulla. Aliquam sed dictum diam. Vivamus non metus ullamcorper, porta erat a, bibendum ante. Vestibulum aliquam mi sed dui consequat, nec imperdiet metus vestibulum. Ut euismod ultricies aliquet.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorMain,
          title: Text('Aution Detail'),
          titleSpacing: 0.0,
          elevation: 0.0,
          actions: actionWidgets(context),
          bottom: PreferredSize(
            preferredSize: null,
            child: Container(
              height: 1,
              color: colorDivider,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: colorMain,
              height: 181,
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "$title",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: UiColors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TimerApp(),
                            )
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(vertical: 8.0),
                            //   child: Text(
                            //     "$description",
                            //     overflow: TextOverflow.ellipsis,
                            //     textAlign: TextAlign.start,
                            //     maxLines: 3,
                            //     style: TextStyle(
                            //       color: UiColors.white,
                            //       fontSize: 12.0,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: UiColors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: UiColors.white,
                            ),
                            borderRadius: BorderRadius.circular(3.0)),
                        child: Text(
                          "Current Bid : 20000000",
                          style: TextStyle(fontSize: 12, color: UiColors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: UiColors.white,
                            ),
                            borderRadius: BorderRadius.circular(3.0)),
                        child: Text(
                          "Start Bid : 500000",
                          style: TextStyle(fontSize: 12, color: UiColors.white),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Posted Date : 25 Aug 2020",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: UiColors.white,
                          ),
                        ),
                        Container(
                          height: 15,
                          width: 2,
                          color: colorDivider,
                        ),
                        Text(
                          "Expiry Date : 6 Sep 2020",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: UiColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            commentsListWidget(),
            commentInputWidget()
          ],
        ));
  }

  commentInputWidget() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, top: 0.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration:
                ShapeDecoration(shape: CircleBorder(), color: Colors.white),
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      imageUrl:
                          "https://truckerhangout.com/storage/app/public/user/images/uzair.jpg",
                      placeholder: (context, url) =>
                          new CircularProgressIndicator(
                        backgroundColor: colorMain,
                      ),
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        defaultUserImage,
                        color: Colors.black,
                        height: 40,
                        width: 40,
                      ),
                    ))),
          ),
          Flexible(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: commonetTextFiled()),
          ),
        ],
      ),
    );
  }

  commonetTextFiled() {
    return Stack(
      alignment: Alignment.topRight,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          height: height40,
          child: TextFormField(
            keyboardType: TextInputType.number,
            maxLines: 1,
            style: TextStyle(fontSize: 12),
            controller: _textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: UiColors.divider, width: 1.0)),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: InkWell(
                onTap: () {
                  // if (_textController.text.isNotEmpty) {
                  //   if (!isUpdateComment)
                  //     sendComment(_textController.text);
                  //   else
                  //     updateComment(_textController.text);
                  // }
                },
                child: Container(
                  child: Opacity(
                    opacity: _canPost ? 1.0 : 0.2,
                    child: Icon(
                      Icons.send,
                      color: _canPost ? colorMain : lighrgrey,
                    ),
                  ),
                ),
              ),
              hintText: "Bid must be higher than current bid value",
              hintStyle: TextStyle(color: UiColors.divider, fontSize: 12),
              contentPadding: EdgeInsets.only(left: 10),
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: UiColors.divider, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: UiColors.divider, width: 1.0)),
            ),
          ),
        ),
      ],
    );
  }

  minBidText() {
    return Container(
      width: 120,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colorDivider,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Min Bid',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Text(
            '100',
            style: TextStyle(color: Colors.black, fontSize: 10),
          ),
        ],
      ),
    );
  }

  commentsListWidget() {
    return Flexible(
      child: ScrollConfiguration(
        behavior: new ScrollBehavior()
          ..buildViewportChrome(context, null, AxisDirection.down),
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            return commentsListItem(i);
          },
          itemCount: 10,
          physics: const AlwaysScrollableScrollPhysics(),
        ),
      ),
    );
  }

  commentsListItem(index) {
    // var commentCreatedTime = DateTime.now().subtract(Duration(
    //     minutes: post.createdAt.minute,
    // jjjjjjjjjjjjjjjjjjjj    seconds: post.createdAt.second,
    //     hours: post.createdAt.hour));

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: GestureDetector(
        onLongPress: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AvatarWidget(
                    imgUrl:
                        "https://truckerhangout.com/storage/app/public/user/images/uzair.jpg",
                    padding: EdgeInsets.only(right: 0.0),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                      decoration: BoxDecoration(
                          color: halfWhite,
                          border: Border.all(
                            color: halfWhite,
                          ),
                          borderRadius: BorderRadius.circular(32.0)),
                      child: Text("Bid Value : " + (50000 * index).toString()),
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 0,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 40,
                ),
                Text(
                  "2 days ago",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 10,
                    color: smokeyColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
