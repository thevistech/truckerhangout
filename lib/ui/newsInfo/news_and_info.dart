import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';

class NewsAndInformation extends StatefulWidget {
  var currentUserImage;
  NewsAndInformation({this.currentUserImage});
  @override
  _NewsAndInformationState createState() => _NewsAndInformationState();
}

class _NewsAndInformationState extends State<NewsAndInformation> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        title: Text('News And Blogs'),
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
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS6wHc3OzKebPw9iQ9NMcjKRHSxIFKN2Ds2LQ&usqp=CAU";
              var title = "Foreign buyers are turning their back on";
              var description =
                  "Foreigners are buying less real estate in the United States, and sluggish global economic growth is to blame";
              var posteCreatedTime = DateTime.now().subtract(
                  Duration(minutes: 59, seconds: 2, hours: 23, days: 2));
              return postUiDesign(
                  context: ctx,
                  postUserImage: widget.currentUserImage,
                  postUserfullName: "Uzair",
                  postUsercompanyTitle: "The Vistech",
                  carosalImage: imgUrl,
                  title: title,
                  description: description,
                  jobPostingdTime: posteCreatedTime);
            }),
      ),
    );
  }

  cardBackground() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        "assets/news_and_info_demo_image.png",
        fit: BoxFit.fill,
      ),
    );
  }

  topButtons() {
    return Positioned.fill(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[300],
                    shape: BoxShape.rectangle),
                child: Text("5 DAYS AGO", style: TextStyle())),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.grey[300], shape: BoxShape.circle),
              child: Icon(
                Icons.favorite_border,
                size: suffixIconSize,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  bottomBar() {
    return Positioned.fill(
        child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100,
        margin: EdgeInsets.only(bottom: 15.0),
        color: Colors.black.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Foreign buyers are turning their back on",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Foreigners are buying less real estate in the United States, and sluggish global economic growth is to blame",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
