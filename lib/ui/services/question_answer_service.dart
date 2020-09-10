import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/ui/events/widgets/ui_helper.dart';
import 'package:flutterapp/ui/services/rounded_image_services_clipper.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/custom_tab_bar.dart';

class QuestionAnswersScreen extends StatefulWidget {
  var currentUserImage;
  QuestionAnswersScreen({this.currentUserImage});
  @override
  _QuestionAnswersScreenState createState() => _QuestionAnswersScreenState();
}

class _QuestionAnswersScreenState extends State<QuestionAnswersScreen> {
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
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItemSortyBy);
    _dropdownMenuQuestionedItems = buildDropDownMenuItemsQuestioned(_dropdownItemQuestionedBy);
    _dropdownCatageoryItems = buildDropDownCatageoryItems(_dropdownCataeory);
    _selectedItemCatageory =  _dropdownCatageoryItems[0].value;
    _selectedItem = _dropdownMenuItems[0].value;
    _selectedItemQuestionedBy = _dropdownMenuQuestionedItems[0].value;

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
                  appBarLabel: 'Question/Answers',
                  imageUrl:widget.currentUserImage,
                  pageLogoImage: 'assets/question_answer_servicce.svg',
                  pageTitle: 'Question/Answers',
                  pageDesc: 'Have a question and need someone to guide you? Post your question and get answers from likeminded community.',
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    UIHelper.verticalSpace(10),
                    listDesign(),
                    UIHelper.verticalSpace(10),
                     Padding(
                      padding: const EdgeInsets.only(left:15.0,right: 15,top: 08),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32.0),
                                  color: UiColors.white,
                                  border: Border.all(color: colorMain)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    value: _selectedItemCatageory,
                                    items: _dropdownCatageoryItems,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedItemCatageory = value;
                                      });
                                    }),
                              )),
                          UIHelper.verticalSpace(10),
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
                    questionAnswerListViews(),
                    Padding(
                      padding: const EdgeInsets.only(top:10,left: 15,right: 15,bottom: 10),
                      child: Text('Testimonial',style: TextStyle(
                          fontSize: 15,color: Colors.black,
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
  questionAnswerListViews() {
    return ListView.builder(
      itemCount: 3,
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left:15.0,right:15,bottom: 5),
          child: Container(
            // height: 150,
            decoration: BoxDecoration(

                border: Border.all(color: colorDivider),
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '0',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: colorMain,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'ANSWER',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color:Colors.black45,
                                        fontSize: 12,),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: colorMain,
                                          fontSize: 22,
                                          ),
                                    ),
                                    Text(
                                      'VOTE',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color:Colors.black45,
                                        fontSize: 12,),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.keyboard_arrow_up,
                                          size: prefixIconSize,
                                          color: Colors.black45,
                                        ),

                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          size: prefixIconSize,
                                          color: Colors.black45,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )

                          ],
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
                                  'Any Good Place To Eat?',
                                  style: TextStyle(
                                      color: colorMain,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Category: Factoring | Aug/14/2020',
                                  style:
                                  TextStyle(fontSize: 11,),
                                ),

                                SizedBox(
                                  height: 5,
                                ),
                                Text('Question by: Kevin Davis',
                                    style: TextStyle(fontSize: 11)),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                                      color: colorMain, ),
                                  child: Text('View Answer',style: TextStyle(
                                    color: UiColors.white,
                                  ),),
                                )

                              ]),
                        ),
                      )
                    ],
                  ),
                ],
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
