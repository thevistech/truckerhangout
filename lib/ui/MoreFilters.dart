import 'package:flutter/material.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/UiStrings.dart';

import '../utills/config.dart';

class MoreFilters extends StatefulWidget {
  @override
  _MoreFiltersState createState() => _MoreFiltersState();
}
class _MoreFiltersState extends State<MoreFilters> {
  var list = [for(var i=0; i<10; i+=1) i];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height / 15;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UiColors.white,

        brightness: Brightness.light, // status bar brightness

        elevation: 1,
        titleSpacing: 0.0,
        title: appbarSearch(),
        actions: <Widget>[
          actionsWidgets(),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),

                          child: Divider(
                            color: lighrgrey,
                            height: 36,
                          )),
                    ),
                    Text("Filter Property",style: TextStyle(
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
                ),
                SizedBox(height: 10,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 100,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          onPressed: () {

                          },
                          color: colorMain,
                          textColor: Colors.white,
                          child: Text("For Sell",
                              style: TextStyle(fontSize: 12)),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          onPressed: () {

                          },
                          color: halfWhite,
                          textColor: lighrgrey,
                          child: Text("For Rent",
                              style: TextStyle(fontSize: 12)),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          onPressed: () {

                          },
                          color: halfWhite,
                          textColor: lighrgrey,
                          child: Text("Wanted",
                              style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ]),

                SizedBox(height: 20,),


               labelTexts("Country","For Rents","Change Country"),
                SizedBox(height: 20,),
                countryTextFilesWidget(width,height,"Country"),
                SizedBox(height: 20,),
                locationTextFilesWidget(width,height,"Location"),
                SizedBox(height: 10,),
                propertyTypes("PropertyTypes"),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 110,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          onPressed: () {

                          },
                          color: colorMain,
                          textColor: Colors.white,
                          child: Text("Homes",
                              style: TextStyle(fontSize: 12)),
                        ),
                      ),
                      SizedBox(
                        width: 110,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          onPressed: () {

                          },
                          color: halfWhite,
                          textColor: lighrgrey,
                          child: Text("Plots",
                              style: TextStyle(fontSize: 12)),
                        ),
                      ),
                      SizedBox(
                        width: 110,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          onPressed: () {

                          },
                          color: halfWhite,
                          textColor: lighrgrey,
                          child: Text("Commercial",
                              style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ]),
                featuresList(),

                propertyTypes("Bedrooms"),
                bedRoomsList(list),
                SizedBox(height: 20,),
                propertyTypes("Baths"),
                bedRoomsList(list),
                SizedBox(height: 20,),

                labelTexts("Area","(Sq Ft)","Change Area Unit"),
                SizedBox(height: 18,),

                AreaTextField("Min Area","Max Area"),
                SizedBox(height: 20,),
                labelTexts("Price","(PKR)","Change Currency"),
                SizedBox(height: 18,),
                priceTextField("Min Price","Max Price"),
                SizedBox(height: 20,),

                propertyTypes("Property Features"),
                SizedBox(height: 10,),

                featuresList(),
                SizedBox(height: 10,),
                propertyTypes("People Nearby"),
                SizedBox(height: 10,),

                featuresList(),
                SizedBox(height: 10,),
                propertyTypes("Property Keyword ID "),
                SizedBox(height: 20,),

                propertyKeywordAndIdTextFiled("Property Keyword","ID"),
                SizedBox(height: 20,),
                buttonFilterProperty(),
                SizedBox(height: 20,),

                bottomBarTextCopyright(),









              ],
            ),
          )

        ],
      ),

    );

  }

  appbarSearch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        SizedBox(
          height: 29,
          width: 29,
          child: Image(
            image: AssetImage("assets/back_arrow.png"),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
            child: Container(
              height: 35,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: TextFormField(
                  //controller: passController,
                  decoration: InputDecoration(
                    hintText: 'Search Broker',
                    prefixIcon: Container(
                      margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.0),
                            bottomLeft: Radius.circular(32.0)),
                        boxShadow: [
                          BoxShadow(
                              color: UiColors.primaryColor,
                              spreadRadius: 3),
                        ],
                      ),
                      child: Icon(
                        Icons.search,
                        size: prefixIconSize,
                        color: Colors.white,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(const Radius.circular(32.0)),
                        borderSide:
                        BorderSide(color: colorMain, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      borderSide: BorderSide(color: colorMain, width: 1.0),
                    ),
                  ),
                ),
              ),
            )),
      ]),
    );
  }
  actionsWidgets() {
    return   Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage(UiStrings.list_icon),
          ),
          SizedBox(
            width: 2,
          ),
          Image(
            image: AssetImage(UiStrings.chat_icon),
          ),
          SizedBox(
            width: 2,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
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
  countryTextFilesWidget(width,height,value) {
    return Container(
      height: height40,
      width: width,
      child: TextFormField(
        readOnly: true,

        //controller: passController,
        decoration: InputDecoration(
          hintText:value,
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
    );
  }
  locationTextFilesWidget(width,height,value) {
    return Container(
      height: height40,
      width: width,
      child: TextFormField(
        readOnly: true,

        //controller: passController,
        decoration: InputDecoration(
          hintText:value,
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

  bedRoomsList(List<int> list) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (ctx, index) {
          final item = list[index];

          return Container(
            padding: EdgeInsets.all(5.0),

            width: 55,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)),
              child:Container(
                  color: halfWhite,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(item.toString(),style: TextStyle(
                        color: Colors.black
                    ),)),
                  )) ,
            ),
          );
        },
      ),
    );
  }

  labelTexts(s,t,u) {
   return Row(
      children: <Widget>[

        Text(s,style: TextStyle(
            color: Colors.black
        ),),
        SizedBox(width: 5,),
        Text(t,style: TextStyle(
            color: lightTxtColor
        ),),
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
                color: lighrgrey,
                height: 36,
              )),
        ),
        Text(u,style: TextStyle(
            color: lightTxtColor
        ),),


      ],
    );
  }

  priceTextField(minArea,maxArea){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
      child: Container(
      height: height40,
        child: TextFormField(
          style: TextStyle(
            fontSize: 12
          ),

          //controller: passController,
          decoration: InputDecoration(
            hintText:minArea,
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
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
          ),
        ),
      ),
    ),
        SizedBox(width: 10,),
        Expanded(
          child: Container(
            height: height40,
            child: TextFormField(
            style:TextStyle(fontSize: 12),
              //controller: passController,
              decoration: InputDecoration(
                hintText:maxArea,
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
                    borderSide: BorderSide(color: colorMain, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0),
                ),
              ),
            ),
          ),
        )
      ],

    );
  }

  featuresList() {
    return   SizedBox(
      height: 130,
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
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                  backgroundColor: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text("Home"),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  propertyKeywordAndIdTextFiled(keyword, id) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Container(
            height: height40,
            child: TextFormField(
              readOnly: true,

              //controller: passController,
              decoration: InputDecoration(
                hintText:keyword,
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
        SizedBox(width: 10,),
        Expanded(
          flex: 3,
          child: Container(
            height: height40,
            child: TextFormField(
              readOnly: true,

              //controller: passController,
              decoration: InputDecoration(
                hintText:id,
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
        )
      ],

    );
  }

  buttonFilterProperty() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      padding: EdgeInsets.all(0.0),
      height: height40,
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        onPressed: () {},
        color: colorMain,
        disabledColor: colorMain,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        child:Align(
          alignment: Alignment.center,
          child: Text(
            ' Filter Property ',
            style: TextStyle(fontSize: buttonFontSize),
            textAlign: TextAlign.center,
          ),
        ),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

  AreaTextField(minarea, maxarea) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: Container(
            height: height40,
            child: TextFormField(
              style: TextStyle(
                fontSize: 12
              ),
              //controller: passController,
              decoration: InputDecoration(
                fillColor: UiColors.white,
                filled: true,
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
                    borderSide: BorderSide(color: colorMain, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Container(
            height: height40,
            child: TextFormField(
              style: TextStyle(
                  fontSize: 12
              ),
              //controller: passController,
              decoration: InputDecoration(
                hintText:maxarea,
                fillColor: UiColors.white,
                filled: true,
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
                    borderSide: BorderSide(color: colorMain, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0),
                ),
              ),
            ),
          ),
        )
      ],

    );
  }


}