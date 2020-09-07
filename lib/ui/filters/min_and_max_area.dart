import 'package:flutter/material.dart';
import 'package:flutterapp/models/filter_property_model.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/config.dart';

class MinAndMaxArea extends StatefulWidget {
  final DashBoardMainStore dashboardStore;
  MinAndMaxArea({this.dashboardStore});
  MinAndMaxAreaState createState() => MinAndMaxAreaState();
}

class MinAndMaxAreaState extends State<MinAndMaxArea>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  int _selectedMin;
  int _selectedMax;
  List<BathRange> _minValues = [];
  List<BathRange> _maxValues = [];

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    _selectedMin = 0;
    _selectedMax = 0;
    _minValues = widget.dashboardStore.filterPropertyModel.data.minAreas;
    _maxValues = widget.dashboardStore.filterPropertyModel.data.maxAreas;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          margin: EdgeInsets.all(25.0),
          padding: EdgeInsets.all(15.0),
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.clear)),
                ),
                Text(
                  "Area Range",
                  style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: listViewMinValues(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: listViewMaxValues(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                buttonsRow(),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  listViewMinValues() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          "MIN",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: colorMain)),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _minValues.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _selectedMin = index;
                  setState(() {});
                },
                child: Container(
                  height: 30,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: _selectedMin == index
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: colorMain,
                        )
                      : null,
                  padding: EdgeInsets.all(2.0),
                  alignment: Alignment.center,
                  child: Text(
                    _minValues[index].text,
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          _selectedMin == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  listViewMaxValues() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          "MAX",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: colorMain)),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _maxValues.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _selectedMax = index;
                  setState(() {});
                },
                child: Container(
                  height: 30,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: _selectedMax == index
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: colorMain,
                        )
                      : null,
                  padding: EdgeInsets.all(2.0),
                  alignment: Alignment.center,
                  child: Text(
                    _maxValues[index].text,
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          _selectedMax == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  buttonsRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                border: Border.all(color: colorMain)),
            height: 30,
            child: RaisedButton(
              onPressed: () {
                widget.dashboardStore.moreFilterMinArea = "0";
                widget.dashboardStore.moreFilterMaxArea = "Any";
                _selectedMax = 0;
                _selectedMin = 0;
                setState(() {});
              },
              textColor: Colors.white,
              color: Colors.white,
              padding: EdgeInsets.all(0.0),
              child: Text(
                'RESET',
                style: TextStyle(fontSize: 12.0, color: colorMain),
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            height: 30,
            child: RaisedButton(
              onPressed: () {
                widget.dashboardStore.moreFilterMinArea =
                    _minValues[_selectedMin].value;
                widget.dashboardStore.moreFilterMaxArea =
                    _maxValues[_selectedMax].value;
                Navigator.pop(context);
              },
              color: colorMain,
              disabledColor: disabledButtonColor,
              textColor: Colors.white,
              disabledTextColor: Colors.white,
              padding: EdgeInsets.all(0.0),
              child: Text(
                'SUBMIT',
                style: TextStyle(fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
        ),
      ],
    );
  }
}
