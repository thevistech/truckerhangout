import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/models.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/homePost/home_likes_widget.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/main_catagories_avatar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/widgets.dart';

class LikesScreen extends StatefulWidget {
  final DashBoardMainStore store;
  final ScrollController scrollController;

  LikesScreen({this.store, this.scrollController, Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _LikeScreenState();
  }
}

class _LikeScreenState extends State<LikesScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final _posts = <Post>[
    Post(
      user: grootlover,
      imageUrls: [
        'assets/property1.jpg',
        'assets/property2.jpg',
      ],
      likes: [
        Like(user: rocket),
        Like(user: starlord),
        Like(user: gamora),
        Like(user: nickwu241),
      ],
      comments: [
        Comment(
          text: 'Selling my property #realestate',
          user: rocket,
          commentedAt: DateTime(2019, 5, 23, 14, 35, 0),
          likes: [Like(user: nickwu241)],
        ),
      ],
      location: 'Karachi',
      postedAt: DateTime(2019, 5, 23, 12, 35, 0),
    ),
    Post(
      user: nickwu241,
      imageUrls: ['assets/property2.jpg'],
      likes: [],
      comments: [],
      location: 'Lahore',
      postedAt: DateTime(2019, 5, 21, 6, 0, 0),
    ),
    Post(
      user: nebula,
      imageUrls: ['assets/property3.jpg'],
      likes: [Like(user: nickwu241)],
      comments: [],
      location: 'Karachi',
      postedAt: DateTime(2019, 5, 2, 0, 0, 0),
    ),
  ];

  @override
  void initState() {
    super.initState();
    print(_posts.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Likes',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            'assets/back_arrow.png',
            color: Colors.black,
          ),
        ),
        // ignore: missing_required_param
        bottom: PreferredSize(
          child: Container(
            height: 1,
            color: colorDivider,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            return LikeWidget(_posts[i]);
          },
          itemCount: 3,
          // controller: widget.scrollController,
        ),
      ),
    );
  }

  totalLikes() {
    return Container(
      height: 106.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          var data = widget.store.brokersList.data.data;
          var profilePicUrl =
              widget.store.brokersList.url + "" + data[i].picture;
          return MainCatagoriesAvatarWidget(
            user: widget.store.brokersList.data.data[i],
            onTap: () => {},
            isLarge: true,
            isCurrentUserStory: i == 0,
            store: widget.store,
          );
        },
        itemCount: widget.store.brokersList.noOfRecords,
      ),
    );
  }

//  brokersLists() {
//    return Observer(
//        name: "brokerListr",
//        builder: (context) =>widget?.store?.brokersList?.noOfRecords == 0 ||
//            widget?.store?.brokersList?.noOfRecords == null?Container(): Container(
//          height: 106.0,
//          child: ListView.builder(
//
//            scrollDirection: Axis.horizontal,
//            itemBuilder: (ctx, i) {
//              var data = widget.store.brokersList.data.data;
//              var profilePicUrl =
//                  widget.store.brokersList.url + "" + data[i].picture;
//              return MainCatagoriesAvatarWidget(
//                user: widget.store.brokersList.data.data[i],
//                onTap: () => {},
//                isLarge: true,
//                isCurrentUserStory: i == 0,
//                store: widget.store,
//              );
//            },
//            itemCount: widget.store.brokersList.noOfRecords,
//          ),
//        ));
//  }

}
