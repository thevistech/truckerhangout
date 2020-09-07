import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/dialogs/user_profile_dialog.dart';
import 'package:flutterapp/ui/profiles/user_profile.dart';
import 'package:flutterapp/utills/config.dart';
import '../../models/stories_model.dart';
import '../../shimmer/storiesListView.dart';
import '../story_view_screen.dart';

class Stories extends StatefulWidget {
  final StoriesModel stories;
  final DashBoardMainStore dashboardStore;
  Stories({@required this.stories, this.dashboardStore});
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  var imgBaseUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgBaseUrl = widget.stories.url;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.only(top: 5, bottom: 15),
      child: widget.dashboardStore.isStoryPostLoaded
          ? ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (ctx, i) {
          return makeStory(
              storyImage:
              "$imgBaseUrl${widget.stories.data.data[i].photoVideo}",
              userImage:
              "$imgBaseUrl${widget.stories.data.data[i].userImg}",
              userName: widget.stories.data.data[i].userFullName,
              index: i);
        },
        itemCount: widget.stories.data.data.length,
        scrollDirection: Axis.horizontal,
      )
          : shimmerStory(),
    );
  }

  Widget makeStory({storyImage, userImage, userName, index}) {
    return AspectRatio(
      aspectRatio: 1.6 / 2.5,
      child: InkWell(
        onTap: () {
          if(storyImage!=null)
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => MoreStories(
                  storyImage:storyImage,
                  storiesModel:widget.stories.data.data[index],
                userImg:userImage
              )));
        },
        child: Container(
          margin: EdgeInsets.only(right: 2, left: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            image: DecorationImage(
                image: NetworkImage(storyImage), fit: BoxFit.cover),
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.1),
                ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    showUserProfile(
                        context, widget.stories.data.data[index].id, userImage);
                    print(widget.stories.data.data[index].id);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: colorMain, width: 2),
                        image: DecorationImage(
                            image: NetworkImage(userImage), fit: BoxFit.cover)),
                  ),
                ),
                Text(
                  userName,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showUserProfile(context, id, profilePicUrl) {

    Navigator.push(context,
        MaterialPageRoute(builder: (context) {
          return  UserProfile(
              id: id,loginUserId: null,);
        }));

  }
}
