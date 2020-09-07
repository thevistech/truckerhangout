import 'package:flutter/material.dart';
import 'package:flutterapp/ui/advertisements/advertisement_type_selection.dart';
import 'package:flutterapp/utills/config.dart';

// ignore: must_be_immutable
class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  var imgUrl, userName, userEmail, userMobile, subject;
  DateTime dateTime;

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
    var height = MediaQuery.of(context).size.height / 6;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        centerTitle: false,
        titleSpacing: 0.0,
        title: Text('About Us'),
        elevation: 0.0,
        // ignore: missing_required_param
        bottom: PreferredSize(
          child: Container(
            height: 1,
            color: Colors.white,
          ),
        ),
      ),
      body: aboutUsWidget(height, width),
    );
  }

  aboutUsWidget(height, width) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0,left: 15,right: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Text('Who We Are',
          style: TextStyle(
            fontSize: 22,
            color: colorMain,
            fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 10,),
          Text(about_us,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.0,
              )),


          SizedBox(height: 20,),
          Text(about_us,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.0,
              )
          ),
          SizedBox(height: 20,),
          Text(about_us,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.0,
              )
          ),
          SizedBox(height: 10,),

        ],
      ),
    );
  }
}
