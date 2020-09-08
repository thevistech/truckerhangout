import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ui/services/rounded_image_services_clipper.dart';

class JobServicesScreen extends StatefulWidget {
  var currentUserImage;
  JobServicesScreen({this.currentUserImage});
  @override
  _JobServicesScreenState createState() => _JobServicesScreenState();
}

class _JobServicesScreenState extends State<JobServicesScreen> {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
     body: Form(
    child: ListView(
    padding: EdgeInsets.zero,
        children: <Widget>[
          BackgroundImageServices(
            screenHeight:  screenHeight,
            image: 'assets/bg1.png',
            appBarLabel: 'Search',
            imageUrl:widget.currentUserImage,
            pageLogoImage: 'assets/search.svg',
            pageTitle: 'What do you want to Search?',
            pageDesc: 'Select the following category',
          ),
//          Container(
//            child: Column(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Padding(
//                      padding: EdgeInsets.only(left: 10,right: 10,top: 15),
//                      child: GridView.count(
//                          padding: EdgeInsets.zero,
//                          physics: NeverScrollableScrollPhysics(),
//                          shrinkWrap: true,
//                          primary: true,
//                          childAspectRatio: (4 / 4),
//                          crossAxisCount: 3,
//                          mainAxisSpacing: 4,
//                          crossAxisSpacing: 4,
//                          children: List.generate(servicesList.length, (index) {
//                            var list = servicesList[index];
//                            return servicesCard(list.image,list.name,index,onTap: (){
//                              searchRoutes(index);
//                            });
//                          } ))
//
////              <Widget>[
////                servicesCard('assets/property_search_line.svg', 'Property', onTap: () {
//////                  Navigator.push(
//////                    context,
//////                    MaterialPageRoute(
//////                      builder: (context) => SearchPropertyScreen(
//////                        userImage: widget.currentUserImage,
//////                      ),
//////                    ),
//////                  );
////                }),
////
////
////              ],
//                  )
//                ]
//
//
//            ),
//
//            // bottomBarTextCopyright()
//
//          ),
        ]


    )
    ));
  }
}
