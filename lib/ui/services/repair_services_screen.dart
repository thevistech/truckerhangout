import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/ui/events/widgets/ui_helper.dart';
import 'package:flutterapp/ui/services/rounded_image_services_clipper.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';
class RepairServicesScreen extends StatefulWidget {
  var currentUserImage;
  RepairServicesScreen({this.currentUserImage});
  @override
  _RepairServicesScreenState createState() => _RepairServicesScreenState();
}

class _RepairServicesScreenState extends State<RepairServicesScreen> {
  List<ListItem> _dropdownItemSortyBy = [
    ListItem(1, "All Services"),
    ListItem(2, "Road Services"),
    ListItem(3, "Truck Repair"),
    ListItem(4, "Tire Repair"),
    ListItem(5, "Towing Service"),
    ListItem(6, "Truck Shop")

  ];
  List<ListItem> _dropdownItemQuestionedBy = [
    ListItem(1, "Miles From"),
    ListItem(2, "10 Miles"),
    ListItem(3, "25 Miles"),
    ListItem(4, "50 Miles"),
    ListItem(5, "100 Miles")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  List<DropdownMenuItem<ListItem>> _dropdownMenuQuestionedItems;

  ListItem _selectedItem;
  ListItem _selectedItemQuestionedBy;


  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItemSortyBy);
    _dropdownMenuQuestionedItems = buildDropDownMenuItemsQuestioned(_dropdownItemQuestionedBy);

    _selectedItem = _dropdownMenuItems[0].value;
    _selectedItemQuestionedBy = _dropdownMenuQuestionedItems[0].value;

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
                  appBarLabel: 'Repair And Services',
                  imageUrl:widget.currentUserImage,
                  pageLogoImage: 'assets/question_answer_servicce.svg',
                  pageTitle: 'REPAIR AND SERVICES',
                  pageDesc: 'Find Professional Service.Your #1 Source Of Professional Truck Repair and Services',
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left:15.0,right: 15,top: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                      height: 35,
                                      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(32.0),
                                          color: UiColors.white,
                                          border: Border.all(color: colorMain)),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            value: _selectedItemQuestionedBy,
                                            items: _dropdownMenuQuestionedItems,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedItemQuestionedBy = value;
                                              });
                                            }),
                                      )),
                                ),
                                UIHelper.horizontalSpace(10),
                                Container(
                                    height: 35,
                                    padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32.0),
                                        color: UiColors.white,
                                        border: Border.all(color: colorMain)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          value: _selectedItem,
                                          items: _dropdownMenuItems,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedItem = value;
                                            });
                                          }),
                                    )),


                              ],
                            ),
                          ],
                        )),
                    UIHelper.verticalSpace(10),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0,right: 15,bottom: 5),
                      child: Text('Quick Search',style: TextStyle(
                          fontSize: 15,color: Colors.black,
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                    listDesign(),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0,right: 15,bottom: 5,top:10),
                      child: Text('Why Choose Us?',style: TextStyle(
                          fontSize: 15,color: Colors.black,
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0,right: 15,top: 10),
                      child: Text('As the backbone of the American economy, the trucking and logistics industries move nearly seventy-percent of all U.S. freight. In order to remain competitive and meet delivery deadlines, trucking companies must have reliable drivers and a large fleet of trucks. Trucker Hangout, LLC provides list of Finance Companies for Small Business Loans and Invoice Factoring. For any types of Purposes and Equipment Purchase to keep business moving forward',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12.0,
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10,left: 15,right: 15,bottom: 10),
                      child: Text('Future Posts',style: TextStyle(
                          fontSize: 15,color: Colors.black,
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                    CarouselSlider.builder(
                      height: 200,
                      autoPlay: false,
                      itemCount: 15,
                      viewportFraction: 0.9,

                      itemBuilder: (BuildContext context, int itemIndex) =>
                          Container(
                              child: futurePostListWidget()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10,left: 15,right: 15,bottom: 10),
                      child: Text('Testimonial',style: TextStyle(
                        fontSize: 15,color: Colors.black,
                        fontWeight: FontWeight.w600
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

            contentPadding: EdgeInsets.all(7.0),
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
                                    padding: EdgeInsets.all(10),
                                    child:SvgPicture.asset(
                                        'assets/eld_service.svg',
                                      color: colorMain,
                                    ) ,

                                  ),
                                ),)

                          ),
                          Container(
                            width: 75,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                "Services",
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
  widgetButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      padding: EdgeInsets.all(0.0),
      height: height40,
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
                'Search',
                style: TextStyle(
                    fontSize: buttonFontSize, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),

          ],
        ),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
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
                    height: 100,
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
                      Text('2019 Peterbilt 567, PACCAR, MX-13, 455HP, Fuller 18 Speed UltraShift Plus Transmission, Day Cab, Stock # 956911 Used Day Cab Semi-Truck with remaining factory warranty.',
                        maxLines: 3,
                        style: TextStyle(color: Colors.black45,fontSize: 12),),
                      UIHelper.verticalSpace(4),
                      Row(
                        children: <Widget>[
                          Text('Company :',style: TextStyle(
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
                          Text('Location :',style: TextStyle(
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
}
class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
