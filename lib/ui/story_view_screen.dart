import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/models/stories_model.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:story_view/story_view.dart';

class MoreStories extends StatefulWidget {
  var storyImage;
  var userImg;
  Datum storiesModel;

  MoreStories({this.storyImage, this.storiesModel, this.userImg});

  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 1.1;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 80,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              width: 40,
                              height: 40,
                              imageUrl: widget.userImg,
                              placeholder: (context, url) => Container(
                                height: 40,
                                width: 40,
                                child: new CircularProgressIndicator(
                                  backgroundColor: colorMain,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  SvgPicture.asset(
                                    defaultUserImage,
                                    height: 40,
                                    width: 40,
                                  )))),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.storiesModel.userFullName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(left: 5.0, top: 2)),
                      Text(
                        "4 minutes ago",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: StoryView(
                storyItems: [
                  StoryItem.pageImage(
                    url: widget.storyImage,
                    controller: storyController,
                  ),
                ],
                onStoryShow: (s) {
                  print("Showing a story");
                },
                onComplete: () {
                  Navigator.of(context).pop();
                },
                progressPosition: ProgressPosition.top,
                repeat: false,
                controller: storyController,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Container(
                      height: 60,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // storyController.pause();
                              },
                              child: Container(
                                child: TextFormField(
                                  style: TextStyle(fontSize: 12),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Send message',
                                    hintStyle: TextStyle(color: Colors.black),
                                    contentPadding: EdgeInsets.all(10.0),
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            const Radius.circular(32.0)),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          CircleAvatar(
                            backgroundColor: colorMain,
                            child: new IconButton(
                              icon: new Icon(Icons.send),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  inputTextFeildAndSubmitButton(double width) {
    final roundedContainer = TextFormField(
      style: TextStyle(fontSize: 12),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: false,
        fillColor: Colors.white,
        hintText: 'Send message',
        hintStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.all(10.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(const Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.white, width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
    );
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0, right: 8.0, left: 8.0, top: 8.0),
      child: Container(
        height: 100,
        child: Row(
          children: <Widget>[
            Container(
              height: height40,
              width: width,
              child: roundedContainer,
            ),
            SizedBox(
              width: 5.0,
            ),
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: colorMain,
                child: new IconButton(
                  icon: new Icon(Icons.send),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}