import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/shimmer/messagesListView.dart';
import 'package:flutterapp/stores/chats_store.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/story_view_screen.dart';
import 'package:flutterapp/utills/config.dart';

class StatusScreen extends StatefulWidget {
  onlinePersonsChatsStore store;
  StatusScreen({this.store});
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final DashBoardMainStore store = DashBoardMainStore();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        addStatus(),
        Container(
          color: smokeybgColor,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Users Status",
                style: TextStyle( color:Colors.grey,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),

         Flexible(child: usersStatus())
        ,
      /*  Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
                  ),
                  title: Text(
                    "Muhammad Masood",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Today, 20:16 PM"),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoreStories())),
                ),
              ],
            ),
          ),
        ),*/
      ],
    );
  }

  usersStatus() {
    return  Observer(
        builder: (context) => widget.store.isGernalApiLoded
        ? ListView.builder(
            itemCount: widget.store.chatGeneralModel.stories.data.length,
            shrinkWrap: true,
            itemBuilder: (ctx, int) {
              var storiesData = widget.store.chatGeneralModel.stories.data[int];
              var profileUrl =
                  widget.store.chatGeneralModel.url +
                      "" +
                      storiesData.userImg.toString();
              return GestureDetector(
                onTap: () {
                
                },
                child:
                Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              profileUrl),
                        ),
                        title: Text(
                          storiesData.userFullName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(storiesData.createdAt.toString()),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MoreStories())),
                      ),
                    ],
                  ),
                )
              );
            }):shimmerMessagesListView(context));
  }

  addStatus(){
    return Card(
      color: Colors.white,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://s3.amazonaws.com/wll-community-production/images/no-avatar.png"),
              ),
              Positioned(
                bottom: 0.0,
                right: 1.0,
                child: Container(
                  height: 20,
                  width: 20,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
          title: Text(
            "My Status",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("Tap to add status update"),
        ),
      ),
    );
  }

  void getStories() {
    store.getStories(context).then((value) {
      store.isStoryPostLoaded = true;
      store.storiesModel = value;
    });
  }
}