import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutterapp/models/filter_property_model.dart' as filterModel;
import 'package:flutterapp/ui/components/post_contact_us_page.dart';
import 'package:flutterapp/ui/homePost/share_post_sheet.dart';
import 'package:flutterapp/ui/property_detail_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../resources/network_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/ui/avatar_widget.dart';
import 'package:flutterapp/ui/homePost/home_comment_widget.dart';
import 'package:flutterapp/ui/homePost/home_comments_screen.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/heart_icon_animator.dart';
import 'package:flutterapp/utills/heart_overlay_animator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import '../../resources/network_calls_apis.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../dialogs/more_dialog.dart';

class PostWidget extends StatefulWidget {
  final Datum post;
  final String baseUrl;
  final String currentUser;
  final String currentUserImageUrl;
  final String userName;
  final String userFullName;
  final DashBoardMainStore dashBoardMainStore;
  final filterModel.FilterPropertyModel filterPropertyModel;
  PostWidget(
      {this.post,
      this.baseUrl,
      this.currentUser,
      this.currentUserImageUrl,
      this.userName,
      this.userFullName,
      this.dashBoardMainStore,
      this.filterPropertyModel});
  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final StreamController<void> _doubleTapImageEvents =
      StreamController.broadcast();
  bool _isSaved = false;
  int _currentImageIndex = 0;
  bool isLikedByCurrentId = false;
  int i = 0;
  var posteCreatedTime;
  NetworkService networkService;
  var pageType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    networkService = NetworkService();
    for (i = 0; i < widget.post.likes.length; i++) {
      if (widget.post.likes[i].createdByUserId == widget.currentUser) {
        isLikedByCurrentId = true;
        break;
      }
    }
    posteCreatedTime = DateTime.now().subtract(Duration(
        minutes: widget.post.user.createdAt.minute,
        seconds: widget.post.user.createdAt.second,
        hours: widget.post.user.createdAt.hour));

    print(" Image URl " + widget.currentUserImageUrl);
    checkType();
  }

  checkType() {
    pageType = widget.dashBoardMainStore.titleHeadingForAppBar;
    switch (pageType) {
      case 'Properties':
        pageType = 'property';
        break;
      case 'Projects':
        pageType = 'projects';
        break;
    }
  }

  @override
  void dispose() {
    _doubleTapImageEvents.close();
    super.dispose();
  }

  void _updateImageIndex(int index) {
    setState(() => _currentImageIndex = index);
  }

  callApiForLikeThePost() {
    widget.dashBoardMainStore
        .likeThepost(context, "property", widget.post.info.id)
        .then((value) {
      if (value.error == "false") {
        isLikedByCurrentId = value.likeStatus;
      } else {
        udpateTheLikeUI(true);
      }
    });
  }

  udpateTheLikeUI(error) {
    if (error) isLikedByCurrentId = !isLikedByCurrentId;
    int postLikeLength = 0;
    postLikeLength = widget.post.likes.length + 1;
    if (isLikedByCurrentId) {
      LikeAndComment likeAndCommnet = LikeAndComment(
          createdByUserId: widget.currentUser,
          userDisplayName: widget.userName,
          id: postLikeLength.toString(),
          userImg: widget.currentUserImageUrl,
          createdAt: DateTime.now(),
          userFullName: widget.userFullName);
      widget.post.likes.add(likeAndCommnet);
      widget.post.info.noOfLikes =
          (int.tryParse(widget.post.info.noOfLikes) + 1).toString();
    } else {
      for (int i = 0; i < widget.post.likes.length; i++) {
        if (widget.post.likes[i].createdByUserId ==
            widget.currentUser.toString()) {
          widget.post.likes.remove(widget.post.likes[i]);
          widget.dashBoardMainStore.noOfLikes =
              (int.tryParse(widget.dashBoardMainStore.noOfLikes) - 1)
                  .toString();
          break;
        }
      }
      widget.post.info.noOfLikes =
          (int.tryParse(widget.post.info.noOfLikes) - 1).toString();
    }
    setState(() {});
  }

  void _onDoubleTapLikePhoto() {
    _toggleIsLiked();
    // setState(() => widget.post.addLikeIfUnlikedFor(currentUser));
    _doubleTapImageEvents.sink.add(null);
  }

  void _toggleIsLiked() {
    setState(() {
      if (isLikedByCurrentId)
        isLikedByCurrentId = false;
      else
        isLikedByCurrentId = true;
    });
    udpateTheLikeUI(false);
    callApiForLikeThePost();
  }

  void _toggleIsSaved() {
    setState(() => _isSaved = !_isSaved);
  }

/*   void _showAddCommentModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddCommentModal(
            user: currentUser,
            onPost: (String text) {
0              setState(() {
                widget.post.comments.add(Comment(
                  text: text,
                  user: currentUser,
                  commentedAt: DateTime.now(),
                  likes: [],
                ));
              });
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  } */

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // User Details
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
                  imageUrl: "${widget.baseUrl}${widget.post.user.img}",
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.post.user.fullName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
                if (widget.post.info.companyTitle != null)
                  Text(widget.post.info.companyTitle,
                      style: TextStyle(fontSize: 12.0))
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PropertyContactUsForm(
                    post: widget.post,
                    baseUrl: widget.baseUrl,
                    filterPropertyModel: widget.filterPropertyModel,
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
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => LogoutOverlay(
                    post: widget.post,
                    url: "$BaseUrl$pageType/${widget.post.info.slug}",
                  ),
                );
              },
              child: Icon(Icons.more_vert),
            ),
            /*     IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () => showDialog(
                      context: context,
                      builder: (_) => LogoutOverlay(
                        post: widget.post,
                        url: "$BaseUrl$pageType/${widget.post.info.slug}",
                      ),
                    )) */
          ],
        ),
        // Photo Carosuel
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailsScreen(post: widget.post, baseUrl: widget.baseUrl);
            }));
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CarouselSlider(
                items: [
                  /*  widget.post.info.thumbnail == null
                      ? 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/amazon-rivet-furniture-1533048038.jpg'
                      : */
                  widget.baseUrl + widget.post.info.thumbnail
                ].map((url) {
                  return CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      imageUrl: url,
                      placeholder: (context, url) =>
                          dummyCoverImage(context, true),
                      errorWidget: (context, url, error) =>
                          dummyCoverImage(context, false));
                  /*  return Image.network(
                    url,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                  ); */
                }).toList(),
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                onPageChanged: _updateImageIndex,
              ),
              HeartOverlayAnimator(
                  triggerAnimationStream: _doubleTapImageEvents.stream),
            ],
          ),
          onDoubleTap: _onDoubleTapLikePhoto,
        ),
        bottomBar(posteCreatedTime),
        // Action Bar
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 8.0, right: 4.0),
              child: HeartIconAnimator(
                isLiked: isLikedByCurrentId,
                size: 28.0,
                height: 28.0,
                width: 28.0,
                onTap: _toggleIsLiked,
                triggerAnimationStream: _doubleTapImageEvents.stream,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CommentsAndLikeScreen(
                    postComments: widget.post,
                    imgUrl: widget.baseUrl,
                    isCommentDetail: true,
                  );
                }));
                // _showAddCommentModal();
              },
              child: SvgPicture.asset(
                'assets/comment.svg',
                height: 28,
                width: 28,
                color: colorMain,
              ),
            ),

            GestureDetector(
              onTap: () {
                showCupertinoModalBottomSheet(
                  expand: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context, scrollController) => ShareBottomSheet(
                    scrollController: scrollController,
                    dashBoardMainStore: widget.dashBoardMainStore,
                    imageUrl: widget.baseUrl,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: SvgPicture.asset(
                  'assets/Inbox2.svg',
                  height: 28,
                  width: 28,
                  color: colorMain,
                ),
              ),
            ),
            /*  if (widget.post.imageUrls.length > 1)
              PhotoCarouselIndicator(
                photoCount: widget.post.imageUrls.length,
                activePhotoIndex: _currentImageIndex,
              ), */
            SizedBox(
              width: 10,
            ),
            // Add a comment...
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: colorMain, width: 1),
                          borderRadius: BorderRadius.circular(32.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 28,
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                                child: CachedNetworkImage(
                                    imageUrl: widget.currentUserImageUrl)),
                          ),
                          Container(
                            child: GestureDetector(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 28,
                                padding: EdgeInsets.only(right: 7.0, left: 10.0),
                                child: Text(
                                  'Write a comment',
                                  style:
                                      TextStyle(color: Colors.grey, fontSize: 12.0),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CommentsAndLikeScreen(
                                    isCommentDetail: true,
                                    postComments: widget.post,
                                    imgUrl: widget.baseUrl,
                                  );
                                }));
                              },
                              // onTap: _showAddCommentModal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

             Padding(
               padding: const EdgeInsets.only(right: 4.0,left: 7),

               child: GestureDetector(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                     return DetailsScreen(
                       post: widget.post,
                       baseUrl: widget.baseUrl,
                     );
                   }));
                   // _showAddCommentModal();
                 },
                 child: SvgPicture.asset(
                   'assets/property_details_line.svg',
                   height: 28,
                   width: 28,
                   color: colorMain,
                 ),
               ),
             ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  _toggleIsSaved();
                },
                child: Container(
                  child: _isSaved
                      ? SvgPicture.asset(
                          'assets/save_filled.svg',
                          height: 28,
                          width: 28,
                          color: colorMain,
                        )
                      : SvgPicture.asset(
                          'assets/save.svg',
                          height: 28,
                          width: 28,
                          color: colorMain,
                        ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Liked by
              if (widget.post.likes.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      AvatarWidget(
                        imgUrl: widget.baseUrl + widget.post.likes[0].userImg,
                        isLikeAvatar: true,
                      ),
                      Text('Liked by '),
                      Text(widget.post.likes[0].userDisplayName, style: bold),
                      if (widget.post.likes.length > 1) ...[
                        Text(' and'),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CommentsAndLikeScreen(
                                isCommentDetail: false,
                                postComments: widget.post,
                                imgUrl: widget.baseUrl,
                              );
                            }));
                          },
                          child: Text(
                              ' ${int.tryParse(widget.post.info.noOfLikes) - 1} others',
                              style: bold),
                        ),
                      ]
                    ],
                  ),
                ),
              // Comments
              if (widget.post.comments.isNotEmpty)
                Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: ScrollConfiguration(
                      behavior: new ScrollBehavior()
                        ..buildViewportChrome(
                            context, null, AxisDirection.down),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.post.comments.length >= 3
                              ? 3
                              : widget.post.comments.length,
                          itemBuilder: (context, int) {
                            if (int == 0 && widget.post.comments.length >= 3) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CommentsAndLikeScreen(
                                        isCommentDetail: true,
                                        postComments: widget.post,
                                        imgUrl: widget.baseUrl);
                                  }));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    "View all ${widget.post.info.noOfComments} comments",
                                    style: TextStyle(color: colorMain),
                                  ),
                                ),
                              );
                            }
                            return CommentWidget(
                                widget.post.comments[int], widget.baseUrl);
                          }),
                    ) /* Column(
                    children: widget.post.comments
                        .map((LikeAndComment c) => CommentWidget(c))
                        .toList(),
                  ), */
                    ),
              // Posted Timestamp
              // Text(
              //   widget.post.timeAgo(),
              //   style: TextStyle(color: Colors.grey, fontSize: 11.0),
              // ),
            ],
          ),
        ),
      ],
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
                widget.post.info.title,
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
                widget.post.info.description,
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
                widget.post.info.unitId + " " + widget.post.info.unitTitle,
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

class PhotoCarouselIndicator extends StatelessWidget {
  final int photoCount;
  final int activePhotoIndex;

  PhotoCarouselIndicator({
    @required this.photoCount,
    @required this.activePhotoIndex,
  });

  Widget _buildDot({bool isActive}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: isActive ? 7.5 : 6.0,
          width: isActive ? 7.5 : 6.0,
          decoration: BoxDecoration(
            color: isActive ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(photoCount, (i) => i)
          .map((i) => _buildDot(isActive: i == activePhotoIndex))
          .toList(),
    );
  }
}
/* 
class AddCommentModal extends StatefulWidget {
  final User user;
  final ValueChanged<String> onPost;

  AddCommentModal({@required this.user, @required this.onPost});

  @override
  _AddCommentModalState createState() => _AddCommentModalState();
}

class _AddCommentModalState extends State<AddCommentModal> {
  final _textController = TextEditingController();
  bool _canPost = false;

  @override
  void initState() {
    _textController.addListener(() {
      setState(() => _canPost = _textController.text.isNotEmpty);
    });
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AvatarWidget(user: widget.user),
        Expanded(
          child: TextField(
            controller: _textController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Add a comment...',
              border: InputBorder.none,
            ),
          ),
        ),
        FlatButton(
          child: Opacity(
            opacity: _canPost ? 1.0 : 0.4,
            child: Text('Post', style: TextStyle(color: Colors.blue)),
          ),
          onPressed:
              _canPost ? () => widget.onPost(_textController.text) : null,
        )
      ],
    );
  }
}
 */
