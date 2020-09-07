import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:lottie/lottie.dart';

class AuctionScreen extends StatefulWidget {
  var userImage;
  AuctionScreen({this.userImage});
  @override
  _ComingSoonScreenState createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<AuctionScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: colorMain,
        title: Text('Auctions'),
        titleSpacing: 0.0,
        actions: actionWidgets(context),
      ),
      body: Container(
        height: height,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (ctx, int) {
              var imgUrl =
                  "https://cdn.carrot.com/uploads/sites/15714/2016/12/how-to-auction-your-house-easy-sale-today.jpg";
              var title = "Foreign buyers are turning their back on";
              var description =
                  "Foreigners are buying less real estate in the United States, and sluggish global economic growth is to blame";
              var posteCreatedTime = DateTime.now().subtract(
                  Duration(minutes: 59, seconds: 2, hours: 23, days: 2));
              return postUiDesign(
                  context: ctx,
                  postUserImage:
                      "https://truckerhangout.com/storage/app/public/user/images/uzair.jpg",
                  postUserfullName: "Uzair",
                  postUsercompanyTitle: "The Vistech",
                  carosalImage: imgUrl,
                  title: title,
                  description: description,
                  jobPostingdTime: posteCreatedTime,
                  auctionTimerEndDate: "sd");
            }),
      ),
    );
  }
}
