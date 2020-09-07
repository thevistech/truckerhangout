import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';

class PropertyCustomSelection extends StatefulWidget {
  const PropertyCustomSelection({
    Key key,
  }) : super(key: key);

  @override
  _PropertyCustomSelection createState() => _PropertyCustomSelection();
}

class _PropertyCustomSelection extends State<PropertyCustomSelection> {
  var _active = propertyType.forsell;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 1.1;
    return Container(
      width: width,
      height: 35,
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _active = propertyType.forsell;
                });
              },
              child: Container(
                decoration: _active == propertyType.forsell
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        color: colorMain,
                      )
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        color: halfWhite),
                padding: EdgeInsets.all(2.0),
                alignment: Alignment.center,
                child: Text(
                  "Homes",
                  style: TextStyle(
                    color: _active == propertyType.forsell
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _active = propertyType.rent;
                });
              },
              child: Container(
                decoration: _active == propertyType.rent
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: colorMain,
                      )
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: halfWhite,
                      ),
                padding: EdgeInsets.all(2.0),
                alignment: Alignment.center,
                child: Text(
                  "Plots",
                  style: TextStyle(
                    color: _active == propertyType.rent
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _active = propertyType.wanted;
                });
              },
              child: Center(
                child: Container(
                  decoration: _active == propertyType.wanted
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: colorMain,
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: halfWhite,
                        ),
                  padding: EdgeInsets.all(2.0),
                  alignment: Alignment.center,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Commerical",
                      style: TextStyle(
                        color: _active == propertyType.wanted
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
