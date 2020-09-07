import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetIosStyle extends StatefulWidget {
  @override
  _BottomSheetIosStyleState createState() => _BottomSheetIosStyleState();
}
class _BottomSheetIosStyleState extends State<BottomSheetIosStyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino Action sheet demo"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            final action = CupertinoActionSheet(
              title: Text(
                "Proto Coders Point",
                style: TextStyle(fontSize: 30),
              ),
              message: Text(
                "Select any action ",
                style: TextStyle(fontSize: 15.0),
              ),
              actions: <Widget>[
                CupertinoActionSheetAction(
                  child: Text("Action 1"),
                  isDefaultAction: true,
//                  onPressed: () {
//                    print("Action 1 is been clicked");
//                  },
                ),
                CupertinoActionSheetAction(
                  child: Text("Action 2"),
                  isDestructiveAction: true,
//                  onPressed: () {
//                    print("Action 2 is been clicked");
//                  },
                )
              ],
              cancelButton: CupertinoActionSheetAction(
                child: Text("Cancel"),
//                onPressed: () {
//                  Navigator.pop(context);
//                },
              ),
            );
            showCupertinoModalPopup(
                context: context, builder: (context) => action);
          },
          child: Text("Click me "),
        ),
      ),
    );
  }
}