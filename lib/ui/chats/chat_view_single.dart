import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/models/chat_general_model.dart';
import 'package:flutterapp/models/message_model.dart';
import 'package:flutterapp/models/online_persons_chat_model.dart';
import 'package:flutterapp/utills/chat_appbar.dart';
import 'package:flutterapp/utills/config.dart';
import 'dart:ui';


class ChatViewSingle extends StatefulWidget {
  InfoElement userData;
  String imageurl;
  double width = 0, height = 60;

  ChatViewSingle({this.userData, this.width, this.height, this.imageurl});

  @override
  _ChatViewSingleState createState() => _ChatViewSingleState();
}

class _ChatViewSingleState extends State<ChatViewSingle> {
  var loggedinUserId;

  @override
  void initState() {
    if (widget.width == 0) {
      widget.width = MediaQuery.of(context).size.width;
    }
    getloggedinuserid();
    Config.getUserID().then((value) {
      setState(() {
        loggedinUserId = value;
      });
    });
    super.initState();
  }

  getloggedinuserid() async{
    loggedinUserId = await Config.getUserID();
    print('login user id ::$loggedinUserId');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppBar(height: 97, userData: widget.userData,url:widget.imageurl),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScrollConfiguration(
                      behavior: new ScrollBehavior()
                        ..buildViewportChrome(
                            context, null, AxisDirection.down),
                      child: ListView.builder(
                          itemCount: dummc.length,
                          itemBuilder: (context, i) {
                            return loggedinUserId == dummc[i].id
                                ? getsendingMessageLayout(context)
                                : getRecivedMessageLayout();
                          }),
                    )),
              ),
            ),
            inputTextFeildAndSubmitButton()
          ],
        ),
      ),
    );
  }

  getRecivedMessageLayout() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child:Container(
              child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(50.0),
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 30,
                      height: 30,
                      imageUrl:'https://images.pexels.com/photos/91224/pexels-photo-91224.jpeg',
                      placeholder: (context, url) =>
                          Container(
                            height: 30,
                            width: 30,
                            child:
                            new CircularProgressIndicator(
                              backgroundColor:
                              colorMain,
                            ),
                          ),
                      errorWidget:
                          (context, url, error) =>
                          SvgPicture.asset(
                            defaultUserImage,
                            height: 30,
                            width: 30,
                          ))
              )
          ),


        ),
        SizedBox(
          width: 5,
        ),
        Bubble(
          margin: BubbleEdges.only(top: 10),
          alignment: Alignment.topLeft,
          nip: BubbleNip.leftTop,
          color: smokeybgColor,
          child: Container(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Lorem Ipsum is simply dfsaf sfs sfs scs ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      "10:20 PM",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.black26, fontSize: 11),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  getsendingMessageLayout(context) {
    return Bubble(
      margin: BubbleEdges.only(top: 10),
      alignment: Alignment.topRight,
      nip: BubbleNip.rightBottom,
      color: Color.fromRGBO(225, 255, 199, 1.0),
      child: Container(
        width: 250,
        child: Column(
          children: <Widget>[
            Text(
              "Lorem Ipsum is simply dummy text of the p dfdsf fsfsfsfs ",
              style: TextStyle(color: Colors.black),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  "10:20 PM",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.black26, fontSize: 11),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  receivingMsg(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          margin: EdgeInsets.fromLTRB(10, 5, 50, 5),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              border: Border.all(
                  width: 1, color: colorMain, style: BorderStyle.solid)),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has bee. ",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "10:30 PM",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  inputTextFeildAndSubmitButton() {
    final roundedContainer = Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28.0),
          border: Border.all(color: smokeybgColor)),
      child: Row(
        children: <Widget>[
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: () {

              showBottomSheet();

/*              showCupertinoModalBottomSheet(
                expand: false,
                context: context,
                bounce: true,
                barrierColor: Colors.black26,
                builder: (context, scrollController) =>
                    PhotoShareBottomSheet(scrollController: scrollController),
              );*/
            },
            child: Icon(Icons.attach_file,
                size: 30.0, color: Theme.of(context).hintColor),
          ),
          SizedBox(width: 8.0),
          Icon(Icons.camera_alt,
              size: 30.0, color: Theme.of(context).hintColor),
          SizedBox(width: 8.0),
        ],
      ),
    );
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0, right: 8.0, left: 8.0, top: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
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
                icon: new Icon(Icons.mic),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  showBottomSheet(){
    final action = CupertinoActionSheet(

      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Container(
            height: 280,
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),

              itemBuilder: (context, index) {
                final app = apps[index];
                return Container(
                    width: 72,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap:(){
                          print(app.title);
                          },
                          child: Material(
                            child: ClipRRect(
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(app.imageUrl),
                                        fit: BoxFit.cover),
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10)),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 12,
                            shadowColor: Colors.black12,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          app.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 11,color: Colors.black87),
                        )
                      ],
                    ));
              },
              itemCount: apps.length,
            ),
          ),

        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel",style: TextStyle(
          color: colorMain,
          fontWeight: FontWeight.w600
        ),),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop("Discard");

        },
      ),
    );
    showCupertinoModalPopup(
        context: context, builder: (context) => action);
  }
}
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
class PhotoShareBottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  const PhotoShareBottomSheet({Key key, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      child: Material(
          color: Colors.transparent,
          child: Scaffold(
            backgroundColor: smokeybgColor,
            body: CustomScrollView(
              physics: ClampingScrollPhysics(),
              controller: scrollController,
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(top: 12),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    height: 360,
                    padding: EdgeInsets.only(top: 12),
                    child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 5.0, mainAxisSpacing: 5.0),

                      itemBuilder: (context, index) {
                        final app = apps[index];
                        return Container(
                            width: 72,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: Column(
                              children: <Widget>[
                                Material(
                                  child: ClipRRect(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(app.imageUrl),
                                                fit: BoxFit.cover),
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 12,
                                  shadowColor: Colors.black12,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  app.title,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 11),
                                )
                              ],
                            ));
                      },
                      itemCount: apps.length,
                    ),
                  ),
                ),

                SliverSafeArea(
                  top: false,
                  sliver: SliverPadding(
                      padding: EdgeInsets.only(
                    bottom: 20,
                  )),
                )
              ],
            ),
          )),
    );
  }
  Widget sliverContactsSection(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 132,
        padding: EdgeInsets.only(top: 12),
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final person = people[index];
            return Container(
              width: 72,
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: <Widget>[
                  Material(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        person.imageUrl,
                      ),
                      radius: 30,
                      backgroundColor: Colors.white,
                    ),
                    shape: CircleBorder(),
                    elevation: 12,
                    shadowColor: Colors.black12,
                  ),
                  SizedBox(height: 8),
                  Text(
                    person.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
            );
          },
          itemCount: people.length,
        ),
      ),
    );
  }
  PreferredSizeWidget appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 64),
      child: Container(
        decoration: BoxDecoration(
          color: smokeybgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text('Select Attachment',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(height: 4),
                  /* GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 14),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          size: 22,
                          color: colorMain,
                        ),
                      ),
                    ),
                  ),*/
                  SizedBox(width: 12),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String title;
  final String imageUrl;

  Item(this.title, this.imageUrl);
}

final people = [
  Item('MacBook Pro', 'assets/MacBook.jpg'),
  Item('Jaime Blasco', 'assets/jaimeblasco.jpeg'),
  Item('Mya Johnston', 'assets/person1.jpeg'),
  // https://images.unsplash.com/photo-1520813792240-56fc4a3765a7'
  Item('Maxime Nicholls', 'assets/person4.jpeg'),
  //https://images.unsplash.com/photo-1568707043650-eb03f2536825'
  Item('Susanna Thorne', 'assets/person2.jpeg'),
  //https://images.unsplash.com/photo-1520719627573-5e2c1a6610f0
  Item('Jarod Aguilar', 'assets/person3.jpeg')
  //https://images.unsplash.com/photo-1547106634-56dcd53ae883
];

final apps = [
  Item('Property', 'assets/message.png'),
  Item('Project', 'assets/github_app.png'),
  Item('Job', 'assets/slack.png'),
  Item('News', 'assets/twitter.png'),
  Item('Brokers', 'assets/mail.png'),
  Item('Pictures', 'assets/message.png'),
  Item('Location', 'assets/github_app.png'),
  Item('Documents', 'assets/slack.png'),
  Item('Option1', 'assets/twitter.png'),
  Item('Option2', 'assets/mail.png'),
];
final apps1 = [
  Item('Pictures', 'assets/message.png'),
  Item('Location', 'assets/github_app.png'),
  Item('Documents', 'assets/slack.png'),
  Item('Option1', 'assets/twitter.png'),
  Item('Option2', 'assets/mail.png'),
];
final actions = [
  Item('Photo & Video Library', null),
];
final actions1 = [
  Item('Document', null),
  Item('Location', null),
  Item('Contact', null),
];

final actions2 = [
  Item('Create Watch', null),
  Item('Save to Files', null),
  Item('Asign to Contact', null),
  Item('Print', null),
];

extension ListUtils<T> on List<T> {
  List<T> addItemInBetween<T>(T item) => this.length == 0
      ? this
      : (this.fold([], (r, element) => [...r, element as T, item])
        ..removeLast());
}

class SimpleSliverDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  SimpleSliverDelegate({
    this.child,
    this.height,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(height: height, child: child);
  }

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }


}
