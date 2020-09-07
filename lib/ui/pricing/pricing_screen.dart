import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/stores/pricing_plane_store.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/events/widgets/ui_helper.dart';
import 'package:flutterapp/ui/pricing/pricing_selection_button.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/constants/text_style.dart';

// ignore: must_be_immutable
class PricingScreen extends StatefulWidget {
  var userImage;
  final PricingStore store = new PricingStore();

  PricingScreen(
      {this.userImage});
  @override
  _PrcingScreenState createState() => _PrcingScreenState();
}

class _PrcingScreenState extends State<PricingScreen> {
  var _currentSliderValue = 20.0;
  var _currentpropertiesSliderValue = 20.0;
  var _currentjobsSliderValue = 20.0;


  @override
  void initState() {
    widget.store.showpackageAccordingtoSelection = packageType.Free;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height / 5.5;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: colorMain,
        centerTitle: false,
        title: Text('Pricing'),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Chat();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(
                "assets/message.svg",
                allowDrawingOutsideViewBox: true,
                height: 35,
                color: Colors.white,
              ),
            ),
          ),
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.transparent,
            // radius: 45.0,
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 34,
                width: 34,
                imageUrl: "${widget.userImage}",
              ),
            ),
          ),
        ],
        leading: InkWell(
            onTap: () {
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
            },
            child: Icon(Icons.arrow_back)),
        elevation: 0.0,
        // ignore: missing_required_param
        bottom: PreferredSize(
          child: Container(
            height: 1,
            color: Colors.white,
          ),
        ),
      ),
//      ],
      body: ListView(
        children: <Widget>[
          pricingWidget(height),
          Observer(
              builder: (context) =>/* widget.store.showpackageAccordingtoSelection == packageType.Free?planDetails():
              widget.store.showpackageAccordingtoSelection == packageType.Premium?Container(
                color: Colors.red,
                height: 200,
              ):
              widget.store.showpackageAccordingtoSelection == packageType.Custom?Container(
                color: Colors.orange,
                height: 200,
              ):Container()*/


                 checkPacakges(widget.store.showpackageAccordingtoSelection)

          ),
        ],
      ),
    );
  }
checkPacakges(packageType showpackageAccordingtoSelection) {
  print('package ::: $showpackageAccordingtoSelection');
  switch(showpackageAccordingtoSelection){
    case packageType.Free:
      return basicdetials();
      break;
    case packageType.Premium:
      return premimumdetials();

      break;
    case packageType.Custom:
      return customPackage();
      break;
    default:
      return Container(
        height: 200,
      );

  }
}
Widget basicdetials(){
  return Container(
    padding:EdgeInsets.all(10),
    child: Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        side: new BorderSide(color: colorMain, width: 1.0),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text('Free',style: TextStyle(fontSize: 27,color: Colors.black,fontWeight: FontWeight.w600),),
            UIHelper.verticalSpace(10),
            Text('PKR 0 / Month',style: TextStyle(fontSize: 20,color:colorMain,fontWeight: FontWeight.bold),),
            UIHelper.verticalSpace(10),
            Container(
              child: ListView.builder(
                itemCount: planedetails.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var event = planedetails[index];
                  return PlaneFeatures(event);
                },
              ),
            ),
            buynow(),
          ],
        ),
      ),
    ),
  );
  }

Widget premimumdetials(){
  return Container(
    padding:EdgeInsets.all(10),
    child: Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        side: new BorderSide(color: colorMain, width: 1.0),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text('Premimum',style: TextStyle(fontSize: 27,color: Colors.black,fontWeight: FontWeight.w600),),
            UIHelper.verticalSpace(10),
            Text('PKR 800 / Month',style: TextStyle(fontSize: 20,color:colorMain,fontWeight: FontWeight.bold),),
            UIHelper.verticalSpace(10),
            Container(
              child: ListView.builder(
                itemCount: planedetails.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var event = planedetails[index];
                  return PlaneFeatures(event);
                },
              ),
            ),
            buynow(),
          ],
        ),
      ),
    ),
  );
}

Widget customPackage(){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
        children: <Widget>[

          customeVlueTypes("No Of Properties Listing"),
          UIHelper.verticalSpace(5),
          projectListingTextField(),
          Slider(value: _currentpropertiesSliderValue,
            min: 0,
            activeColor: colorMain,
            inactiveColor: smokeybgColor,
            max: 1000,
            divisions: 20,
            onChanged: (double value) {
              setState(() {
                _currentpropertiesSliderValue = value;
              });
            },),
          UIHelper.verticalSpace(10),
          customeVlueTypes("No Of Projects Listing"),
          UIHelper.verticalSpace(5),
          projectListingTextField(),
          Slider(value: _currentSliderValue,
            min: 0,
            activeColor: colorMain,
            inactiveColor: smokeybgColor,
            max: 1000,
            divisions: 20,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },),

          UIHelper.verticalSpace(10),
          customeVlueTypes("No Of Job Listing"),
          UIHelper.verticalSpace(5),
          jobListingTextField(),
          Slider(value: _currentjobsSliderValue,
            min: 0,
            activeColor: colorMain,
            inactiveColor: smokeybgColor,
            max: 1000,
            divisions: 20,
            onChanged: (double value) {
              setState(() {
                _currentjobsSliderValue = value;
              });
            },),
          UIHelper.verticalSpace(10),
          buynow()
        ],
      ),
  );
}
  propertiesListingTextField(){
    return Container(
        height: 40,
        width: MediaQuery.of(context).size.width/1.1,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: colorMain, width: 1.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Properties : ',
                style: TextStyle(
                    color:Colors.black54, fontSize: 12.0)),
            SizedBox(
              width: 5,
            ),
            Text('$_currentpropertiesSliderValue',
                style: TextStyle(
                    color: Colors.black54, fontSize: 12.0))
          ],
        ));
  }
  projectListingTextField(){
    return    Container(
        height: 40,
        width: MediaQuery.of(context).size.width/1.1,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: colorMain, width: 1.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Projects : ',
                style: TextStyle(
                    color:Colors.black54, fontSize: 12.0)),
            SizedBox(
              width: 5,
            ),
            Text('$_currentpropertiesSliderValue',
                style: TextStyle(
                    color: Colors.black54, fontSize: 12.0))
          ],
        ));
  }
  jobListingTextField(){
    return Container(
        height: 40,
        width: MediaQuery.of(context).size.width/1.1,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: colorMain, width: 1.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Job : ',
                style: TextStyle(
                    color:Colors.black54, fontSize: 12.0)),
            SizedBox(
              width: 5,
            ),
            Text('$_currentjobsSliderValue',
                style: TextStyle(
                    color: Colors.black54, fontSize: 12.0))
          ],
        ));
  }
  customeVlueTypes(value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Text(
            value,
            style: TextStyle(color: Colors.black),
          ),
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  color: lighrgrey,
                  height: 36,
                )),
          ),
        ],
      ),
    );
  }

  buynow() {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
    child: Container(
      height: height40,
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        color: colorMain,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Buy Now",
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
  );
}
  PlaneFeatures(PricingPlane event){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: <Widget>[
        new Icon(Icons.check, size: 14,color: colorMain,),
        UIHelper.horizontalSpace(5),
        new Text(event.name)
      ],
    ),
  );
  }
  pricingWidget(height) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: height,
          color: colorMain,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Buy Our Services',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Just tap on buy button to subscribe our services',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            PricingSelector(store:widget.store),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }


}

class PricingPlane {
  String name;
  String image;
  String description;

  num price;
  PricingPlane({this.name,this.image,  this.price, this.description});
}

final List<PricingPlane> planedetails = [
  PricingPlane(
    name: "List 2 properties",
    image: 'https://azizidevelopments.com/assets/images/banner/1511171604.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    price: 30,
  ),
  PricingPlane(
    name: "List 2 projects",
    image: 'https://azizidevelopments.com/assets/images/banner/1511171604.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    price: 30,
  ),
  PricingPlane(
    name: "List 10 jobs",
    image: 'https://azizidevelopments.com/assets/images/banner/1511171604.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    price: 30,
  ),
  PricingPlane(
    name: "Map showing your location",
    image: 'https://azizidevelopments.com/assets/images/banner/1511171604.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    price: 30,
  ),
  PricingPlane(
    name: "Contact brokers",
    image: 'https://azizidevelopments.com/assets/images/banner/1511171604.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    price: 30,
  ),
  PricingPlane(
    name: "Create properties",
    image: 'https://azizidevelopments.com/assets/images/banner/1511171604.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    price: 30,
  ),
  PricingPlane(
    name: "Add brokers",
    image: 'https://azizidevelopments.com/assets/images/banner/1511171604.jpg',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    price: 30,
  ),

];


