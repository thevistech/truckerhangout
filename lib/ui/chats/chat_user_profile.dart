import 'package:flutter/material.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';

class ProfileView extends StatefulWidget {
  final String name;
  final String imgurl;
  ProfileView(this.name, this.imgurl);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>  {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 350.0,
            floating: false,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text(widget.name),
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  new Image.network(
                    widget.imgurl,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          new SliverList(
            delegate: new SliverChildListDelegate(<Widget>[
              new ListTile(
                title: new Text("Mute notifications"),
                trailing: new Switch(
                  value: false,
                  onChanged: null,
                  inactiveThumbColor: colorMain,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:15.0,right: 12.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Jhinne',style: TextStyle(
                          color: Colors.black
                        ),),
                        SizedBox(height: 5,),
                        Text('+92 3435 8835040',style: TextStyle(
                          fontSize: 12,
                          color: Colors.black26
                        ),),

                        SizedBox(height: 5,)
                      ],
                    ),

                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ClipOval(
                          child: Material(
                            color: smokeybgColor, // button color
                            child: InkWell(
                              child: SizedBox(
                                  width: 36,
                                  height: 36,
                                  child: Icon(
                                    Icons.chat,
                                    color: UiColors.primaryColor,
                                  )),
                              onTap: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ClipOval(
                          child: Material(
                            color: smokeybgColor, // button color
                            child: InkWell(
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    Icons.call,
                                    color: UiColors.primaryColor,
                                  )),
                              onTap: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ClipOval(
                          child: Material(
                            color: smokeybgColor, // button color
                            child: InkWell(
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    Icons.video_call,
                                    color: UiColors.primaryColor,
                                  )),
                              onTap: () {},
                            ),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8),
                child: Divider(
                  height: 1,
                ),
              ),
              new ListTile(
                title: new Text("Hey there! I am using WhatsApp"),
                subtitle: new Text("25/07/2020 at 9:12 PM",style: TextStyle(
                  fontSize: 12,
                  color: Colors.black26
                ),),
              ),
              new ListTile(
                title: new Text("Encryption"),
                subtitle: new Text(
                    "Message to this chat and calls sre secured with end-to-end encryption. Tap to verify"),
                trailing: new Icon(
                  Icons.lock,
                  color: colorMain,
                ),
              ),
              new Padding(padding: const EdgeInsets.symmetric(vertical: 10.0)),



              new Text(
                "    Groups in common",
                style: new TextStyle(color: colorMain),
              ),
              new ListTile(
                leading: new CircleAvatar(
                  backgroundImage: new NetworkImage(widget.imgurl),
                ),
                title: new Text("Group 1"),
                subtitle: new Text("Member1, Member2..."),
              ),
              new ListTile(
                leading: new Icon(
                  Icons.block,
                  color: Colors.red,
                ),
                title: new Text(
                  "Clear Chat",
                  style: new TextStyle(color: Colors.red),
                ),
              ),
              Divider(
                height: 1,
              ),
              new ListTile(
                leading: new Icon(
                  Icons.block,
                  color: Colors.red,
                ),
                title: new Text(
                  "Block Contact",
                  style: new TextStyle(color: Colors.red),
                ),
              ),
              Divider(
                height: 1,
              ),
              new ListTile(
                leading: new Icon(
                  Icons.thumb_down,
                  color: Colors.red,
                ),
                title: new Text(
                  "Report Contact",
                  style: new TextStyle(color: Colors.red),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}