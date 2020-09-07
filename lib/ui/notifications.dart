import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/stores/notification_store.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/loaders/color_loader.dart';
import 'package:flutterapp/utills/loaders/color_loader_for_more.dart';
import '../shimmer/simpleListView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../models/notification_model.dart';

List<Datum> notificationNewList = new List();

class NotificationsUI extends StatefulWidget {
  final NotificationStore notificationStore;
  NotificationsUI({this.notificationStore, Key key}) : super(key: key);
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<NotificationsUI> {
  @override
  void initState() {
    super.initState();
    if (!widget.notificationStore.isNotificationListLoaded) {
      widget.notificationStore.pageNumber = 1;
      widget.notificationStore
          .getNotificationList(context, widget.notificationStore.pageNumber)
          .then((value) {
        widget.notificationStore.isNotificationListLoaded = true;
        notificationNewList = value.data.data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          backgroundImage(),
          Observer(
              builder: (_) => widget.notificationStore.isNotificationListLoaded
                  ? notificationsList()
                  : shimmerSimpleListView(context)),
        ],
      ),
    );
  }

  loadMore(pageNumber) {
    widget.notificationStore.isNotificationListLoadingMore = true;
    widget.notificationStore
        .getNotificationList(context, pageNumber)
        .then((value) {
      widget.notificationStore.isNotificationListLoadingMore = false;
      for (int i = 0; i < value.data.data.length; i++) {
        notificationNewList.add(value.data.data[i]);
      }
      setState(() {});
    });
  }

  notificationsList() {
    return Positioned.fill(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(
              child: NotificationListener<ScrollNotification>(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: notificationNewList.length,
                      itemBuilder: (ctx, int) {
                        var notification = notificationNewList[int];
                        var profileUrl =
                            widget.notificationStore.notificationModel.url +
                                "" +
                                notification.userImg.toString();
                        var userName = notification.userFullName;
                        var companyName = notification.companyTitle;
                        var notificationType = notification.notificationType;

                        var notificationCreatedTime = DateTime.now().subtract(
                            Duration(
                                minutes: notification.createdAt.minute,
                                seconds: notification.createdAt.second,
                                hours: notification.createdAt.hour));

                        return Container(
                            padding: EdgeInsets.all(10.0),
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
                                    Padding(
                                        padding: EdgeInsets.only(left: 10.0)),
                                    Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              notificationText(notificationType,
                                                      userName, companyName)
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13.0),
                                            ),
                                            Text(
                                              timeago.format(
                                                  notificationCreatedTime,
                                                  locale: 'en'),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 13.0),
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
                            ));
                      }),
                ),
                onNotification: (ScrollNotification scrollInfo) {
                  print("object" + scrollInfo.metrics.toString());
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    if (widget.notificationStore.pageNumber !=
                        widget.notificationStore.notificationModel.data
                            .lastPage) {
                      widget.notificationStore.pageNumber =
                          widget.notificationStore.pageNumber + 1;
                      loadMore(widget.notificationStore.pageNumber);
                    }
                  }
                  return false;
                },
              ),
            ),
            widget.notificationStore.isNotificationListLoadingMore
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 35,
                        width: 35,
                        child: ColorLoader2(),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  )
                : Container(
                    height: 0,
                  )
          ],
        ),
      ),
    );
  }

  backgroundNotification() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child:Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/bg_image.png'),
    colorFilter: new ColorFilter.mode(
    Colors.white.withOpacity(0.3), BlendMode.dstIn),
    fit: BoxFit.fill)),
      ),
    ));
  }

  notificationText(notificationType, userName, companyName) {
    switch (notificationType) {
      case 'FriendRequest':
        return '$userName sent you a friend request from $companyName';
        break;
      case 'FriendAccepted':
        return '$userName approved your friend request from $companyName';
        break;
      case 'Follow':
        return '$userName started following you from $companyName';
        break;
    }
  }
}
