import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/ui/SignInOrSignUp.dart';
import 'package:flutterapp/ui/SplashScreen.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/intro_slider_model.dart';
import 'config.dart';

class IntroSliderSplash extends StatefulWidget {
  @override
  _IntroSliderSplashState createState() => _IntroSliderSplashState();
}

class _IntroSliderSplashState extends State<IntroSliderSplash> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? colorMain : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    slideIndex = index;
                  });
                },
                children: <Widget>[
                  SlideTile(
                    imagePath: mySLides[0].getImageAssetPath(),
                    title: mySLides[0].getTitle(),
                    desc: mySLides[0].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySLides[1].getImageAssetPath(),
                    title: mySLides[1].getTitle(),
                    desc: mySLides[1].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySLides[2].getImageAssetPath(),
                    title: mySLides[2].getTitle(),
                    desc: mySLides[2].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySLides[3].getImageAssetPath(),
                    title: mySLides[3].getTitle(),
                    desc: mySLides[3].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySLides[4].getImageAssetPath(),
                    title: mySLides[4].getTitle(),
                    desc: mySLides[4].getDesc(),
                  )
                ],
              ),
            ),

            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 5; i++)
                          i == slideIndex
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            controller.animateToPage(2,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linear);
                          },
                          child:Container(
                            child: MaterialButton(
                              color: colorMain,
                              onPressed: () {
                                controller.animateToPage(2,
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.linear);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Skip",
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(
                                  color: colorMain,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                        slideIndex != 4
                            ? GestureDetector(
                          onTap: () {
//                            print("this is slideIndex: $slideIndex");
//                            controller.animateToPage(slideIndex + 1,
//                                duration: Duration(milliseconds: 500),
//                                curve: Curves.linear);
                          },
                          child:Container(
                            child: MaterialButton(
                              color: colorMain,
                              onPressed: () {
                                controller.animateToPage(slideIndex + 1,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.linear);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Next",
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(
                                  color: colorMain,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),

                        )
                            : GestureDetector(
                          onTap: () {
//                            Config.isIntroScreenViewed(true);
//                            Navigator.of(context).pushReplacement(
//                                MaterialPageRoute(
//                                    builder: (BuildContext context) =>
//                                        SplashScreen()));
                          },
                          child:Container(
                            child: MaterialButton(
                              color: colorMain,
                              onPressed: () {
                                Config.isIntroScreenViewed(true);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SplashScreen()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Get It",
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(
                                  color: colorMain,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SlideTile extends StatelessWidget {
  String imagePath, title, desc;
  SlideTile({this.imagePath, this.title, this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          // Image.asset(imagePath),
          Image.asset(imagePath,
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,),
          Positioned(
              bottom:120,
              left: 0.0,
              right: 0.0,
              child: Column(
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25,color: colorMain),
              ),
              SizedBox(
                height: 20,
              ),
              Text(desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14,color: Colors.black)),
            ],
          ))
        ],
      ),
    );
  }
}
