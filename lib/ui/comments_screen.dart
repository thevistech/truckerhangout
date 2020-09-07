import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/models.dart';
import 'package:flutterapp/ui/comments_widget.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';

class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  var _formKey = GlobalKey<FormState>();

  final _posts = <Post>[
    Post(
      user: grootlover,
      imageUrls: [
        'assets/property1.jpg',
        'assets/property2.jpg',
      ],
      likes: [
        Like(user: rocket),
        Like(user: starlord),
        Like(user: gamora),
        Like(user: nickwu241),
      ],
      comments: [
        Comment(
          text: 'Selling my property #realestate',
          user: rocket,
          commentedAt: DateTime(2019, 5, 23, 14, 35, 0),
          likes: [Like(user: nickwu241)],
        ),
      ],
      location: 'Karachi',
      postedAt: DateTime(2019, 5, 23, 12, 35, 0),
    ),
    Post(
      user: nickwu241,
      imageUrls: ['assets/property2.jpg'],
      likes: [],
      comments: [],
      location: 'Lahore',
      postedAt: DateTime(2019, 5, 21, 6, 0, 0),
    ),
    Post(
      user: nebula,
      imageUrls: ['assets/property3.jpg'],
      likes: [Like(user: nickwu241)],
      comments: [],
      location: 'Karachi',
      postedAt: DateTime(2019, 5, 2, 0, 0, 0),
    ),
  ];
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Comments',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            'assets/back_arrow.png',
            color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: null,
          child: Container(
            height: 1,
            color: colorDivider,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              commentsListWidget(),
              Divider(
                height: 24,
                color: colorDivider,
              ),
              commentInputWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget commentInputWidget() {

    return Container(
      height: 55.0,
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 55,
            height: 55,
            decoration:
                ShapeDecoration(shape: CircleBorder(), color: Colors.white),
            child: Padding(
                padding: EdgeInsets.all(8),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      imageUrl:
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      placeholder: (context, url) =>
                          new CircularProgressIndicator(
                        backgroundColor: colorMain,
                      ),
                      errorWidget: (context, url, error) =>
                          new Image.asset('assets/bhariaimg.png'),
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

//
//  postComment() {
//    var _comment = Comment(
//        comment: _commentController.text,
//        timeStamp: FieldValue.serverTimestamp(),
//        ownerName: widget.user.displayName,
//        ownerPhotoUrl: widget.user.photoUrl,
//        ownerUid: widget.user.uid);
//    widget.documentReference
//        .collection("comments")
//        .document()
//        .setData(_comment.toMap(_comment)).whenComplete(() {
//      _commentController.text = "";
//    });
//  }

  commonetTextFiled() {
    return Stack(
      alignment: Alignment.topRight,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          height: 45,
          child: TextFormField(
            style: TextStyle(fontSize: 12),
            controller: _textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: UiColors.divider, width: 1.0)),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: FlatButton(
                  child: Opacity(
                    opacity: _canPost ? 1.0 : 0.2,
                    child: Text('Post', style: TextStyle(color: Colors.black)),
                  ),
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      setState(() {
                        _canPost = true;
                      });
                    }
                  }),
              hintText: "Add Comment...",
              hintStyle: TextStyle(color: UiColors.divider, fontSize: 12),
              contentPadding: EdgeInsets.all(10),
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: UiColors.divider, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: UiColors.divider, width: 1.0)),
            ),
            /* validator: (value) {
              if (value.isEmpty) {
                setState(() {
                  // showTooltip = true;
                });
                return "";
              }
            }, */
          ),
        ),
      ],
    );
  }

  Widget commentsListWidget() {
    return Flexible(
      child: ListView.builder(
        itemBuilder: (ctx, i) {
          return CommentsWidget(_posts[i]);
        },
        itemCount: 3,
        // controller: widget.scrollController,
      ),
    );
  }
}
