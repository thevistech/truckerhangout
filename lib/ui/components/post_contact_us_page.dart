import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/models/country_code_model.dart' as countryModel;
import 'package:flutterapp/models/filter_property_model.dart' as filterModel;
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/components/post_contact_us_country_code.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class PropertyContactUsForm extends StatefulWidget {
  Datum post;
  var baseUrl;
  filterModel.FilterPropertyModel filterPropertyModel;
  PropertyContactUsForm({this.post, this.baseUrl, this.filterPropertyModel});
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<PropertyContactUsForm> {
  countryModel.CountryCodeModel _countryCodeModel;

  var imgUrl, userName, userEmail, userMobile, subject;
  @override
  void initState() {
    Config.getUserProfilePicture().then((value) {
      setState(() {
        imgUrl = value;
      });
    });
    Config.getUserName().then((value) {
      setState(() {
        userName = value;
      });
    });
    Config.getUserEmail().then((value) {
      setState(() {
        userEmail = value;
      });
    });
    // Config.getUserMobile().then((value) {
    //   setState(() {
    //     userMobile = value;
    //   });
    // });
    subject = widget.post.info.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 4;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        centerTitle: false,
        title: Text('Contact'),
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
                imageUrl: imgUrl,
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
      body: moreFilters(height, width),
    );
  }

  moreFilters(height, width) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: height,
              color: colorMain,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(80.0),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 85,
                            height: 85,
                            imageUrl: "${widget.baseUrl}" +
                                "${widget.post.info.userImg}",
                            placeholder: (context, url) => Container(
                                  height: 85,
                                  width: 85,
                                  child: new CircularProgressIndicator(
                                    backgroundColor: colorMain,
                                  ),
                                ),
                            errorWidget: (context, url, error) =>
                                SvgPicture.asset(
                                  defaultUserImage,
                                  color: Colors.white,
                                  height: 85,
                                  width: 85,
                                ))),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.post.user.fullName}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${widget.post.user.companyName}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Observer(
          builder: (_) => Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                userNameTextFeild(width),
                SizedBox(
                  height: 10,
                ),
                userEmailTextFeild(width),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: countryCodePiker(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: numberWidget(),
                    )
                  ],
                ),
                // userNumberTextFeiljjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjd(width),
                SizedBox(
                  height: 10,
                ),
                subjectTextFeild(width),
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

  userEmailTextFeild(width) {
    return Container(
      height: height40,
      width: width,
      child: Observer(
        builder: (_) => TextFormField(
          initialValue: userEmail,
          style: TextStyle(fontSize: 12),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Email',
            hintStyle: TextStyle(fontSize: 12),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
              decoration:
                  BoxDecoration(color: colorMain, shape: BoxShape.circle),
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
      ),
    );
  }

  userNumberTextFeild(width) {
    return Container(
      height: height40,
      width: width,
      child: Observer(
        builder: (_) => TextFormField(
          initialValue: userMobile,
          style: TextStyle(fontSize: 12),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Mobile Number',
            hintStyle: TextStyle(fontSize: 12),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            prefixIcon: Container(
              margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
              decoration:
                  BoxDecoration(color: colorMain, shape: BoxShape.circle),
              child: Icon(
                Icons.mobile_screen_share,
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

  subjectTextFeild(width) {
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
            hintStyle: TextStyle(color: Colors.black),
            hintText: subject == null ? 'Subject' : subject,
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

  messageTextFeild(width) {
    return Container(
      width: width,
      child: TextField(
        maxLines: 10,
        style: TextStyle(fontSize: 12),
        //onChanged: (value) => store.company = value,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.black),
            hintText: 'Type your message here',
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

  showCountryCodePickerDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CountrySearch(
          filterPropertyModel: widget.filterPropertyModel,
        );
      },
    );
  }

  countryCodePiker() {
    return Container(
      child: InkWell(
        onTap: () {
          showCountryCodePickerDialog(context);
        },
        child: Container(
          height: height40,
          child: TextField(
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabled: false,
                hintText: '+92',
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Container(
                    margin: EdgeInsets.fromLTRB(10, 4, 8, 4),
                    child: SvgPicture.asset(
                      "assets/svg_flag.svg",
                      height: 20,
                    )),
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
      ),
    );
  }

  numberWidget() {
    return Container(
      height: height40,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        //controller: passController,
        //   focusNode: numberFocusNode,
        onChanged: (value) {
          // store.mobileNumber = value;
          // store.isLoadingMobile = LoadingState.loading;
          // if (store.error.mobileNumber == null) {
          //   store.verifyMobileNumber(context).then((value) {
          //     store.isLoadingMobile = LoadingState.none;
          //     if (value.error == "false")
          //       store.mobileNumberValid = true;
          //     else
          //       store.mobileNumberValid = false;
          //   });
          // }
        },
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Number',
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.phone,
              size: prefixIconSize,
              color: Colors.white,
            ),
          ),
          // suffixIcon: store.error.mobileNumber == null
          //     ? (store.isLoadingMobile == LoadingState.loading
          //         ? Container(
          //             padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          //             child: SizedBox(
          //               height: 2,
          //               width: 2,
          //               child: CircularProgressIndicator(
          //                 strokeWidth: 0.9,
          //               ),
          //             ),
          //           )
          //         : store.mobileNumberValid
          //             ? Icon(
          //                 Icons.check,
          //                 size: prefixIconSize,
          //                 color: Colors.green,
          //               )
          //             : Icon(Icons.clear,
          //                 size: prefixIconSize, color: Colors.red))
          //     : Container(
          //         width: 0,
          //         height: 0,
          //       ),
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
                'SEND',
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
}
