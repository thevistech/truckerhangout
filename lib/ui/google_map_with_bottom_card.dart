import 'package:flutter/material.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GooglePage extends StatefulWidget {
  DashBoardMainStore dashBoardMainStore;
  GooglePage({this.dashBoardMainStore});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GooglePage> {
  GoogleMapController _controller;
  List<Marker> allMarkers = [];
  PageController _pageController;
  int prevPage;

  @override
  void initState() {
    coffeeShops.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.shopName),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.shopName, snippet: element.address),
          onTap: () {},
          position: element.locationCoords));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 50.0,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(40.7128, -74.0060), zoom: 12.0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ),
        ),
        _buildContainer(),
      ],
    );
  }

  _coffeeShopList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: () {
            // moveCamera();
          },
          child: Stack(children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    height: 125.0,
                    width: 275.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                        child: Row(children: [
                          Container(
                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          coffeeShops[index].thumbNail),
                                      fit: BoxFit.cover))),
                          SizedBox(width: 2.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coffeeShops[index].shopName,
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  coffeeShops[index].address,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    coffeeShops[index].description,
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )
                              ])
                        ]))))
          ])),
    );
  }

   cards(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.asset('assets/bhariaimg.png',
            fit: BoxFit.cover, height: 200.0, width: width),
      ),
    );
  }

   topFavouriteWidget() {
    return Positioned(
      top: 15,
      right: 10,
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration:
            BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
        child: SizedBox(
          height: 18,
          width: 18,
          child: IconButton(
            padding: EdgeInsets.all(0.0),
            onPressed: () {},
            icon: Icon(Icons.favorite, size: 18, color: colorMain),
            //size: suffixIconSize,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

   bottomWidget(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Positioned(
        bottom: -50,
        right: 0,
        left: 0,
        child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            //  color: Colors.blue,
            height: 100,
            width: width,
            child: Card(
              //   color: Colors.blue,
              child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('from'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'PKR 1.5 Crore',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              Container(
                                  width: 35,
//child: Icon(Icons.airline_seat_individual_suite),
//                            child: Icon(Icons.hotel),
//                            child: Icon(Icons.open_with),
                                  child: Image.asset(
                                    'assets/beds.png',
                                    fit: BoxFit.fill,
                                  )),
                              Positioned(
                                  top: 4,
                                  left: -10,
                                  child: Text('4',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              Container(
                                  width: 30,
                                  child: Image.asset(
                                    'assets/washroom.png',
                                    fit: BoxFit.fill,
                                  )),
                              Positioned(
                                  top: 4,
                                  left: -10,
                                  child: Text('4',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '120 Sqft',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset('assets/squareft.png')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Bahria Town',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Iqbal Villa Karachi',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(Pakistan)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: colorMain),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: IconButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone_android,
                                  size: 18,
                                  color: colorMain,
                                ),
                                //size: suffixIconSize,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: IconButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone_in_talk,
                                  size: 18,
                                  color: colorMain,
                                ),
                                //size: suffixIconSize,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: IconButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 18,
                                  color: colorMain,
                                ),
                                //size: suffixIconSize,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            )));
  }

  _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 250.0,
          child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, int) {
                return Container(
                  width: MediaQuery.of(context).size.width / 1,
                  padding: EdgeInsets.only(bottom: 50),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      cards(context),
                      topFavouriteWidget(),
                      bottomWidget(context)
                    ],
                  ),
                );
              })),
    );
  }

  myDetailsContainer(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "4.1",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStarHalf,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
                child: Text(
              "(946)",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
          ],
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: coffeeShops[_pageController.page.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
}

class Coffee {
  String shopName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Coffee(
      {this.shopName,
      this.address,
      this.description,
      this.thumbNail,
      this.locationCoords});
}

final List<Coffee> coffeeShops = [
  Coffee(
      shopName: 'Stumptown Coffee Roasters',
      address: '18 W 29th St',
      description:
          'Coffee bar chain offering house-roasted direct-trade coffee, along with brewing gear & whole beans',
      locationCoords: LatLng(40.745803, -73.988213),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Andrews Coffee Shop',
      address: '463 7th Ave',
      description:
          'All-day American comfort eats in a basic diner-style setting',
      locationCoords: LatLng(40.751908, -73.989804),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Third Rail Coffee',
      address: '240 Sullivan St',
      description:
          'Small spot draws serious caffeine lovers with wide selection of brews & baked goods.',
      locationCoords: LatLng(40.730148, -73.999639),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Hi-Collar',
      address: '214 E 10th St',
      description:
          'Snazzy, compact Japanese cafe showcasing high-end coffee & sandwiches, plus sake & beer at night.',
      locationCoords: LatLng(40.729515, -73.985927),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Everyman Espresso',
      address: '301 W Broadway',
      description:
          'Compact coffee & espresso bar turning out drinks made from direct-trade beans in a low-key setting.',
      locationCoords: LatLng(40.721622, -74.004308),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipOMNvnrTlesBJwUcVVFBqVF-KnMVlJMi7_uU6lZ=w90-h90-n-k-no')
];

//New York Marker
