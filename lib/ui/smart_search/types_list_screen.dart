import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/ui/smart_search/rounded_image_clipper.dart';
import 'package:flutterapp/ui/smart_search/search_cdl_schools_screen.dart';
import 'package:flutterapp/ui/smart_search/search_marketplace_screen.dart';
import 'package:flutterapp/ui/smart_search/search_questation_answer_screen.dart';
import 'package:flutterapp/ui/smart_search/search_job_screen.dart';
import 'package:flutterapp/ui/smart_search/search_finance_screen.dart';
import 'package:flutterapp/ui/smart_search/search_eldgps_screen.dart';
import 'package:flutterapp/ui/smart_search/search_buy_lease_screen.dart';
import 'package:flutterapp/ui/smart_search/search_insurance_screen.dart';
import 'package:flutterapp/ui/smart_search/search_company_review.dart';
import 'package:flutterapp/ui/smart_search/search_repair_services_screen.dart';

import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/models/services_model.dart';
import 'package:flutterapp/models/services_model.dart';

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

      body: Form(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            RoundedImageWidget(
              screenHeight:  screenHeight,
              image: 'assets/bg1.png',
              appBarLabel: 'Search',
              imageUrl: widget.currentUserImage,
              pageLogoImage: 'assets/search.svg',
              pageTitle: 'What do you want to Search?',
              pageDesc: 'Select the following category',
            ),
            Container(
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
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            children: List.generate(servicesList.length, (index) {
                              var list = servicesList[index];
                              return servicesCard(list.image,list.name,index,onTap: (){
                                searchRoutes(index);
                              });
                            } ))

//              <Widget>[
//                servicesCard('assets/property_search_line.svg', 'Property', onTap: () {
////                  Navigator.push(
////                    context,
////                    MaterialPageRoute(
////                      builder: (context) => SearchPropertyScreen(
////                        userImage: widget.currentUserImage,
////                      ),
////                    ),
////                  );
//                }),
//
//
//              ],
                    )
                  ]


              ),

              // bottomBarTextCopyright()

            ),
        ]


    )
    ));
  }

  searchRoutes(int index){
    switch(index){
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchJobsScreen(
              userImage: imgUrl,
            ),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchBuyLeaseScreen(
              userImage: imgUrl,
            ),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchMarketPlaceScreen(
              userImage: imgUrl,
            ),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchEldGpsScreen(
              userImage: imgUrl,
            ),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchFinanceScreen(
              userImage: imgUrl,
            ),
          ),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchQuestionAnswerScreen(
              userImage: imgUrl,
            ),
          ),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchCdlSchoolsScreen(
              userImage: imgUrl,
            ),
          ),
        );
        break;
      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchInsuranceScreen(
              userImage: imgUrl,
            ),
          ),
        );
        break;

      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchCompanyReviews(
              userImage: imgUrl,
            ),
          ),
        );
        break;

      case 9:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchReapirAndServicesScreen(
              userImage: imgUrl,
            ),
          ),
        );
        break;
    }
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

  Card servicesCard(String image, String name, int index,{Function onTap}) {
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
                  color: Colors.black,
                ),
              ),
            ),
        Container(
          width: 80,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              "${name}",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),
            ),
          )
        ),

            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
