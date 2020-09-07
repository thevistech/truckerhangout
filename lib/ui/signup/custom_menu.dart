import 'package:flutter/material.dart';
import 'package:flutterapp/stores/signup_store.dart';
import 'package:flutterapp/utills/config.dart';

class MyCustomMenu extends StatefulWidget {
  final SignUpStore store;
  const MyCustomMenu({
    Key key,
    this.store,
  }) : super(key: key);

  @override
  _MyCustomMenuState createState() => _MyCustomMenuState();
}

class _MyCustomMenuState extends State<MyCustomMenu> {
  var _active = UserType.VISITOR;
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width / 1.1;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        height: 45,
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: colorMain, width: 1.0)),
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _active = UserType.VISITOR;
                  });
                  widget.store.userLoginAs = UserType.VISITOR;
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Signup as",
                          style: TextStyle(
                            fontSize: 12,
                            color: _active == UserType.VISITOR
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        Text(
                          "Visitor",
                          style: TextStyle(
                            fontSize: 12,
                            color: _active == UserType.VISITOR
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _active = UserType.REALESTATE;
                  });
                  widget.store.userLoginAs = UserType.REALESTATE;
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Real Estate",
                          style: TextStyle(
                            fontSize: 12,
                            color: _active == UserType.REALESTATE
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        Text(
                          "Agent",
                          style: TextStyle(
                            fontSize: 12,
                            color: _active == UserType.REALESTATE
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _active = UserType.BUILDERANDDEVELOPER;
                  });
                  widget.store.userLoginAs = UserType.BUILDERANDDEVELOPER;
                },
                child: Center(
                  child: Container(
                    decoration: _active == UserType.BUILDERANDDEVELOPER
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: colorMain,
                          )
                        : BoxDecoration(),
                    padding: EdgeInsets.all(3.0),
                    alignment: Alignment.center,
                    child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Builders &",
                              style: TextStyle(
                                fontSize: 12,
                                color: _active == UserType.BUILDERANDDEVELOPER
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            Text(
                              "Developer",
                              style: TextStyle(
                                fontSize: 12,
                                color: _active == UserType.BUILDERANDDEVELOPER
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
