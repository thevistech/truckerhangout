import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeamCardView extends StatefulWidget {
  @override
  _TeamCardViewState createState() => _TeamCardViewState();
}

class _TeamCardViewState extends State<TeamCardView> {
  @override


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child:ListView.builder(
        itemCount: 5,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return teamMembers(index);
        },
      )
    );
  }

  makeTeamCardViewWidget({companyName, userImage, userName, index}) {
    return AspectRatio(
      aspectRatio: 1.6 / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            child: InkWell(
              onTap: (){
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                      imageUrl: userImage,
                      placeholder: (context, url) => Container(
                        height: 60,
                        width: 60,
                        child: new CircularProgressIndicator(
                          backgroundColor: colorMain,
                        ),
                      ),
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        defaultUserImage,
                        height: 60,
                        width: 60,
                      ))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "$userName",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 120,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Column(
                children: <Widget>[
                  Text(
                    '$companyName',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(fontSize: 11.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  teamMembers(int i) {
    const _gradientBorderDecoration = BoxDecoration(
      shape: BoxShape.circle,
      // https://brandpalettes.com/instagram-color-codes/
      gradient: SweepGradient(
        colors: [
          Color(0xFF29326D), // Purple
          Color(0xFFF77737), // Orange
          colorMain, // Red-pink
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
    var profilePicUrl = 'https://images.pexels.com/photos/91224/pexels-photo-91224.jpeg';
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
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      radius: radius,
                      backgroundImage: NetworkImage(profilePicUrl),
                    ),
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
            child: Column(
              children: <Widget>[
                Text(
                  "Muhammad Uzair",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text('CEO',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black26

                ),)
              ],
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
}
