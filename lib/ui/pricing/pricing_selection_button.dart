import 'package:flutter/material.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/stores/pricing_plane_store.dart';
import 'package:flutterapp/utills/config.dart';

class PricingSelector extends StatefulWidget {
  final PricingStore store;
  const PricingSelector({
    Key key,
    this.store,
  }) : super(key: key);

  @override
  _PricingSelectorState createState() =>
      _PricingSelectorState();
}

class _PricingSelectorState extends State<PricingSelector> {
  var _active = packageType.Free;

  List<String> packageSelection = ["Free","Premium","Custom"];
  int _selected;
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
          itemCount: packageSelection.length,
          itemBuilder: (context, index) {
            var title = packageSelection[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selected = index;
                 // widget.store.moreFilterPropertyPurposeType = title;
                });

                if (title == "Free")
                  widget.store.showpackageAccordingtoSelection = packageType.Free;
                if (title == "Premium")
                  widget.store.showpackageAccordingtoSelection =
                      packageType.Premium;
                if (title == "Custom")
                  widget.store.showpackageAccordingtoSelection =
                      packageType.Custom;
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  width: (MediaQuery.of(context).size.width / (4-1)) - 13,
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
                        title,
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
