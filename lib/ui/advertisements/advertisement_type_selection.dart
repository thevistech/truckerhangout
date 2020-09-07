
import 'package:flutter/material.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/config.dart';

class AdvertisementTypeSelection extends StatefulWidget {

  @override
  _MyCustomMenuPropertyPurposeState createState() =>
      _MyCustomMenuPropertyPurposeState();
}

class _MyCustomMenuPropertyPurposeState extends State<AdvertisementTypeSelection> {
  int _selected;
  List<String> list = ["Project","Job","General"];
  @override
  void initState() {
    _selected = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: colorMain, width: 2.0)),
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        height: 40.0,
        padding: EdgeInsets.all(2.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            var title = list[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selected = index;
                });
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  width: (MediaQuery.of(context).size.width / list.length) -
                      13,
                  decoration: _selected == index
                      ? BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: colorMain,
                  )
                      : BoxDecoration(),
                  padding: EdgeInsets.all(2.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "$title",
                        style: TextStyle(
                          fontSize: 12,
                          color:
                          _selected == index ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  )),
            );
          },
        ));
  }
}
