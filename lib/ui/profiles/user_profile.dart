import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/shimmer/profile_shimmer.dart';
import 'package:flutterapp/stores/users_store.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/models/stories_model.dart';

class UserProfile extends StatefulWidget {
  String id;
  String loginUserId;
  final ScrollController scrollController;
  UserProfile({this.id,this.loginUserId, this.scrollController});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UsersProfile store = UsersProfile();
  String userId;
  String loginUserId;
  var imgBaseUrl;

  @override
  void initState() {
    setState(() {
      userId = widget.id;
    });
    print('logged userid ${widget.loginUserId}');
    print('user id ${widget.id}');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!store.isUsersLoaded) getProfileData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) => store.isUsersLoaded
              ? Stack(
            children: <Widget>[
              _coverImg(screenSize),
              Column(

                children: <Widget>[
                  SizedBox(height: screenSize.height / 5.5,),
                  _profileImg(),
                  _fullName(),
                  _desciption(),
                  SizedBox(
                    height: 10,
                  ),
                  _followersFollowings(),
                  personalInfo(),
                  _greyCircles(),
                  //myListing(),
                  status(context),
                  //showPostData(),
                  // showPostData(),

                ],
              )
            ],
          ):shimmerProfile(context)
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
            child:widget.loginUserId==store.profileModel.data.id? Container(
              padding: EdgeInsets.all(0.0),
              width: 30.0,
              height: 30.0,
              child: Icon(Icons.camera_alt,size: 18,),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 1.0)),
                borderRadius: BorderRadius.circular(26.0),
                color:smokeybgColor,
              ),
            ):Container(
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
              width: 144,
              height: 144,
              decoration:
              ShapeDecoration(shape: CircleBorder(), color: Colors.white),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 144,
                      height: 144,
                      imageUrl: "${store.profileModel.url}${store.profileModel.data.img}",
                      placeholder: (context, url) =>
                      new CircularProgressIndicator(
                        backgroundColor: colorMain,
                      ),
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        defaultUserImage,
                        height: 50,
                        width: 50,
                      ))),
            ),
            Positioned(
              right: 14.0,
              bottom: 5.0,
              child: widget.loginUserId==store.profileModel.data.id?Container(
                padding: EdgeInsets.all(0.0),
                width: 30.0,
                height: 30.0,
                child: Icon(Icons.camera_alt,size: 18,),
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 1.0)),
                  borderRadius: BorderRadius.circular(26.0),
                  color:smokeybgColor,
                ),
              ):Container(),
            ),
          ],
        )
    );

  }

  Widget _fullName()
  {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(store.profileModel.data.fullName,
        style: TextStyle(fontSize: 20.0, color: Colors.black , fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _desciption()
  {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        store.profileModel.data.companyName, style: TextStyle(color: Colors.grey , fontSize: 13.0),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left:10),
          child: Text('My Listings', style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 13.0),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12.0 , right: 12.0,top:5),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 1.0)),
                      color: smokeybgColor,
                      // image: DecorationImage(image: AssetImage('assets/pro_img.png') , fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(60.0),
//                      border: Border.all(
//                          color: Colors.deepPurple,
//                          width: 4.0
//                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: SvgPicture.asset(
                        'assets/property_icon.svg',
                        height: 25,
                        width: 25,
                        color: colorMain,
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text('Properties',style: TextStyle(
                      color: Colors.black,fontSize: 12
                    ),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 1.0)),
                      color: smokeybgColor,
                      // image: DecorationImage(image: AssetImage('assets/pro_img.png') , fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(60.0),
//                      border: Border.all(
//                          color: Colors.deepPurple,
//                          width: 4.0
//                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: SvgPicture.asset(
                        'assets/icon_projects.svg',
                        height: 25,
                        width: 25,
                        color: colorMain,
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),

                    child: Text('Projects',style: TextStyle(
                        color: Colors.black,fontSize: 12
                    ),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 1.0)),
                      color: smokeybgColor,
                      // image: DecorationImage(image: AssetImage('assets/pro_img.png') , fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(60.0),
//                      border: Border.all(
//                          color: Colors.deepPurple,
//                          width: 4.0
//                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: SvgPicture.asset(
                        'assets/icon_jobs.svg',
                        height: 25,
                        width: 25,
                        color: colorMain,
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text('Jobs',style: TextStyle(
                        color: Colors.black,fontSize: 12
                    ),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Column(
                children: <Widget>[

                  Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 1.0)),
                      color: smokeybgColor,
                      // image: DecorationImage(image: AssetImage('assets/pro_img.png') , fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(60.0),
//                      border: Border.all(
//                          color: Colors.deepPurple,
//                          width: 4.0
//                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child:SizedBox(width: 60, height: 60, child: Icon(Icons.more_horiz,color: colorMain,),
                    )),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text('More',style: TextStyle(
                        color: Colors.black,fontSize: 12
                    ),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget personalInfo()
  {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0 , left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.business_center,color: colorMain),
              SizedBox(width: 10,),
              Text('Works at Trucker HangOut' , style: TextStyle(color: Colors.black , fontSize: 12.0),)
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.home,color: colorMain,),
              SizedBox(width: 10,),
              Text('Lives in Chicago, Illinois' , style: TextStyle(color: Colors.black , fontSize: 12.0),)
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.access_time,color: colorMain),
              SizedBox(width: 10,),
              Text('Joined on January 2020' , style: TextStyle(color: Colors.black , fontSize: 12.0),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Divider(height: 1, thickness: 1,color: colorDivider,),
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
          padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left:10),
          child: Text('My Listings', style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 13.0),),
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
                              child: Icon(Icons.home , color: colorMain,)),
                          decoration: BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 1.0)),
                            color: smokeybgColor,
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
                          child: Text('Jobs' ,
                            style: TextStyle(color: Colors.black, fontSize: 12.0),),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left:10),
          child: Text('Post', style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 13.0),),
        ),
        Container(
          height: 140,
          width: MediaQuery.of(context).size.width,
          color:smokeybgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child:
                    Container(
                      width: 40,
                      height: 40,
                      decoration:
                      ShapeDecoration(shape: CircleBorder(), color: Colors.white),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              width: 40,
                              height:40,
                              imageUrl: "${store.profileModel.url}${store.profileModel.data.img}",
                              placeholder: (context, url) =>
                              new CircularProgressIndicator(
                                backgroundColor: colorMain,
                              ),
                              errorWidget: (context, url, error) => SvgPicture.asset(
                                defaultUserImage,
                                height: 40,
                                width: 40,
                              ))),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("What's on your mind?" , style: TextStyle(color: Colors.black54,fontSize: 12),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
                child: Divider(height: 1, thickness: 1,),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.photo,color: colorMain,),
                    SizedBox(width: 2,),
                    Text('Photo/Video' , style: TextStyle(fontSize: 12.0),),
                    Spacer(),
                    Icon(Icons.camera_alt,color: colorMain),
                    SizedBox(width: 2,),
                    Text('Camera' , style: TextStyle(fontSize: 12.0),),
                    Spacer(),
                    Icon(Icons.poll,color: colorMain),
                    SizedBox(width: 2,),
                    Text('Poll' , style: TextStyle(fontSize: 12.0),),
                    Spacer(),
                    Icon(Icons.business_center,color: colorMain),
                    SizedBox(width: 2,),
                    Text('Job' , style: TextStyle(fontSize: 12.0),)
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

 /* showPostData() {
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
  }*/

  void getProfileData() {
    store.getProfile(context,userId).then((value) {
      store.isUsersLoaded = true;
      store.profileModel = value;

    });
  }
}
