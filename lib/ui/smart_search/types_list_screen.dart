import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/smart_search/rounded_image_clipper.dart';
import 'package:flutterapp/ui/smart_search/search_broker_screen.dart';
import 'package:flutterapp/ui/smart_search/search_developer_sreen.dart';
import 'package:flutterapp/ui/smart_search/search_estates_screen.dart';
import 'package:flutterapp/ui/smart_search/search_job_screen.dart';
import 'package:flutterapp/ui/smart_search/search_news_screen.dart';
import 'package:flutterapp/ui/smart_search/search_project_screen.dart';
import 'package:flutterapp/ui/smart_search/search_property_screen.dart';
import 'package:flutterapp/utills/config.dart';

class SmartSearchCategory extends StatefulWidget {
  var currentUserImage;
  SmartSearchCategory({this.currentUserImage});
  @override
  _ListTypesScreenState createState() => _ListTypesScreenState();
}

class _ListTypesScreenState extends State<SmartSearchCategory> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: colorMain,
//        elevation: 0.0,
//        title: Text(
//          'Search',
//          style: TextStyle(color: Colors.white),
//        ),
//        actions: actionWidgets(context, widget.currentUserImage),
//      ),
//      body: Stack(
//        children: <Widget>[
//          Positioned.fill(
//            child: Align(
//              alignment: Alignment.bottomCenter,
//              child: Image.asset(
//                "assets/building.png",
//              ),
//            ),
//          ),
//          Column(
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.only(top: 20.0, bottom: 8),
//                child: Text(
//                  'What do you want to List?',
//                  style: TextStyle(color: colorMain, fontSize: 25),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.only(bottom: 10),
//                child: Text(
//                  'Select the following category',
//                  style: TextStyle(color: colorMain),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: GridView.count(
//                  padding: EdgeInsets.zero,
//                  physics: NeverScrollableScrollPhysics(),
//                  shrinkWrap: true,
//                  primary: true,
//                  childAspectRatio: (4 / 4),
//                  crossAxisCount: 3,
//                  mainAxisSpacing: 8,
//                  crossAxisSpacing: 8,
//                  children: <Widget>[
//                    servicesCard('assets/logo.png', 'Property', onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => SearchPropertyScreen(
//                            userImage: widget.currentUserImage,
//                          ),
//                        ),
//                      );
//                    }),
//                    servicesCard('assets/logo.png', 'Projects', onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => SearchProjectsScreen(
//                            userImage: widget.currentUserImage,
//                          ),
//                        ),
//                      );
//                    }),
//                    servicesCard('assets/logo.png', 'Brokers', onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => SearchBrokersScreen(
//                            userImage: widget.currentUserImage,
//                          ),
//                        ),
//                      );
//                    }),
//                    servicesCard('assets/logo.png', 'Developers', onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => SearchDeveloperScreen(
//                            userImage: widget.currentUserImage,
//                          ),
//                        ),
//                      );
//                    }),
//                    servicesCard('assets/logo.png', 'Estates', onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => SearchEstateScreen(
//                            userImage: widget.currentUserImage,
//                          ),
//                        ),
//                      );
//                    }),
//                    servicesCard('assets/logo.png', 'Jobs', onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => SearchJobsScreen(
//                            userImage: widget.currentUserImage,
//                          ),
//                        ),
//                      );
//                    }),
//                    // servicesCard('assets/logo.png', 'News', onTap: () {
//                    //   Navigator.push(
//                    //     context,
//                    //     MaterialPageRoute(
//                    //       builder: (context) => SearchNewsScreen(
//                    //         userImage: widget.currentUserImage,
//                    //       ),
//                    //     ),
//                    //   );
//                    // }),
//                  ],
//                ),
//              ),
//            ],
//          )
//        ],
//      ),

      body: Form(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            RoundedImageWidget(
              screenHeight:  screenHeight,
              image: 'assets/intro_02.png',
              appBarLabel: 'Search',
              imageUrl: widget.currentUserImage,
              pageLogoImage: 'assets/search.svg',
              pageTitle: 'What do you want to List?',
              pageDesc: 'Select the following category',
            ),

            Container(
              height: screenHeight * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10,right: 10,top: 15),
                    child: GridView.count(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: true,
                      childAspectRatio: (4 / 4),
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: <Widget>[
                        servicesCard('assets/property_search_line.svg', 'Property', onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPropertyScreen(
                                userImage: widget.currentUserImage,
                              ),
                            ),
                          );
                        }),
                        servicesCard('assets/projects_search_line.svg', 'Projects', onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchProjectsScreen(
                                userImage: widget.currentUserImage,
                              ),
                            ),
                          );
                        }),
                        servicesCard('assets/brokers_search_line.svg', 'Brokers', onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchBrokersScreen(
                                userImage: widget.currentUserImage,
                              ),
                            ),
                          );
                        }),
                        servicesCard('assets/developers_search_line.svg', 'Developers', onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchDeveloperScreen(
                                userImage: widget.currentUserImage,
                              ),
                            ),
                          );
                        }),
                        servicesCard('assets/estate_search_line.svg', 'Estates', onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchEstateScreen(
                                userImage: widget.currentUserImage,
                              ),
                            ),
                          );
                        }),
                        servicesCard('assets/job_search_line.svg', 'Jobs', onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchJobsScreen(
                                userImage: widget.currentUserImage,
                              ),
                            ),
                          );
                        }),
                        // servicesCard('assets/logo.png', 'News', onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => SearchNewsScreen(
                        //         userImage: widget.currentUserImage,
                        //       ),
                        //     ),
                        //   );
                        // }),
                      ],
                    ),
                  ),

                  bottomBarTextCopyright()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  propertyWidget(height, width) {
    return Container(
      height: height40,
      width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        //controller: passController,
        keyboardType: TextInputType.visiblePassword,
        // obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Job Title, Keywords, company',
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.lock,
              size: prefixIconSize,
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.all(0.0),
          labelStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: colorMain, width: 1.0),
          ),
        ),
      ),
    );
  }

  locationWidget(height, width) {
    return Container(
      height: height40,
      width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        //controller: passController,
        keyboardType: TextInputType.visiblePassword,
        // obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Location, city, province, country',
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.lock,
              size: prefixIconSize,
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.all(0.0),
          labelStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: colorMain, width: 1.0),
          ),
        ),
      ),
    );
  }
  widgetSearchPropertyButton(heightButton, width) {
    return Observer(
      builder: (_) => Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        padding: EdgeInsets.all(0.0),
        height: height40,
        width: width,
        child: RaisedButton(
          padding: EdgeInsets.all(0),
          onPressed: () {},
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => VerifyCodeScreen(),
          //     ),
          //   );
          // },
          color: colorMain,
          disabledColor: disabledButtonColor,
          textColor: Colors.white,
          disabledTextColor: Colors.white,
          child: Stack(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Search Property',
                  style: TextStyle(
                      fontSize: buttonFontSize, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                //  padding: const EdgeInsets.symmetric(horizontal: 0),
                margin: EdgeInsets.all(4),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_forward,
                        size: prefixIconSize,
                        color: colorMain,
                      )),
                ),
              ),
            ],
          ),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }

  Card servicesCard(String image, String name, {Function onTap}) {
    return Card(
      color: smokeybgColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child:SvgPicture.asset(
                  image,
                  width:40.0,
                  height: 40.0,
                  color: colorMain,
                ),
              ),
            ),
            Text(
              name,
              style: TextStyle(color: colorMain,fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
