import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/models/chat_general_model.dart';
import 'package:flutterapp/stores/chats_store.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/chats/chat_user_profile.dart';
import 'package:flutterapp/ui/chats/voice_call.dart';
import 'package:flutterapp/ui/filters/more_filter.dart';
import 'package:flutterapp/ui/profiles/my_profile.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/online_persons_chat_model.dart';

class chatAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  String url;
  InfoElement userData;

  chatAppBar({this.height, this.userData, this.url});

  @override
  State<StatefulWidget> createState() {
    return new _chatAppBar();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _chatAppBar extends State<chatAppBar> {
  var imgUrl = "";
  var imageClipSize = 25.0;
  var loggedinUserId;

  @override
  void initState() {

    getloggedinuserid();
    Config.getUserProfilePicture().then((value) => imgUrl = value);

    super.initState();
  }
  getloggedinuserid() async{
    loggedinUserId = await Config.getUserID();
    print('login user id ::$loggedinUserId');
  }
  @override
  Widget build(BuildContext context) {
    imageClipSize = 28.0;
    return Container(
      color: colorMain,
      child: Observer(
        builder: (_) => Container(
          height: widget.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Container(
                  color: colorMain,
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ProfileView(loggedinUserId == widget.userData.userId?
                                  widget.userData.user2FullName:widget.userData.userFullName,
                                      loggedinUserId == widget.userData.userId?
                                      '${widget.url + widget.userData.user2Img}':
                                      '${widget.url + widget.userData.userImg}');
                                }));
                              },
                              child:
                              Container(
                                  child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(50.0),
                                      child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          width: 30,
                                          height: 30,
                                          imageUrl: loggedinUserId == widget.userData.userId?
                                          '${widget.url + widget.userData.user2Img}':
                                          '${widget.url + widget.userData.userImg}',
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


                            ))),
                    Expanded(
                        flex: 5,
                        child: Container(
                          child: Text(
                            loggedinUserId == widget.userData.userId?
                            widget.userData.user2FullName:widget.userData.userFullName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // widget.store.setValue();
                        },
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.call),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VoiceCallPage();
                            }));
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.video_call),
                          onPressed: () {},
                        ),
                      ),
                    ),

                  ]),
                ),
              ),
              Divider(
                color: Colors.white,
                height: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
