import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/ui/avatar_widget.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/components/post_contact_us_page.dart';
import 'package:flutterapp/ui/homePost/home_post_comment_delete_or_edit_dialog.dart';
import 'package:flutterapp/ui/homePost/view_more_likes.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../stores/home_comments_screen_store.dart';

class CommentsAndLikeScreen extends StatefulWidget {
  final Datum postComments;
  final String imgUrl;
  final bool isCommentDetail;
  CommentsAndLikeScreen(
      {@required this.postComments,
      this.imgUrl,
      @required this.isCommentDetail});
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsAndLikeScreen> {
  TextEditingController _commentController = TextEditingController();
  final _textController = TextEditingController();
  bool _canPost = false;
  var currentUserImage = "";
  var currentUserID = "";
  final _controller = ScrollController();
  final homeCommentScreenStore = HomeCommentScreenStore();
  bool isUpdateComment = false;
  int updateIndex;
  var posteCreatedTime;

  @override
  void initState() {
    _textController.addListener(() {
      setState(() => _canPost = _textController.text.isNotEmpty);
    });
    Config.getUserProfilePicture().then((value) {
      setState(() {
        currentUserImage = value;
      });
    });
    Config.getUserID().then((value) {
      setState(() {
        currentUserID = value;
      });
    });
    callApiForLikeAndComment();

    posteCreatedTime = DateTime.now().subtract(Duration(
        minutes: widget.postComments.user.createdAt.minute,
        seconds: widget.postComments.user.createdAt.second,
        hours: widget.postComments.user.createdAt.hour));
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 0.0,
        backgroundColor: colorMain,
        title: Text(widget.isCommentDetail ? 'Comments' : 'Likes',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            )),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Chat();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(
                "assets/message.svg",
                allowDrawingOutsideViewBox: true,
                height: 35,
                color: Colors.white,
              ),
            ),
          ),
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.transparent,
            // radius: 45.0,
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 34,
                width: 34,
                imageUrl: "$currentUserImage",
              ),
            ),
          ),
        ],
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        ),
        bottom: PreferredSize(
          preferredSize: null,
          child: Container(
            height: 1,
            color: colorDivider,
          ),
        ),
      ),
      body: Observer(
        builder: (_) => Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              widget.isCommentDetail
                  ? commentsListWidget(currentUserID)
                  : likeListWidget(),
              Divider(
                height: 1,
                color: colorDivider,
              ),
              widget.isCommentDetail ? commentInputWidget() : Container()
            ],
          ),
        ),
      ),
    );
  }

  callApiForLikeAndComment() {
    widget.isCommentDetail
        ? homeCommentScreenStore.getListOfCommentsForPost(
            context, widget.postComments.info.id, "Property")
        : homeCommentScreenStore.getListOfLikesForPost(
            context, widget.postComments.info.id, "Property");
  }

  commentInputWidget() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, top: 0.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration:
                ShapeDecoration(shape: CircleBorder(), color: Colors.white),
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      imageUrl: currentUserImage,
                      placeholder: (context, url) =>
                          new CircularProgressIndicator(
                        backgroundColor: colorMain,
                      ),
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        defaultUserImage,
                        color: Colors.black,
                        height: 40,
                        width: 40,
                      ),
                    ))),
          ),
          Flexible(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: commonetTextFiled()),
          ),
        ],
      ),
    );
  }

  commonetTextFiled() {
    return Stack(
      alignment: Alignment.topRight,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          height: height40,
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: TextStyle(fontSize: 12),
            controller: _textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: UiColors.divider, width: 1.0)),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: InkWell(
                onTap: () {
                  if (_textController.text.isNotEmpty) {
                    if (!isUpdateComment)
                      sendComment(_textController.text);
                    else
                      updateComment(_textController.text);
                  }
                },
                child: Container(
                  child: Opacity(
                    opacity: _canPost ? 1.0 : 0.2,
                    child: Icon(
                      Icons.send,
                      color: _canPost ? colorMain : lighrgrey,
                    ),
                  ),
                ),
              ),
              hintText: "Write a Comment...",
              hintStyle: TextStyle(color: UiColors.divider, fontSize: 12),
              contentPadding: EdgeInsets.only(left: 10),
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: UiColors.divider, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: UiColors.divider, width: 1.0)),
            ),
          ),
        ),
      ],
    );
  }

  sendComment(text) {
    LikeAndComment likeAndComment = LikeAndComment(
        createdAt: DateTime.now(), text: text, userImg: widget.imgUrl);
    widget.postComments.comments.add(likeAndComment);
    // homeCommentScreenStore.noOfComments =
    //     widget.postComments.comments.length.toString();
    _textController.text = '';
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
    );
    setState(() {});
    homeCommentScreenStore
        .postCommentsForPost(
            context, widget.postComments.info.id, "Property", text)
        .then((value) {
      if (value.error == "false") {
        widget.postComments.comments = value.data;
        //  homeCommentScreenStore.noOfComments = value.data.length.toString();
        _canPost = true;
        setState(() {});
      } else {}
    });
  }

  commentsListWidget(currentUserID) {
    return Flexible(
      child: ScrollConfiguration(
        behavior: new ScrollBehavior()
          ..buildViewportChrome(context, null, AxisDirection.down),
        child: ListView.builder(
          controller: _controller,
          itemBuilder: (ctx, i) {
            if (i == 0) return showPostOnTop();

            return commentsListItem(
                homeCommentScreenStore.postLikeAndCommentsModel != null
                    ? homeCommentScreenStore
                        .postLikeAndCommentsModel.data[i - 1]
                    : widget.postComments.comments[i - 1],
                i);
          },
          itemCount: homeCommentScreenStore.postLikeAndCommentsModel != null
              ? homeCommentScreenStore.postLikeAndCommentsModel.data.length + 1
              : widget.postComments.comments.length + 1,
          physics: const AlwaysScrollableScrollPhysics(),
        ),
      ),
    );
  }

  showPostOnTop() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.transparent,
              // radius: 45.0,
              child: ClipOval(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                  imageUrl: "${widget.imgUrl}${widget.postComments.user.img}",
                ),
              ),
            ),
            // AvatarWidget(user: widget.post.user),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.postComments.user.fullName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                if (widget.postComments.info.companyTitle != null)
                  Text(widget.postComments.info.companyTitle,
                      style: TextStyle(fontSize: 12.0))
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PropertyContactUsForm(
                    post: widget.postComments,
                    baseUrl: widget.imgUrl,
                  );
                }));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: colorMain,
                    ),
                    borderRadius: BorderRadius.circular(3.0)),
                child: Text(
                  "Contact",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            )
          ],
        ),
        Container(
          margin: EdgeInsets.all(0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CachedNetworkImage(
                fit: BoxFit.cover,
                width: 1000,
                height: 180,
                imageUrl:
                    widget.imgUrl + "" + widget.postComments.info.thumbnail,
              ),
            ],
          ),
        ),
        bottomBar(posteCreatedTime),
      ],
    );
  }

  commentsListItem(LikeAndComment post, index) {
    var commentCreatedTime = DateTime.now().subtract(Duration(
        minutes: post.createdAt.minute,
        seconds: post.createdAt.second,
        hours: post.createdAt.hour));

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: GestureDetector(
        onLongPress: () {
          if (post.createdByUserId == currentUserID)
            commentEditAndDeleteDialog(
                context, post, currentUserID, homeCommentScreenStore, index);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AvatarWidget(
                    imgUrl: "${widget.imgUrl}${post.userImg}",
                    padding: EdgeInsets.only(right: 0.0),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                      decoration: BoxDecoration(
                          color: halfWhite,
                          border: Border.all(
                            color: halfWhite,
                          ),
                          borderRadius: BorderRadius.circular(32.0)),
                      child: buildRichText(post),
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 0,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 40,
                ),
                Text(
                  timeago.format(commentCreatedTime, locale: 'en'),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 10,
                    color: smokeyColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildRichText(LikeAndComment post) {
    var currentTextData = StringBuffer();
    var textSpans = <TextSpan>[
      TextSpan(
          text: '${post.userDisplayName} ',
          style: TextStyle(color: colorMain, fontWeight: FontWeight.bold)),
    ];
    post.text.split(' ').forEach((word) {
      if (word.startsWith('#') && word.length > 1) {
        if (currentTextData.isNotEmpty) {
          textSpans.add(TextSpan(text: currentTextData.toString()));
          currentTextData.clear();
        }
        textSpans.add(TextSpan(text: '$word ', style: link));
      } else {
        currentTextData.write('$word ');
      }
    });
    if (currentTextData.isNotEmpty) {
      textSpans.add(TextSpan(text: currentTextData.toString()));
      currentTextData.clear();
    }
    return Text.rich(TextSpan(children: textSpans),
        style: TextStyle(
          fontSize: 12,
        ));
  }

  commentEditAndDeleteDialog(
      context, store, currentUserID, homeCommentScreenStore, index) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommentEditAndDeleteDialog(
          post: store,
          currentUserID: currentUserID,
        );
      },
    ).then((value) {
      performActionOnDilaog(value, index);
    });
  }

  performActionOnDilaog(value, index) {
    switch (value) {
      case "0":
        _textController.text =
            homeCommentScreenStore.postLikeAndCommentsModel.data[index].text;
        setState(() {});
        isUpdateComment = true;
        updateIndex = index;
        break;
      case "1":
        homeCommentScreenStore.postLikeAndCommentsModel.data.removeAt(index);
        setState(() {});
        homeCommentScreenStore.deleteCommentFromPost(
            context,
            widget.postComments.comments[index].id,
            widget.postComments.comments[updateIndex].referenceType,
            widget.postComments.comments[index].referenceId);
        break;
    }
  }

  updateComment(text) {
    homeCommentScreenStore.postLikeAndCommentsModel.data[updateIndex].text =
        text;
    setState(() {});
    homeCommentScreenStore
        .updateCommentForPost(
            context,
            widget.postComments.comments[updateIndex].id,
            widget.postComments.comments[updateIndex].referenceType,
            widget.postComments.comments[updateIndex].referenceId,
            text)
        .then((value) {
      isUpdateComment = false;
    });
  }

  likeListWidget() {
    return Flexible(
      child: ScrollConfiguration(
        behavior: new ScrollBehavior()
          ..buildViewportChrome(context, null, AxisDirection.down),
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            return ViewMoreLikesWidget(
                homeCommentScreenStore.postLikeAndCommentsModel != null
                    ? homeCommentScreenStore.postLikeAndCommentsModel.data[i]
                    : widget.postComments.likes[i],
                widget.imgUrl);
          },
          itemCount: homeCommentScreenStore.postLikeAndCommentsModel != null
              ? homeCommentScreenStore.postLikeAndCommentsModel.data.length
              : widget.postComments.likes.length,
          physics: const AlwaysScrollableScrollPhysics(),
        ),
      ),
    );
  }

  bottomBar(DateTime jobPostingdTime) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: smokeybgColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.postComments.info.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.postComments.info.description,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  color: smokeyColor,
                  fontSize: 11.0,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.postComments.info.unitId +
                    " " +
                    widget.postComments.info.unitTitle,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 18,
                      width: 18,
                      child: SvgPicture.asset('assets/calendar.svg')),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "posted ",
                    style: TextStyle(color: smokeyColor, fontSize: 11.0),
                  ),
                  Text(
                    timeago.format(jobPostingdTime, locale: 'en'),
                    style: TextStyle(color: smokeyColor, fontSize: 11.0),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
