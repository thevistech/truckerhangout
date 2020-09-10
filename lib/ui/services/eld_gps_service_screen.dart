import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/event_model.dart';
import 'package:flutterapp/ui/events/widgets/nearby_event_card.dart';
import 'package:flutterapp/ui/events/widgets/ui_helper.dart';
import 'package:flutterapp/ui/services/rounded_image_services_clipper.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/ui/services/components/title_with_more_bbtn.dart';
import 'package:flutterapp/ui/services/components/recomend_plants.dart';
class EldGpsServiceScreen extends StatefulWidget {
  var currentUserImage;
  EldGpsServiceScreen({this.currentUserImage});
  @override
  _EldGpsServiceScreenState createState() => _EldGpsServiceScreenState();
}

class _EldGpsServiceScreenState extends State<EldGpsServiceScreen> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1))..forward();
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
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
                    appBarLabel: 'ELD/GPD Devices',
                    imageUrl:widget.currentUserImage,
                    pageLogoImage: 'assets/jobs_services.svg',
                    pageTitle: 'ELD/GPS DEVICES',
                    pageDesc: 'Find best offers at the lowest rates for trucking services. Great offers!',
                  ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TitleWithMoreBtn(title: "Recomended", press: () {}),

                      UIHelper.verticalSpace(10),
                      RecomdedList(),
                      UIHelper.verticalSpace(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:15.0),
                        child: Row(
                          children: <Widget>[
                            Text('ELD AND',style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                                fontWeight: FontWeight.w600
                            ),),
                            UIHelper.horizontalSpace(3),
                            Text('GPS PROVIDER',
                                style: TextStyle(
                                color: colorMain,
                                fontSize: 15, fontWeight: FontWeight.w600
                            ),),
                          ],
                        ),
                      ),

                      UIHelper.verticalSpace(10),
                      Padding(
                        padding: const EdgeInsets.only(left:15.0,right: 15),
                        child: Text('We provide with a list of all major companies to compare prices, reviews and ratings of all the major Electronic Logging Device & GPS. Whether you are shopping for your first ELD & GPS or looking for a better one, you have come to the right place. Explore our entire collection of ELD & GPS. Reviews to find the best option for your fleet.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 12.0,
                            )
                        ),
                      ),
                    ]
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:15.0,bottom: 10,top: 10),
                child: Text('Future Post',style: TextStyle(
                      fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600,
                  ),),
              ),
              CarouselSlider.builder(
                height: 230,
                autoPlay: true,
                itemCount: 15,
                viewportFraction: 0.9,

                itemBuilder: (BuildContext context, int itemIndex) =>
                    Container(
                      child: futurePostListWidget()),
                    ),

              UIHelper.verticalSpace(10),


            ],
          ),
                ]


            )
        ));
  }

  Widget buildNearbyConcerts() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Nearby Events"),
              Spacer(),
              UIHelper.horizontalSpace(16),
            ],
          ),
          SizedBox(height: 20,),
          ListView.builder(
            itemCount: nearbyEvents.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              final event = nearbyEvents[index];
              var animation = Tween<double>(begin: 800.0, end: 0.0).animate(
                CurvedAnimation(
                  parent: controller,
                  curve: Interval((1 / nearbyEvents.length) * index, 1.0, curve: Curves.decelerate),
                ),
              );
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) => Transform.translate(
                  offset: Offset(animation.value, 0.0),
                  child: NearbyEventCard(
                    event,
                    onTap: () {},
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget futurePostListWidget() {
    return Container(
      margin: const EdgeInsets.only(right: 12),

      child: InkWell(
        onTap: (){},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: smokeybgColor,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: 'event.image',
                  child: Image.asset(
                   'assets/bg_image_trucker.jpg',
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0,top:4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('2019 Peterbilt 567, PACCAR......',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),
                      UIHelper.verticalSpace(4),
                      Text('2019 Peterbilt 567, PACCAR, MX-13, 455HP, Fuller 18 Speed UltraShift Plus Transmission.',
                        maxLines: 3,
                        style: TextStyle(color: Colors.black45,fontSize: 12),),
                      UIHelper.verticalSpace(4),
                      Row(
                        children: <Widget>[
                          Text('Company : ',style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,fontWeight: FontWeight.w600
                          ),),
                          Text('Rush Truck Center - Dallas',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Location : ',style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,fontWeight: FontWeight.w600
                          ),),
                          Text('Irving, TX',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
  searchTextField() {
    return Container(
      height: height40,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        //controller: passController,
        keyboardType: TextInputType.visiblePassword,
        // obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'City,State or ZIP',
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.search,
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
}
