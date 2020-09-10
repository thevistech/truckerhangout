import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/ui/components/start_rating_widget.dart';
import 'package:flutterapp/ui/events/widgets/ui_helper.dart';
import 'package:flutterapp/ui/services/rounded_image_services_clipper.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';

class CompanyReviewsServiceScreen extends StatefulWidget {
  var currentUserImage;
  CompanyReviewsServiceScreen({this.currentUserImage});
  @override
  _CompanyReviewsScreenState createState() => _CompanyReviewsScreenState();
}

class _CompanyReviewsScreenState extends State<CompanyReviewsServiceScreen> with TickerProviderStateMixin {

  AnimationController controller;



  List<ListItem> _dropdownItemSortyBy = [
    ListItem(1, "Sort By"),
    ListItem(2, "All Listing"),
    ListItem(3, "24 Hours"),
    ListItem(4, "7 Days"),
    ListItem(5, "30 Days")
  ];
  List<ListItem> _dropdownItemQuestionedBy = [
    ListItem(1, "Question By"),
    ListItem(2, "Most Votes"),
    ListItem(3, "Most Answers"),
    ListItem(4, "Answered"),
    ListItem(5, "Unanswered")
  ];
  List<ListItem> _dropdownCataeory = [
    ListItem(1, "Select Category"),
    ListItem(2, "CDL"),
    ListItem(3, "Trucks"),
    ListItem(4, "Driving"),
    ListItem(5, "ELD/GPS Devices"),
    ListItem(6, "Factoring"),

  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  List<DropdownMenuItem<ListItem>> _dropdownMenuQuestionedItems;
  List<DropdownMenuItem<ListItem>> _dropdownCatageoryItems;

  ListItem _selectedItem;
  ListItem _selectedItemQuestionedBy;
  ListItem _selectedItemCatageory;


  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1))..forward();

    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItemSortyBy);
    _dropdownMenuQuestionedItems = buildDropDownMenuItemsQuestioned(_dropdownItemQuestionedBy);
    _dropdownCatageoryItems = buildDropDownCatageoryItems(_dropdownCataeory);
    _selectedItemCatageory =  _dropdownCatageoryItems[0].value;
    _selectedItem = _dropdownMenuItems[0].value;
    _selectedItemQuestionedBy = _dropdownMenuQuestionedItems[0].value;

  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  List<DropdownMenuItem<ListItem>> buildDropDownCatageoryItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name,style: TextStyle(color: UiColors.black,fontSize: 12),),
          value: listItem,
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name,style: TextStyle(color: UiColors.black,fontSize: 12),),
          value: listItem,
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<ListItem>> buildDropDownMenuItemsQuestioned(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name,style: TextStyle(color: UiColors.black,fontSize: 12),),
          value: listItem,
        ),
      );
    }
    return items;
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                BackgroundImageServices(
                  screenHeight:  screenHeight,
                  image: 'assets/bg1.png',
                  appBarLabel: 'Company Reviews',
                  imageUrl:widget.currentUserImage,
                  pageLogoImage: 'assets/company_service.svg',
                  pageTitle: 'COMPANY REVIEWS',
                  pageDesc: 'Find truck companies reviews, ratings and profiles on just one click and search.',
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   ratingsList(),
                    Padding(
                      padding: const EdgeInsets.only(top:5,left: 15,right: 15,bottom: 10),
                      child: Text('Testimonial',style: TextStyle(

                        fontSize: 18,color: Colors.black,
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


          ),

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
  searchTextField() {
    return Container(
      height: height40,
      child: TextFormField(
        enabled: false,
        style: TextStyle(fontSize: 12),
        //controller: passController,
        keyboardType: TextInputType.visiblePassword,
        // obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            filled: true,
            enabled: false,
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
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            )),
      ),
    );
  }
  Widget listDesign() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            height: 90,
            child: Padding(
              padding: const EdgeInsets.only(top:5.0),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (ctx, i) {
                    //var list = servicesList[i];
                    return GestureDetector(
                      onTap: (){
                        // openServicePage(i);
                      },
                      child: Column(
                        children: <Widget>[

                          Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: new BoxDecoration(
                                color: smokeybgColor,
                                shape: BoxShape.circle,
                              ),
                              child:Padding(padding: EdgeInsets.all(4),
                                child:    Container(
                                  decoration: new BoxDecoration(
                                      color: smokeybgColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: UiColors.white)),

                                  child: Padding(
                                    padding: EdgeInsets.all(13),
                                    child:SvgPicture.asset(
                                        'assets/eld_service.svg'
                                    ) ,

                                  ),
                                ),)

                          ),
                          Container(
                            width: 75,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                "Lis1",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )),
      ],
    );
  }
  ratingsList() {
   return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        var animation = Tween<double>(begin: 800.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval((1 / 3) * index, 1.0, curve: Curves.decelerate),
          ),
        );
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Transform.translate(
            offset: Offset(animation.value, 0.0),
            child:
              Padding(
              padding: const EdgeInsets.only(left:15.0,right:15,bottom: 5),
          child: Container(
            // height: 150,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    //  mainAxisAlignment : MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 90,
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                              child: Image.network('https://www.jaxdailyrecord.com/sites/default/files/styles/sliders_and_planned_story_image_870x580/public/210254_standard.png',fit: BoxFit.fill,)),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Test Company',
                                  style: TextStyle(
                                      color: UiColors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: <Widget>[
                                    IconTheme(
                                      data: IconThemeData(
                                        color: Colors.amber,
                                        size: 15,
                                      ),
                                      child: StarDisplay(
                                          value: 3),
                                    ),
                                    Text('(6 Reviews)',
                                        style: TextStyle(fontSize: 11,color: Colors.black45)),
                                  ],
                                ),

                                SizedBox(
                                  height: 5,
                                ),
                                Text('Best ELD Devices, Reviews, Ratings & Buyer guide',
                                    style: TextStyle(fontSize: 11,color: Colors.black45)),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                                    color: colorMain, ),
                                  child: Text('VIEW PROFILE',style: TextStyle(
                                      color: UiColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600
                                  ),),
                                )

                              ]),
                        ),
                      )
                    ],
                  ),
                  Divider(color: colorDivider,)
                ],
              ),
            ),
          ),
        ),
          ),
        );
      },
    );

  }
}
class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

