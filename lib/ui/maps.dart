import 'package:flutter/material.dart';
import 'package:flutterapp/ui/grid_view.dart';
import 'package:flutterapp/utills/config.dart';

class Maps extends StatelessWidget {
  var currentUserImage;
  Maps({this.currentUserImage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: actionWidgets(context),
          backgroundColor: colorMain,
          title: Text(
            'Maps',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.normal),
          ),
        ),
        body: Container(
            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(14),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                childAspectRatio: 8.0 / 9.0,
                children: List.generate(2, (index) {
                  return Card(
                    elevation: 4,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Grid()));
                      },
                      child: Container(
                        //   decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/gps_PNG8.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Bahria Town Karachi')
                          ],
                        ),
                      ),
                    ),
                  );
                }))));
  }
}
