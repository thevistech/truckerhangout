import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ui/events/widgets/ui_helper.dart';
import 'package:flutterapp/ui/services/rounded_image_services_clipper.dart';
import 'package:flutterapp/utills/config.dart';

class FinanceFactoringScreen extends StatefulWidget {
  var currentUserImage;
  FinanceFactoringScreen({this.currentUserImage});
  @override
  _FinanceFactoringScreenState createState() => _FinanceFactoringScreenState();
}

class _FinanceFactoringScreenState extends State<FinanceFactoringScreen> {
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
                    appBarLabel: 'Finance/Factoring',
                    imageUrl:widget.currentUserImage,
                    pageLogoImage: 'assets/finical_service.svg',
                    pageTitle: 'Finance/Factoring',
                    pageDesc: 'Looking for Best Invoice Factoring Company or Business Loan for Trucking Company .',
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:15.0,right: 15.0,top: 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              UIHelper.verticalSpace(10),
                              Center(
                                child: Image.asset('assets/finance_factoring_money.png',
                                  width: 460,
                                height: 200,),
                              ),
                              UIHelper.verticalSpace(10),
                              Text('Get the money you need fast and without hassle',
                                  style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 1,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700
                                  )
                              ),
                              UIHelper.verticalSpace(10),
//                              Container(height: 1,
//                              color: colorMain,
//                              width: MediaQuery.of(context).size.width/5,),
                              Text('As the backbone of the American economy, the trucking and logistics industries move nearly seventy-percent of all U.S. freight. In order to remain competitive and meet delivery deadlines, trucking companies must have reliable drivers and a large fleet of trucks. Trucker Hangout, LLC provides list of Finance Companies for Small Business Loans and Invoice Factoring. For any types of Purposes and Equipment Purchase to keep business moving forward',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  )
                              ),
                              UIHelper.verticalSpace(10),

                              Divider(color: colorDivider,thickness: 1,height: 3,)

                            ]


                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10,left: 15,right: 15,bottom: 10),
                        child: Text('Testimonial',style: TextStyle(
                          letterSpacing: 1,
                            fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700
                        ),),
                      ),
                      CarouselSlider.builder(
                        height: 190,
                        autoPlay: true,
                        itemCount: 5,
                        viewportFraction: 0.8,

                        itemBuilder: (BuildContext context, int itemIndex) =>
                            Container(
                                child: testimonialWidget()),
                      ),

                      UIHelper.verticalSpace(10),


                    ],
                  ),
                ]


            )
        ));
  }

  testimonialWidget() {

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: smokeybgColor,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                height:60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: colorMain, width: 1),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/bg_image_trucker.jpg'),
                    fit: BoxFit.fill,
                  ),

                ),
              ),
//              CircleAvatar(
//                radius: 28,
//                backgroundColor: Colors.transparent,
//                // radius: 45.0,
//                child: ClipOval(
//                  child: Image.asset('assets/bg_image_trucker.jpg',
//                    fit: BoxFit.cover,
//                    height:60,
//                    width: 60,
//                  ),
//                ),
//              ),
              UIHelper.verticalSpace(5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text('We are very happy with Trucker Hangout Services. Every service is good and responsive. There are no obstacle and hurdle to find good solution of your problems like when we had a tough time finding trucks for our fleet',
                          maxLines: 6,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                          color: Colors.black,
                            fontSize: 12
                        ),),
                      ),
                    ),
                  Text('Muhammad Uzair',style: TextStyle(color: colorMain,fontWeight: FontWeight.w600),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
