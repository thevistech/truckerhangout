import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/advertisements/advertisement_type_selection.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rounded_date_picker/src/material_rounded_date_picker_style.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

// ignore: must_be_immutable
class CreateAdvertisementScreen extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<CreateAdvertisementScreen> {
  var imgUrl, userName, userEmail, userMobile, subject;
  DateTime dateTime;
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  @override
  void initState() {
    dateTime = DateTime.now();

    Config.getUserProfilePicture().then((value) {
      setState(() {
        imgUrl = value;
      });
    });

    getUserImage();
    super.initState();
  }

  getUserImage() async {
    imgUrl = await Config.getUserProfilePicture();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 5;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        centerTitle: false,
        titleSpacing: 0.0,
        title: Text('Advertisement'),
        actions: actionWidgets(context),
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
      body: advForm(height, width),
    );
  }

  advForm(height, width) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: height,
              color: colorMain,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Post your advertisement in one click',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Just mention your general information',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AdvertisementTypeSelection()
                ],
              ),
            ),
          ],
        ),
        Observer(
          builder: (_) => Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                labelTextsArea('Select Image'),
                SizedBox(
                  height: 10,
                ),
                addAdvImageContainer(),
                SizedBox(
                  height: 10,
                ),
                advTitleTextFeild(width),
                SizedBox(
                  height: 10,
                ),
                urlTextFeild(width),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: advPublishDateTextFeild(width),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: advExpireDateTextFeild(width),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                messageTextFeild(width),
                SizedBox(
                  height: 10,
                ),
                sendButton(width)
              ],
            ),
          ),
        ),
      ],
    );
  }

  labelTextsArea(s) {
    return Observer(
      builder: (_) => Row(
        children: <Widget>[
          Text(
            s,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }

  userNameTextFeild(width) {
    return Container(
      height: height40,
      width: width,
      child: Observer(
        builder: (_) => TextFormField(
          initialValue: userName,
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Name',
            hintStyle: TextStyle(fontSize: 12),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
              decoration:
                  BoxDecoration(color: colorMain, shape: BoxShape.circle),
              child: Icon(
                Icons.person,
                size: prefixIconSize,
                color: Colors.white,
              ),
            ),
            contentPadding: EdgeInsets.all(5),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }

  advTitleTextFeild(width) {
    return Container(
      height: height40,
      width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Title',
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0)),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.alternate_email,
              size: prefixIconSize,
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.all(5),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: colorMain, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
        ),
      ),
    );
  }

  urlTextFeild(width) {
    return Container(
      height: height40,
      width: width,
      child: TextField(
        style: TextStyle(fontSize: 12),
        //onChanged: (value) => store.company = value,
        decoration: InputDecoration(
            filled: true,
            enabled: false,
            fillColor: Colors.white,
            hintText: 'Url',
            hintStyle: TextStyle(fontSize: 12, color: Colors.black),
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
              decoration:
                  BoxDecoration(color: colorMain, shape: BoxShape.circle),
              child: Icon(
                Icons.archive,
                size: prefixIconSize,
                color: Colors.white,
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
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

  advPublishDateTextFeild(width) {
    return Container(
      height: height40,
      width: width,
      child: InkWell(
        onTap: () {
          showDatePicker();
        },
        child: TextField(
          readOnly: true,
          style: TextStyle(fontSize: 12),
          //onChanged: (value) => store.company = value,
          decoration: InputDecoration(
              filled: true,
              enabled: false,
              fillColor: Colors.white,
              hintText: 'Publish Date',
              hintStyle: TextStyle(fontSize: 12, color: Colors.black),
              prefixIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                decoration:
                    BoxDecoration(color: colorMain, shape: BoxShape.circle),
                child: Icon(
                  Icons.date_range,
                  size: prefixIconSize,
                  color: Colors.white,
                ),
              ),
              contentPadding: EdgeInsets.all(10.0),
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
      ),
    );
  }

  advExpireDateTextFeild(width) {
    return Container(
      height: height40,
      width: width,
      child: InkWell(
        onTap: () {
          showDatePicker();
        },
        child: TextField(
          style: TextStyle(fontSize: 12),
          //onChanged: (value) => store.company = value,
          decoration: InputDecoration(
              filled: true,
              enabled: false,
              fillColor: Colors.white,
              hintText: 'Expire Date',
              hintStyle: TextStyle(fontSize: 12, color: Colors.black),
              prefixIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                decoration:
                    BoxDecoration(color: colorMain, shape: BoxShape.circle),
                child: Icon(
                  Icons.date_range,
                  size: prefixIconSize,
                  color: Colors.white,
                ),
              ),
              contentPadding: EdgeInsets.all(10.0),
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
      ),
    );
  }

  messageTextFeild(width) {
    return Container(
      width: width,
      child: TextField(
        maxLines: 7,
        style: TextStyle(fontSize: 12),
        //onChanged: (value) => store.company = value,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(fontSize: 12, color: Colors.black),
            hintText: 'Type about advertisement here',
            contentPadding: EdgeInsets.all(10.0),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            )),
      ),
    );
  }

  sendButton(width) {
    return Observer(
      builder: (_) => RaisedButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          Navigator.pop(context);
        },
        color: colorMain,
        textColor: Colors.white,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'POST',
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

  showDatePicker() async {
    DateTime newDateTime = await showRoundedDatePicker(
      context: context,
      theme: ThemeData(primaryColor: Color(0xff2A326D)),
      styleDatePicker: MaterialRoundedDatePickerStyle(
        textStyleDayButton: TextStyle(fontSize: 23, color: Colors.white),
        textStyleYearButton: TextStyle(
          fontSize: 32,
          color: Colors.white,
        ),
        textStyleDayHeader: TextStyle(
          fontSize: 18,
          color: colorMain,
        ),
        textStyleCurrentDayOnCalendar: TextStyle(
            fontSize: 22, color: Colors.red, fontWeight: FontWeight.bold),
        textStyleDayOnCalendar: TextStyle(fontSize: 14, color: Colors.black),
        textStyleDayOnCalendarSelected: TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        textStyleDayOnCalendarDisabled:
            TextStyle(fontSize: 28, color: Colors.white.withOpacity(0.1)),
        textStyleMonthYearHeader: TextStyle(
            fontSize: 22, color: colorMain, fontWeight: FontWeight.bold),
        paddingDatePicker: EdgeInsets.all(0),
        paddingMonthHeader: EdgeInsets.all(26),
        paddingActionBar: EdgeInsets.all(16),
        paddingDateYearHeader: EdgeInsets.all(32),
        sizeArrow: 24,
        colorArrowNext: colorMain,
        colorArrowPrevious: colorMain,
        marginLeftArrowPrevious: 16,
        marginTopArrowPrevious: 16,
        marginTopArrowNext: 16,
        marginRightArrowNext: 32,
        textStyleButtonAction: TextStyle(fontSize: 28, color: Colors.white),
        textStyleButtonPositive: TextStyle(
            fontSize: 14, color: colorMain, fontWeight: FontWeight.bold),
        textStyleButtonNegative: TextStyle(
            fontSize: 14, color: colorMain, fontWeight: FontWeight.bold),
        decorationDateSelected:
            BoxDecoration(color: colorMain, shape: BoxShape.circle),
        backgroundPicker: Colors.white,
        backgroundActionBar: Colors.white,
        backgroundHeaderMonth: Colors.white,
      ),
    );

    if (newDateTime != null) {
      setState(() => dateTime = newDateTime);
    }
  }

  addAdvImageContainer() {
    Asset asset;

    if (images.length > 0) {
      asset = images[0];

      print('image ::: ${images[0].name}');
    }
    return InkWell(
      onTap: () {
        loadAssets();
      },
      child: new Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: colorMain),
          borderRadius: BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: images.length > 0
            ? Container(
                width: double.infinity,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: AssetThumb(
                    asset: asset,
                    height: 150,
                    width: 150,
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  loadAssets();
                },
                child: Icon(
                  Icons.add,
                  color: colorMain,
                ),
              ),
      ),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try { 
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          startInAllView: true,
          statusBarColor: "#2A326D",
          actionBarColor: "#2A326D",
          actionBarTitle: "Select Pictures",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }
}
