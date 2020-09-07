import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ui/avatar_widget.dart';
import '../utills/config.dart';
import 'package:shimmer/shimmer.dart';

shimmerProfile(context) {
  return Shimmer.fromColors(
    baseColor: colorDivider,
    highlightColor: colorGrey[100],
    child: Container(
      child: profileShimmers()
    ),
  );
}

class profileShimmers extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const profileShimmers({
    this.padding = const EdgeInsets.symmetric(vertical: 5.0),
  });


  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
   return Stack(
      children: <Widget>[
        _coverImg(screenSize),
        Column(
          children: <Widget>[
            SizedBox(height: screenSize.height / 5.5,),
            _profileImg(),
            _fullName(context),
            _desciption(),
            SizedBox(
              height: 20,
            ),
            _followersFollowings(),
            personalInfo(context),
            // showPostData(),

          ],
        )
      ],
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
              width: 144,
              height: 144,
              decoration:
              ShapeDecoration(shape: CircleBorder()),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Container(
                    width: 144,
                    height: 144,
                    color: Colors.black,
                  )
              ),
            ),

          ],
        )
    );

  }

  Widget _fullName(context)
  {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child:Container(
        color: Colors.black,
        height: 10,
        width: MediaQuery.of(context).size.width/3,
      )
    );
  }

  Widget _desciption()
  {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Container(),
    );
  }

  Widget _followersFollowings(){

    return  Container(
      child: Column(
        children: <Widget>[
          Divider(
            color: colorDivider,
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: colorDivider,
                            height: 10,
                            width: 30,

                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Container(
                          color: colorDivider,
                          height: 20,

                        ),
                      ],
                    )
                ),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: colorDivider,
                            height: 10,
                            width: 30,

                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Container(
                          color: colorDivider,
                          height: 20,

                        ),
                      ],
                    )
                ),
                Padding(padding: EdgeInsets.only(left: 10.0)),

                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: colorDivider,
                            height: 10,
                            width: 30,

                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Container(
                          color: colorDivider,
                          height: 20,

                        ),
                      ],
                    )
                )
              ],
            ),
          ),
          Divider(
            color: colorDivider,
            height: 2,
          ),
        ],
      ),
    );

  }
  Widget personalInfo(context)
  {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0 , left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 25,
                width: 25,
                decoration: new BoxDecoration(
                  color: colorDivider,
                  shape: BoxShape.circle,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10.0)),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: colorDivider,
                        height: 10,
                        width: MediaQuery.of(context).size.width/2,
                      ),

                    ],
                  ))
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Container(
                height: 25,
                width: 25,
                decoration: new BoxDecoration(
                  color: colorDivider,
                  shape: BoxShape.circle,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10.0)),
              Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: colorDivider,
                        height: 10,
                        width: MediaQuery.of(context).size.width/2,

                      ),

                    ],
                  ))
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


}

