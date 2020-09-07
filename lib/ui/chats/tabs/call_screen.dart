import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/models/calls_model.dart';
import 'package:flutterapp/shimmer/messagesListView.dart';
import 'package:flutterapp/stores/chats_store.dart';
import 'package:flutterapp/stores/user_calls_store.dart';
import 'package:flutterapp/utills/config.dart';

class CallsScreen extends StatefulWidget {
  onlinePersonsChatsStore store;

  CallsScreen({this.store});

  @override
  State<StatefulWidget> createState() => new _callsState();
}

class _callsState extends State<CallsScreen> {
  var loggedinUserId;

  @override
  void initState() {
    //getloggedinuserid();
    Config.getUserID().then((value) {

      setState(() {
        loggedinUserId = value;
      });

    });

    super.initState();
  }

  getloggedinuserid() async {
    loggedinUserId = await Config.getUserID();
    print('logeduser id ::$loggedinUserId');
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => widget.store.isGernalApiLoded
          ? new ListView.builder(
              itemCount: widget.store.chatGeneralModel.callLogs.data.length,
              itemBuilder: (context, i) {
                var callLogsData =
                    widget.store.chatGeneralModel.callLogs.data[i];
                var profileUrl = widget.store.chatGeneralModel.url +
                    "" +
                    callLogsData.userImg.toString();
                return new Column(
                  children: <Widget>[
                    new Divider(
                      height: 10.0,
                    ),
                    new ListTile(
                      leading: Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50,
                                  imageUrl: loggedinUserId ==
                                          widget.store.chatGeneralModel.callLogs
                                              .data[i].userId
                                      ? '${widget.store.chatGeneralModel.url + widget.store.chatGeneralModel.callLogs.data[i].user2Img}'
                                      : '${widget.store.chatGeneralModel.url + widget.store.chatGeneralModel.callLogs.data[i].userImg}',
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
                                        height: 50,
                                        width: 50,
                                      )))),
                      title: new Text(
                        loggedinUserId ==
                                widget.store.chatGeneralModel.callLogs.data[i]
                                    .userId
                            ? widget.store.chatGeneralModel.callLogs.data[i]
                                .user2FullName
                            : widget.store.chatGeneralModel.callLogs.data[i]
                                .userFullName,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: new Container(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: new Row(
                            children: <Widget>[
                              Icon(
                                widget.store.chatGeneralModel.callLogs.data[i]
                                            .actionStatus ==
                                        'Missed'
                                    ? Icons.call_received
                                    : Icons.call_made,
                                color: widget.store.chatGeneralModel.callLogs
                                            .data[i].actionStatus ==
                                        'Missed'
                                    ? Colors.red
                                    : Colors.green,
                              ),
                              //type1
                              new Text(
                                  '${widget.store.chatGeneralModel.callLogs.data[i].createdAt}',
                                  style: new TextStyle(
                                      color: Colors.black26, fontSize: 14.0)),
                            ],
                          )),
                      trailing: new Icon(
                        widget.store.chatGeneralModel.callLogs.data[i].type ==
                                'Video'
                            ? Icons.videocam
                            : Icons.phone,
                        color: colorMain,
                      ), //type 2
                    )
                  ],
                );
              })
          : shimmerMessagesListView(context),
    );
  }

//  void getCalls() {
//    store.getCalls(context).then((value) {
//      store.iscallsLoaded = true;
//      store.usersCalslModel = value;
//    });
//  }
}
