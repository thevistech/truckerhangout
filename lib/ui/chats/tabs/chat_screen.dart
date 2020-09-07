import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/models/chat_dummy_model.dart';
import 'package:flutterapp/shimmer/messagesListView.dart';
import 'package:flutterapp/shimmer/profileListView.dart';
import 'package:flutterapp/shimmer/profile_shimmer.dart';
import 'package:flutterapp/stores/chats_store.dart';
import 'package:flutterapp/ui/chats/chat_view_single.dart';
import 'package:flutterapp/ui/profiles/user_profile.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/models/online_persons_chat_model.dart';


List<Datum> chatList = new List();

class ChatScreen extends StatefulWidget {

  onlinePersonsChatsStore store;
  ChatScreen({this.store});
  @override
  ChatScreenState createState() {
    return new ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {

  @override
  void initState() {
    print('object');
    print('hsh hsh,${widget.store.isGernalApiLoded}');
//    WidgetsBinding.instance.addPostFrameCallback((_) async {
//      if (!store.ischatLoaded) getMessages();
//      if (!store.isUsersLoaded) getOnlineUsers();
//    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // backgroundNotification(),
        onlineUsersLists(),
        Flexible(child: messagesList()),
      ],
    );
  }

  messagesList() {
    return Observer(
        builder: (context) => widget.store.isGernalApiLoded
            ? ListView.builder(
                itemCount: widget.store.chatGeneralModel.messages.length,
                shrinkWrap: true,
                itemBuilder: (ctx, int) {

                  var messagesData = widget.store.chatGeneralModel.messages[int].info;
                  var profileUrl =
                      widget.store.chatGeneralModel.url +
                          "" +
                          messagesData.userImg.toString();

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => ChatViewSingle(
                              userData: widget.store.chatGeneralModel.messages[int].info,
                                  imageurl:widget.store.chatGeneralModel.url
                              )));
                    },
                    child: Container(
                        padding:
                            EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[

                                Container(
                                    child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(50.0),
                                        child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            width: 50,
                                            height: 50,
                                            imageUrl: profileUrl,
                                            placeholder: (context, url) =>
                                                Container(
                                                  height: 50,
                                                  width: 50,
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
                                                  height: 50,
                                                  width: 50,
                                                ))
                                    )
                                ),
                                Padding(padding: EdgeInsets.only(left: 10.0)),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(messagesData.userDisplayName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.0, top: 2)),
                                        Text(
                                          "Foreigners are buying less real estate in the United States,  global economic growth is to blame",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Divider(
                              color: colorDivider,
                              height: 2,
                            )
                          ],
                        )),
                  );
                })
            : shimmerMessagesListView(context));
  }

  backgroundNotification() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          "assets/building.png",
        ),
      ),
    );
  }

  onlineUsersLists() {
    return Observer(
      builder: (context) =>
        widget.store.isGernalApiLoded
            ? Container(
          height: 100.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) {
              return onlineUserWidget(i);
            },
            itemCount: widget.store.chatGeneralModel.friends.data.length,
            //controller: scrollController,
          ),
        ): profileShimmers()
    );
  }

  onlineUserWidget(int i) {
    const _gradientBorderDecoration = BoxDecoration(
      shape: BoxShape.circle,
      // https://brandpalettes.com/instagram-color-codes/
      gradient: SweepGradient(
        colors: [
          Color(0xFF29326D), // Purple
          Color(0xFFF77737), // Orange
          Color(0xFFE1306C), // Red-pink
          Color(0xFFC13584), // Red-purple
        ],
      ),
    );

    const _whiteBorderDecoration = BoxDecoration(
      shape: BoxShape.circle,
      border:
          Border.fromBorderSide(BorderSide(color: Colors.white, width: 3.0)),
    );

    const _greyBoxShadowDecoration = BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 1.0, spreadRadius: 1.0)
      ],
    );
    var profilePicUrl =
        '${widget.store.chatGeneralModel.url}${widget.store.chatGeneralModel.friends.data[i].userImg}';
    final radius = 28.0;

    final avatar = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: radius * 2 + 9.0,
          width: radius * 2 + 9.0,
          decoration: _gradientBorderDecoration,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: _whiteBorderDecoration,
                child: Container(
                  decoration: _greyBoxShadowDecoration,
                  child: GestureDetector(
                    onTap: () {
                      //if (userid== null) return;
//                      Navigator.of(context).push(MaterialPageRoute(
//                          builder: (BuildContext context) => ChatViewSingle(
//                            userData: store.onlineUsers.data.data[i],
//                          )));
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      radius: radius,
                      backgroundImage: NetworkImage(profilePicUrl),
                    ),
                  ),
                ),
              ),
              if (widget.store.chatGeneralModel.friends.data[i].status == 'Active')
                // Bottom right circular add icon
                Positioned(
                  right: 5.0,
                  bottom: 2.0,
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Container(
          width: 75,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              "${widget.store.chatGeneralModel.friends.data[i].userFullName}",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        )
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,horizontal: 3
      ),
      child: avatar,
    );
  }

//  void getMessages() {
//    store.getChat(context,store.pageNumber).then((value) {
//      store.ischatLoaded = true;
//      store.onlinePersonsChatData = value;
//      chatList = value.data.data;
//
//    });
//  }
//
//  void getOnlineUsers() {
//    store.getOnlineUsers(context).then((value) {
//      store.isUsersLoaded = true;
//      store.onlineUsers = value;
//      print('length : ${store.onlineUsers.data.data.length}');
//    });
//  }

//  conversationUI() {
//    return NotificationListener<ScrollNotification>(
//      child: new ListView.builder(
//        itemCount: dummyData.length,
//        itemBuilder: (context, i) => new Column(
//          children: <Widget>[
//            new Divider(
//              height: 10.0,
//            ),
//            new ListTile(
//              leading: new CircleAvatar(
//                foregroundColor: Theme.of(context).primaryColor,
//                backgroundColor: Colors.grey,
//                backgroundImage: new NetworkImage(dummyData[i].avatarUrl),
//              ),
//              title: new Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  new Text(
//                    dummyData[i].name,
//                    style: new TextStyle(fontWeight: FontWeight.bold),
//                  ),
//                  new Text(
//                    dummyData[i].time,
//                    style: new TextStyle(color: Colors.grey, fontSize: 14.0),
//                  ),
//                ],
//              ),
//              subtitle: new Container(
//                padding: const EdgeInsets.only(top: 5.0),
//                child: new Text(
//                  dummyData[i].message,
//                  style: new TextStyle(color: Colors.grey, fontSize: 15.0),
//                ),
//              ),
//            )
//          ],
//        ),
//      ),
//      onNotification: (ScrollNotification scrollInfo) {
//        print("object" + scrollInfo.metrics.toString());
//        if (scrollInfo.metrics.pixels ==
//            scrollInfo.metrics.maxScrollExtent) {
//          if (store.onlinePersonsChatData.data.currentPage !=
//              store.onlinePersonsChatData.data.lastPage) {
//            store.pageNumber =
//                store.pageNumber + 1;
//            loadMore(store.pageNumber);
//          }
//        }
//        return false;
//      },
//    );
//  }
//
//  loadMore(pageNumber) {
//   store.isListLoadingMore = true;
//   store.getChat(context, pageNumber)
//        .then((value) {
//     store.isListLoadingMore = false;
//      for (int i = 0; i < value.data.data.length; i++) {
//        chatList.add(value.data.data[i]);
//      }
//      setState(() {});
//    });
//  }

}
