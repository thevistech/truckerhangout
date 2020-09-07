import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterapp/utills/UiStrings.dart';
import 'package:flutterapp/utills/advance_form_property.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/property_selector.dart';

class AdvanceForm1 extends StatefulWidget {
  @override
  _AdvanceFormState createState() => _AdvanceFormState();
}

class _AdvanceFormState extends State<AdvanceForm1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: (MediaQuery.of(context).size.height / 4) ,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/blueimg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                bottom: PreferredSize(
                    child: Container(
                      color: Colors.white,
                      height: 2.0,
                    ),
                    preferredSize: Size.fromHeight(1.0)),
                title: Text(
                  'List Property',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.arrow_back),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(
                      "assets/message.svg",
                      allowDrawingOutsideViewBox: true,
                      height: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              extendBodyBehindAppBar: true,
              body: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                Positioned.fill(
                    top: MediaQuery.of(context).size.height/10,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 15,),
                        Text(
                          'List Property by Advance Form',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'List Property by Advance Form',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              ),
                        ),
                      ],
                    ),
                  ),

                  Positioned.fill(
                      top: 170,
                      child: Container(
                        color: Colors.white,
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left:12.0,right: 12.0),
                          child: Column(
                           children: <Widget>[
                             SizedBox(height: 20,),
                             PropertySelector(color: colorMain,),
                             SizedBox(height: 10,),

                             propertyTypes("Property Type"),
                             SizedBox(height: 10,),
                             PropertyCustomSelection(),
                             SizedBox(height: 10,),
                             featuresList(),
                             SizedBox(height: 10,),
                             TextFileds('Title'),

                           ],
                          ),
                        ),
                      )),

                  bottomBarTextCopyright()

                ],
              )
          ),
        ],
      ),
    );


  }

  TextFileds(minarea) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: Container(
            height: height40,
            child: TextFormField(

              //controller: passController,
              decoration: InputDecoration(
                hintText:minarea,
                hintStyle:TextStyle(
                    color: hintText
                ) ,
                prefixIcon: Container(
                  margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                  decoration:
                  BoxDecoration(color: colorMain, shape: BoxShape.circle),
                  child:Icon(
                    Icons.lock,
                    size: prefixIconSize,
                    color: colorMain,
                  ),
                ),
                contentPadding: EdgeInsets.all(0.0),
                labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                    borderSide: BorderSide(color: colorMain, width: 2.0)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 2.0),
                ),
              ),
            ),
          ),
        ),

      ],

    );
  }
  featuresList() {
    return   SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (ctx, int) {
          return Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage:
                      AssetImage('assets/news_and_info_demo_image.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    Positioned(
                      right: 5,
                      bottom: 0,
                      child:new Container(
                        alignment: Alignment.bottomRight,
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                            color: Color(0xff3ED10A),
                            shape: BoxShape.circle),
                      )
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text("Flats"),
                )
              ],
            ),
          );
        },
      ),
    );
  }



  actionsWidgets() {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage('assets/chat_white.png'),
          ),
          SizedBox(
            width: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.asset(
              UiStrings.user,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 2,
          ),
        ],
      ),
    );
  }

  propertyTypes(value){
    return   Row(
      children: <Widget>[

        Text(value,style: TextStyle(
            color: Colors.black
        ),),

        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
                color: lighrgrey,
                height: 36,
              )),
        ),



      ],
    );
  }



}
