import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/jobs_model.dart';
import 'package:flutterapp/ui/addListing/post_job_screen.dart';
import 'package:flutterapp/ui/comments_screen.dart';
import 'package:flutterapp/ui/components/post_contact_us_page.dart';
import 'package:flutterapp/ui/likes_screen.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/heart_icon_animator.dart';
import 'package:flutterapp/utills/heart_overlay_animator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'avatar_widget.dart';
import 'dialogs/more_dialog.dart';
import 'components/start_rating_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostWidget extends StatefulWidget {
  final Datum post;
  final String imgUrl;
  final String currentUserImageUrl;
  PostWidget(this.post, this.imgUrl, this.currentUserImageUrl);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final StreamController<void> _doubleTapImageEvents =
      StreamController.broadcast();
  bool _isSaved = false;
  int _currentImageIndex = 0;

  @override
  void dispose() {
    _doubleTapImageEvents.close();
    super.dispose();
  }

  void _updateImageIndex(int index) {
    setState(() => _currentImageIndex = index);
  }

  void _onDoubleTapLikePhoto() {
    //  setState(() => widget.post.addLikeIfUnlikedFor(currentUser));
    _doubleTapImageEvents.sink.add(null);
  }

/*
  void _toggleIsLiked() {
    setState(() => widget.post.toggleLikeFor(currentUser));
  }

  void _toggleIsSaved() {
    setState(() => _isSaved = !_isSaved);
  }

  void _showAddCommentModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddCommentModal(
            user: currentUser,
            onPost: (String text) {
              setState(() {
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
  }*/

  @override
  Widget build(BuildContext context) {
    var jobPostingdTime = DateTime.now().subtract(Duration(
        minutes: widget.post.user.createdAt.minute,
        seconds: widget.post.user.createdAt.second,
        hours: widget.post.user.createdAt.hour));
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
                  imageUrl: "${widget.imgUrl}${widget.post.user.img}",
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.post.user.fullName,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                //if (widget.post.location != null) Text(widget.post.location)
              ],
            ),
            Spacer(),
            Spacer(),
            GestureDetector(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) {
//                      return PostJobScreen(
//                      );
//                    }));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: colorMain,
                    ),
                    borderRadius: BorderRadius.circular(3.0)),
                child: Text(
                  "Apply Now",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            // IconButton(
            //     icon: Icon(Icons.more_vert),
            //     onPressed: () => showDialog(
            //           context: context,
            //           builder: (_) => LogoutOverlay(),
            //         )
            //     //showSnackbar(context, 'More'),
            //     )
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => LogoutOverlay(
                      // post: widget.post,
                      // url: "${widget.imgUrl}/jobs/${widget.post.info.slug}",
                      ),
                );
              },
              child: Icon(Icons.more_vert),
            ),
          ],
        ),
        // Photo Carosuel
        GestureDetector(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CarouselSlider(
                items: [
                  widget.post.info.thumbnail == null
                      ? 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/amazon-rivet-furniture-1533048038.jpg'
                      : widget.imgUrl + widget.post.info.thumbnail
                ].map((url) {
                  return CachedNetworkImage(
                      height: 1000,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      imageUrl: url,
                      placeholder: (context, url) =>
                          dummyCoverImage(context, true),
                      errorWidget: (context, url, error) =>
                          dummyCoverImage(context, false));
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

        bottomBar(jobPostingdTime),
        // Action Bar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeartIconAnimator(
                isLiked: true,
                size: 28.0,
                height: 28.0,
                width: 28.0,
                onTap: () {},
                //_toggleIsLiked,
                triggerAnimationStream: _doubleTapImageEvents.stream,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CommentsScreen();
                }));
                // _showAddCommentModal();
              },
              child: SvgPicture.asset(
                'assets/comment.svg',
                height: 28,
                width: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: SvgPicture.asset(
                'assets/Inbox2.svg',
                height: 28,
                width: 28,
              ),
            ),
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
                                padding:
                                    EdgeInsets.only(right: 7.0, left: 10.0),
                                child: Text(
                                  'Write a comment',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                ),
                              ),
                              onTap: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) {
                                //   return CommentsAndLikeScreen(
                                //     isCommentDetail: true,
                                //     postComments: widget.post,
                                //     imgUrl: widget.baseUrl,
                                //   );
                                // }));
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

            /* if (widget.post.imageUrls.length > 1)
              PhotoCarouselIndicator(
                photoCount: widget.post.imageUrls.length,
                activePhotoIndex: _currentImageIndex,
              ),*/
            Padding( 
              padding: const EdgeInsets.only(right: 4.0, left: 7),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return DetailsScreen(
                  //     post: widget.post,
                  //     baseUrl: widget.baseUrl,
                  //   );
                  // }));
                  // // _showAddCommentModal();
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
              child: InkWell(
                onTap: () {
                  // _toggleIsSaved();
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
            children: <Widget>[
              // Liked by
              if (widget.post.likes.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Liked by '),
                      Text(widget.post.likes[0].userDisplayName, style: bold),
                      if (widget.post.likes.length > 1) ...[
                        Text(' and'),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LikesScreen();
                            }));
                          },
                          child: Text(' ${widget.post.likes.length - 1} others',
                              style: bold),
                        ),
                      ]
                    ],
                  ),
                ),
              // Comments
              // if (widget.post.comments.isNotEmpty)
              /* Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Column(
                    children: widget.post.comments
                        .map((Comment c) => CommentWidget(c))
                        .toList(),
                  ),
                ),*/

              // Posted Timestamp
//              Text(
//                widget.post.info,
//                style: TextStyle(color: Colors.grey, fontSize: 11.0),
//              ),
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
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.post.info.description,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 11,
                  color: smokeyColor,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Container(
                      height: 13,
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                      height: 18,
                      width: 20,
                      child: SvgPicture.asset('assets/location.svg')),
                  Expanded(
                      child: Text(
                    widget.post.info.contactAddressAddress,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: TextStyle(color: smokeyColor, fontSize: 11.0),
                  )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Posted By:",
                    style: TextStyle(color: smokeyColor, fontSize: 11.0),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.post.user.companyName,
                    style: TextStyle(
                        color: colorMain,
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: IconTheme(
                            data: IconThemeData(
                              color: Colors.amber,
                              size: 13,
                            ),
                            child: StarDisplay(value: int.tryParse("${5}")),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "6 Reviews",
                          style: TextStyle(color: smokeyColor, fontSize: 11.0),
                        ),
                      ],
                    ),
                  )
                ],
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

/*class AddCommentModal extends StatefulWidget {
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
}*/
