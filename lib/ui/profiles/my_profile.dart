import 'package:flutter/material.dart';
import 'package:flutterapp/models/models.dart';
import 'package:flutterapp/utills/config.dart';

import '../posts_widget.dart';

class MyProfile extends StatefulWidget {

  final ScrollController scrollController;
  MyProfile({this.scrollController, Key key});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        title: Text('My Profile', style: TextStyle(color: Colors.black),),
//        leading: Icon(Icons.arrow_back , color: Colors.black,),
//      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            _coverImg(screenSize),
            Column(
              children: <Widget>[
                SizedBox(height: screenSize.height / 5.5,),
                _profileImg(),
                _fullName(),
                _desciption(),
                SizedBox(
                  height: 20,
                ),
               // _followersFollowings(),
                _greyCircles(),
                personalInfo(),
               // showPostData(),

              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _coverImg(Size screensize)
  {
    return Stack(
      children: <Widget>[
        Container(
          height:  screensize.height / 3.5,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/property2.jpg') , fit: BoxFit.cover)
          ),
        ),
        Positioned(
          right: 5.0,
          bottom: 5.0,
          child: Container(
            height: 35.0,
            width: 75.0,
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(4.0)
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.camera_alt),
                    SizedBox(width: 2,),
                    Text('Edit'),
                  ],
                ),
          ),
        )
        )
      ],
    );
  }

  Widget _profileImg()
  {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: 140.0,
            height: 140.0,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/property3.jpg') , fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(80.0),
                border: Border.all(
                    color: Colors.white,
                    width: 4.0
                )
            ),
          ),
          Positioned(
            right: 16.0,
            bottom: 10.0,
            child: Container(
              padding: EdgeInsets.all(0.0),
              width: 30.0,
              height: 30.0,
              child: Icon(Icons.camera_alt),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: Colors.grey[300],
              ),
            ),
          ),
        ],
      )
    );

  }

  Widget _fullName()
  {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(
        'John Stone' ,
        style: TextStyle(fontSize: 20.0, color: Colors.black , fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _desciption()
  {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
          'some text goes here' , style: TextStyle(color: Colors.grey , fontSize: 13.0),
      ),
    );
  }

  Widget _followersFollowings(){

    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Divider(
            color: colorDivider,
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Text('23'
                      //"${widget.brokersList.noOfFollowers}",
                    ),
                    SizedBox(height: 5,),

                    Text(
                      "Followers",
                      style:
                      TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      '12'
                     // "${widget.brokersList.noOfFollowing}",
                    ),
                    SizedBox(height: 5,),

                    Text(
                      "Following",
                      style:
                      TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Text(
                        '112'
                      // "${widget.brokersList.noOfFollowing}",
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "Friends",
                      style:
                      TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(
            color: colorDivider,
            height: 2,
          ),
        ],
      ),
    );

  }

  Widget _greyCircles()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
          child: Column(
            children: <Widget>[
              ClipOval(
                child: Material(
                  color: Colors.grey[300], // button color
                  child: InkWell(
                    splashColor: Colors.red, // inkwell color
                    child: SizedBox(width: 60, height: 60, child: Icon(Icons.person)),
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text('About'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
          child: Column(
            children: <Widget>[
              ClipOval(
                child: Material(
                  color: Colors.grey[300], // button color
                  child: InkWell(
                    splashColor: Colors.red, // inkwell color
                    child: SizedBox(width: 60, height: 60, child: Icon(Icons.picture_in_picture)),
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text('Gallery'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Column(
            children: <Widget>[
              ClipOval(
                child: Material(
                  color: Colors.grey[300], // button color
                  child: InkWell(
                    splashColor: Colors.red, // inkwell color
                    child: SizedBox(width: 60, height: 60, child: Icon(Icons.person_add)),
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text('Friends'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Column(
            children: <Widget>[
              ClipOval(
                child: Material(
                  color: Colors.grey[300], // button color
                  child: InkWell(
                    splashColor: Colors.red, // inkwell color
                    child: SizedBox(width: 60, height: 60, child: Icon(Icons.more_horiz)),
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text('More'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget personalInfo()
  {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0 , left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.business_center),
              SizedBox(width: 10,),
              Text('Works at Trucker HangOut' , style: TextStyle(color: Colors.black , fontSize: 12.0),)
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Icon(Icons.home),
              SizedBox(width: 10,),
              Text('Lives in Chicago, Illinois' , style: TextStyle(color: Colors.black , fontSize: 12.0),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Divider(height: 1, thickness: 1,),
          )
        ],
      ),
    );
  }

  Widget myListing()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
          child: Text('MY LISTING', style: TextStyle(color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.bold),),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (ctx, i)
            {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 65.0,
                      height: 65.0,
                      child: Container(
                          child: Icon(Icons.home , color: Colors.white,)),
                      decoration: BoxDecoration(
                          border: Border.fromBorderSide(BorderSide(color: Colors.green, width: 3.0)),
                        color: Colors.deepPurple,
                         // image: DecorationImage(image: AssetImage('assets/pro_img.png') , fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(80.0),
//                      border: Border.all(
//                          color: Colors.deepPurple,
//                          width: 4.0
//                      )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text('JOBS' ,
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12.0),),
                    ),
                  ],
                ),
              );
            }
          )
        ),
      ],
    );
  }

  Widget status(BuildContext context)
  {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/pro_img.png') , fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(80.0),
                  ),
                ),
            ),
              SizedBox(width: 10,),
              Text("What's on your mind?" , style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 12.0, right: 12.0),
            child: Divider(height: 1, thickness: 1,),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.photo),
                SizedBox(width: 2,),
                Text('PHOTO/VIDEO' , style: TextStyle(fontSize: 12.0),),
                Spacer(),
                Icon(Icons.camera_alt),
                SizedBox(width: 2,),
                Text('CAMERA' , style: TextStyle(fontSize: 12.0),),
                Spacer(),
                Icon(Icons.poll),
                SizedBox(width: 2,),
                Text('POLL' , style: TextStyle(fontSize: 12.0),),
                Spacer(),
                Icon(Icons.business_center),
                SizedBox(width: 2,),
                Text('JOB' , style: TextStyle(fontSize: 12.0),)
              ],
            ),
          )
        ],
      ),
    );
  }

  showPostData() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, i) {
//        if (i == 0) {
//          return brokersLists();
//        }
       // return PostWidget(_posts[i]);
      },
      //itemCount: _posts.length,
     // controller: widget.scrollController,
    );
  }
}
