import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/shimmer/messagesListView.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/sliver_container.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ShareBottomSheet extends StatefulWidget {
  final ScrollController scrollController;
  final DashBoardMainStore dashBoardMainStore;
  final String imageUrl;

  const ShareBottomSheet({Key key, this.scrollController,this.dashBoardMainStore,this.imageUrl}) : super(key: key);

  @override
  _PhotoShareBottomSheetState createState() => _PhotoShareBottomSheetState();
}

class _PhotoShareBottomSheetState extends State<ShareBottomSheet> {
  final _textController = TextEditingController();
  var currentUserImage = "";

  @override
  void initState() {
    Config.getUserProfilePicture().then((value) {
      setState(() {
        currentUserImage = value;
      });
    });

    print(widget.dashBoardMainStore.filterPropertyModel.data.friends.data.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: UiColors.white,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(167.0),
              child: AppBar(
                backgroundColor: UiColors.white,
                automaticallyImplyLeading: false, // hides leading widget
                elevation: 0.0,
                flexibleSpace: Container(
                  height: 167,
                  color: UiColors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: UiColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Send To',style: TextStyle(fontSize: 16,color: colorMain),),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: colorDivider,
                      ),
                      MessageTextFiled(),
                      Divider(
                        height: 1,
                        color: colorDivider,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      searchWidget()
                    ],
                  ),
                ),
              ),
            ),
          body: Observer(
            builder: (_) => widget.dashBoardMainStore.filterPropertyModel!=null?ListView.builder(
              controller: widget.scrollController,
              itemBuilder: (context, index) {
                return usersList(index);
              },
              itemCount:widget.dashBoardMainStore.filterPropertyModel.data.friends.data.length,
            ):shimmerMessagesListView(context),
          ),
        ),
      ),
    );
  }

  MessageTextFiled() {
    return Container(
      color: UiColors.white,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 40),
            height: 50,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              style: TextStyle(fontSize: 12),
              controller: _textController,
              decoration: InputDecoration(
                filled: true,
                fillColor: UiColors.white,
                hintText: "Write message",
                hintStyle: TextStyle(color: UiColors.divider, fontSize: 12),
                contentPadding: EdgeInsets.all(10),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(0.0)),
                    borderSide: BorderSide(color: UiColors.white, width: 0.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(0.0)),
                    borderSide: BorderSide(color: UiColors.white, width: 0.0)),
              ),
            ),
          ),
          userAvatar(),
        ],
      ),
    );
  }

  userAvatar() {
    return Container(
      color: UiColors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            child: Padding(
                padding: EdgeInsets.all(8),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(7.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 45,
                      height: 45,
                      imageUrl: 'https://www.punjabdevelopers.com/wp-content/uploads/2017/08/property-house.jpg',
                      placeholder: (context, url) =>
                          new CircularProgressIndicator(
                        backgroundColor: colorMain,
                      ),
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        defaultUserImage,
                        color: colorMain,
                        height: 35,
                        width: 35,
                      ),
                    ))),
          ),
        ],
      ),
    );
  }

  searchWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: TextStyle(fontSize: 12),
          controller: _textController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(12.0)),
                borderSide: BorderSide(color: colorDivider, width: 1.0)),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: InkWell(
              onTap: () {},
              child: Container(
                child: Icon(
                  Icons.search,
                  color: lighrgrey,
                ),
              ),
            ),
            hintText: "Search",
            hintStyle: TextStyle(color: UiColors.divider, fontSize: 12),
            contentPadding: EdgeInsets.all(10),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                borderSide: BorderSide(color: colorDivider, width: 1.0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                borderSide: BorderSide(color: colorDivider, width: 1.0)),
          ),
        ),
      ),
    );
  }

  usersList(int index) {

    var bannerImage =
        "${widget.imageUrl}${widget.dashBoardMainStore.filterPropertyModel.data.friends.data[index].userImg}";
    return Container(
        color: UiColors.white,
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                            imageUrl: bannerImage,
                            placeholder: (context, url) => Container(
                                  height: 50,
                                  width: 50,
                                  child: new CircularProgressIndicator(
                                    backgroundColor: colorMain,
                                  ),
                                ),
                            errorWidget: (context, url, error) =>
                                SvgPicture.asset(
                                  defaultUserImage,
                                  height: 40,
                                  color: colorMain,

                                  width: 40,
                                )))),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.dashBoardMainStore.filterPropertyModel.data.friends.data[index].userDisplayName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5.0, top: 2)),
                        Text(
                         widget.dashBoardMainStore.filterPropertyModel.data.friends.data[index].userFullName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    )),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: RaisedButton(
                    onPressed: () => showSnackbar(context, 'Added As Friend'),

                    padding: EdgeInsets.all(0),
                    color: colorMain,
                    textColor: Colors.white,
                    child: Stack(
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Send',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        side: BorderSide(color: colorMain)),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Divider(
              color: colorDivider,
              height: 2,
            )
          ],
        ));
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
      preferredSize: Size(double.infinity, 54),
      child: ClipRect(
        child: Container(
          color: UiColors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 6),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Send To',
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .textStyle
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4),
                      ],
                    )),
                    SizedBox(width: 14),
                  ],
                ),
              ),
              Divider(height: 1),
            ],
          ),
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
  Item('Messages', 'assets/message.png'),
  Item('Github', 'assets/github_app.png'),
  Item('Slack', 'assets/slack.png'),
  Item('Twitter', 'assets/twitter.png'),
  Item('Mail', 'assets/mail.png'),
];

final actions = [
  Item('Copy Photo', null),
];
final actions1 = [
  Item('Add to Shared Album', null),
  Item('Add to Album', null),
  Item('Duplicate', null),
  Item('Hide', null),
  Item('Slideshow', null),
  Item('AirPlay', null),
  Item('Use as Wallpaper', null),
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
