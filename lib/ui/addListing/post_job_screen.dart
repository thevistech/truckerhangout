import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/models/job_typeModal.dart';

import 'package:flutterapp/utills/config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PostJobScreen extends StatefulWidget {
  var userImage;
  PostJobScreen({Key key, this.userImage}) : super(key: key);
  @override
  _PostJobScreenState createState() => _PostJobScreenState();
}

const DEFAULT_LOCATION = LatLng(24.85695639, 67.0455794);

class _PostJobScreenState extends State<PostJobScreen> {
  LatLng currentLocation = DEFAULT_LOCATION;
  Completer<GoogleMapController> _mapController = Completer();
  String finalLat = '';
  String finalLong = '';
  bool searching = false;

  double heightsFactor = 0.20;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorMain,
          titleSpacing: 0.0,
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: null,
            child: Container(
              height: 2,
              color: Colors.white,
            ),
          ),
          title: Text('Post Job'),
          actions: actionWidgets(context)),
      body: ListView(
        children: <Widget>[
          Container(
            height: height * 0.15,
            color: colorMain,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Job Post',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Enter Job Details',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: DividerWithNames(height: height, text: 'Job Types'),
          ),
          Container(
            height: 80,
            child: ListView.builder(
              padding: EdgeInsets.only(left: width * 0.03),
              itemCount: jobtypes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var jobtype = jobtypes[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.023),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: halfWhite,
                        backgroundImage: AssetImage(
                          jobtype.image,
                        ),
                        radius: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          jobtype.title,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  // imageUrl: product.image,
                  // name: product.title,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: DividerWithNames(height: height, text: 'Information'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: developerNameWidget(height / 15, width / 1.3),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'About',
                  contentPadding: EdgeInsets.only(left: 5.0, top: 8.0),
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(7.0)),
                      borderSide: BorderSide(color: colorMain, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    borderSide: BorderSide(color: colorMain, width: 1.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: DividerWithNames(height: height, text: 'Salary (PKR)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: salaryFormWidget(height / 15, width / 1.3),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: salaryToWidget(height / 15, width / 1.3),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: DividerWithNames(height: height, text: 'Details'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: numberOfPositionWidget(height / 15, width / 1.3),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: experienceWidget(height / 15, width / 1.3),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: salaryDurationWidget(height / 15, width / 1.3),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: hiringDurationWidget(height / 15, width / 1.3),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: DividerWithNames(height: height, text: 'Contact Details'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: emailAddWidget(height / 15, width / 1.3),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: extWidget(height / 15, width / 1.3),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: numberWidget(height / 15, width / 1.3),
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 8, top: 8),
            child: addressWidget(height / 15, width / 1.3),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: countryWidget(height / 15, width / 1.3),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: cityWidget(height / 15, width / 1.3),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: locationWidget(height / 15, width / 1.3),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: postalCodeWidget(height / 15, width / 1.3),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: DividerWithNames(height: height, text: 'Map Location'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: height * 0.45,
              width: double.infinity,
              child: GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: currentLocation, zoom: 15.5),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onCameraMove: (CameraPosition camerapos) {
                  searching = false;
                  setState(() {});
                  finalLat = camerapos.target.latitude.toString();
                  finalLong = camerapos.target.longitude.toString();
                },
                onMapCreated: (GoogleMapController controller) {
                  _mapController.complete(controller);
                },
                onCameraIdle: () {
                  searching = true;
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.05, bottom: height * 0.05),
            child: submitWidget(height / 15, width),
          ),
          bottomBarTextCopyright(),
        ],
      ),
    );
  }

  submitWidget(heightButton, width) {
    return Observer(
      builder: (_) => Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        padding: EdgeInsets.all(0.0),
        height: height40,
        width: width,
        child: RaisedButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => VerifyCodeScreen(),
            //   ),
            // );
          },
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
                  'NEXT',
                  style: TextStyle(
                      fontSize: buttonFontSize, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                //  padding: const EdgeInsets.symmetric(horizontal: 0),
                margin: EdgeInsets.all(4),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_forward,
                        size: prefixIconSize,
                        color: colorMain,
                      )),
                ),
              ),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }
}

postalCodeWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Postal Code',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

locationWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Location',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

cityWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'City',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

countryWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Country',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

addressWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Address',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

numberWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Number',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

extWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: '+92',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

emailAddWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Email Address',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

numberOfPositionWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'No of Positions',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

experienceWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Experience',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

salaryDurationWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Salary Duration',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

hiringDurationWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Hiring Duration',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

salaryFormWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'From',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

salaryToWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'To',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

developerNameWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.visiblePassword,
      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Developer Name',
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: Container(
          margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
          decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
          child: Icon(
            Icons.lock,
            size: prefixIconSize,
            color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

aboutWidget(height, width) {
  return Container(
    height: height40,
    width: width,
    child: TextFormField(
      style: TextStyle(fontSize: 12),
      //controller: passController,

      keyboardType: TextInputType.multiline,
      maxLines: 3,

      // obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'About',
        hintStyle: TextStyle(color: Colors.black),
        contentPadding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

class DividerWithNames extends StatelessWidget {
  const DividerWithNames({
    Key key,
    this.text,
    @required this.height,
  }) : super(key: key);

  final String text;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(text),
        Expanded(
          child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Divider(
              color: Colors.grey[400],
              height: height * 0.05,
              thickness: 1,
            ),
          ),
        ),
      ],
    );
  }
}
