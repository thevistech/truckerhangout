import 'package:flutter/material.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/config.dart';

class MyCustomMenu extends StatefulWidget {
  final DashBoardMainStore store;
  const MyCustomMenu({
    Key key,
    this.store,
  }) : super(key: key);

  @override
  _MyCustomMenuState createState() => _MyCustomMenuState();
}

class _MyCustomMenuState extends State<MyCustomMenu> {
  int _selected;
  @override
  void initState() {
    _selected = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width / 1.1;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        height: 40,
        padding: EdgeInsets.all(2.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.store.filterPropertyModel.data.categories.length,
          itemBuilder: (context, index) {
            var title = widget
                .store.filterPropertyModel.data.categories[index].parent.title;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selected = index;
                });
                widget.store.propertySubTypeSelected = 0;
                widget.store.categoryID = index;
                if (title == "Homes")
                  widget.store.moreFilterHideShowAccordingToPropertyType =
                      PropertyType.homes;
                if (title == "Plots")
                  widget.store.moreFilterHideShowAccordingToPropertyType =
                      PropertyType.Plots;
                if (title == "Commercial")
                  widget.store.moreFilterHideShowAccordingToPropertyType =
                      PropertyType.Commercial;
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  width: (MediaQuery.of(context).size.width /
                          widget.store.filterPropertyModel.data.categories
                              .length) -
                      12,
                  decoration: _selected == index
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: colorMain,
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: halfWhite),
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
