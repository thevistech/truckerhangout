import 'package:flutter/material.dart';
import 'package:flutterapp/stores/signup_store.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:mobx/mobx.dart';

class PropertySelector extends StatefulWidget {
  final Color color;
  const PropertySelector({
    this.color,
    Key key,
  }) : super(key: key);

  @override
  _MyCustomMenuPrepoertyState createState() => _MyCustomMenuPrepoertyState();
}

class _MyCustomMenuPrepoertyState extends State<PropertySelector> {
  var _active = UserType.VISITOR;
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 40,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: widget.color,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: colorMain, width: 2.0)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _active = UserType.VISITOR;
                });
              },
              child: Container(
                decoration: _active == UserType.VISITOR
                    ? BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: colorMain,
                )
                    : BoxDecoration(),
                padding: EdgeInsets.all(2.0),
                alignment: Alignment.center,
                child: Text(
                  "FOR SELL",
                  style: TextStyle(
                    color: _active == UserType.VISITOR
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _active = UserType.REALESTATE;
                });
              },
              child: Container(
                decoration: _active == UserType.REALESTATE
                    ? BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: colorMain,
                )
                    : BoxDecoration(),
                padding: EdgeInsets.all(2.0),
                alignment: Alignment.center,
                child: Text(
                  "RENT",
                  style: TextStyle(
                    color: _active == UserType.REALESTATE
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _active = UserType.BUILDERANDDEVELOPER;
                });
              },
              child: Center(
                child: Container(
                  decoration: _active == UserType.BUILDERANDDEVELOPER
                      ? BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: colorMain,
                  )
                      : BoxDecoration(),
                  padding: EdgeInsets.all(2.0),
                  alignment: Alignment.center,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "WANTED",
                      style: TextStyle(
                        color: _active == UserType.BUILDERANDDEVELOPER
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
