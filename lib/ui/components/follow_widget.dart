import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ui/profiles/user_profile.dart';
import 'package:flutterapp/utills/config.dart';
import '../../stores/dashboard_main_store.dart';
import '../../shimmer/followSuggestionList.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Follow extends StatefulWidget {
  final DashBoardMainStore dashboardStore;
  Follow({@required this.dashboardStore});
  @override
  _FollowState createState() => _FollowState();
}

class _FollowState extends State<Follow> {
  List<bool> isfollow;
  @override
  void initState() {
    isfollow = List.generate(
        widget.dashboardStore.followSuggestionModel.data.data.length,
        (_) => true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.dashboardStore.followSuggestionModel.data.data.length > 0
          ? 180
          : 0,
      child: widget.dashboardStore.isFollowSuggestionLoaded
          ? ListView.builder(
              itemCount:
                  widget.dashboardStore.followSuggestionModel.data.data.length,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return makeFollowSuggestionWidget(
                    companyName: widget.dashboardStore.followSuggestionModel
                        .data.data[index].companyName,
                    userImage:
                        "${widget.dashboardStore.followSuggestionModel.url}${widget.dashboardStore.followSuggestionModel.data.data[index].img}",
                    userName: widget.dashboardStore.followSuggestionModel.data
                        .data[index].fullName,
                    index: index);
              },
            )
          : shimmerFollow(),
    );
  }

  makeFollowSuggestionWidget({companyName, userImage, userName, index}) {
    return AspectRatio(
      aspectRatio: 1.6 / 2,
      child: Container(
        margin: EdgeInsets.only(right: 4, left: 4, top: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: colorDivider)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 10.0, top: 5.0),
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.dashboardStore.followSuggestionModel.data.data
                        .removeAt(index);
                  });
                },
                child: Icon(
                  Icons.clear,
                  size: 18,
                ),
              ),
            ),
            Container(
              width: 60,
              height: 60,
              child: InkWell(
                onTap: (){
                  showUserProfile(context, widget.dashboardStore.followSuggestionModel.data.data[index].id);
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
                      maxLines: 1,
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
                    followButton(index),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  followButton(index) {
    return Container(
      height: 28,
      // width: width,
      child: RaisedButton(
        onPressed: () {
          var followID =
              widget.dashboardStore.followSuggestionModel.data.data[index].id;
          widget.dashboardStore
              .toggleFollowUser(context, followID)
              .then((response) {
            if (response.error == "false") {
              if (response.followStatus)
                isfollow[index] = true;
              else
                isfollow[index] = false;
            }
          });
          widget.dashboardStore.followSuggestionModel.data.data.removeAt(index);
          if (isfollow[index])
            isfollow[index] = false;
          else
            isfollow[index] = true;
          setState(() {});
        },
        padding: EdgeInsets.all(0),
        color: colorMain,
        textColor: Colors.white,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                isfollow[index] ? 'Follow' : 'UnFollow',
                style: TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide(color: colorMain)),
      ),
    );
  }

  showUserProfile(context, id) {

    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return  UserProfile(
            id: id,loginUserId: null,);
        }));

  }
}
