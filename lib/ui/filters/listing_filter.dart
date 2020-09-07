import 'package:flutter/material.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/config.dart';
import '../../models/filter_property_model.dart';

class ListingFilter extends StatefulWidget {
  final DashBoardMainStore dashboardStore;
  ListingFilter({@required this.dashboardStore});
  @override
  _ListingFilterState createState() => _ListingFilterState();
}

class _ListingFilterState extends State<ListingFilter> {
  int _selectedIndex;
  List<bool> propertyPurposesCheckBox = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    propertyPurposesCheckBox = List.generate(
        widget.dashboardStore.filterPropertyModel.data.purposes.length,
        (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return listingFilter();
  }

  listingFilter() {
    return Container(
      child: widget.dashboardStore.filterPropertyModel != null
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    color: colorMain,
                    height: 1,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.dashboardStore.filterPropertyModel.data
                        .purposes.length,
                    itemBuilder: (BuildContext context, int index) {
                      var purpose = widget
                          .dashboardStore.filterPropertyModel.data.purposes;
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15, top: 8),
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32),
                                  border:
                                      Border.all(color: colorMain, width: 1.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      width: 10,
                                      height: 10,
                                      color: setColor(
                                          purpose[index].purpose.title),
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child:
                                            Text(purpose[index].purpose.title)),
                                    purpose[index].purposeTypes.length > 0
                                        ? InkWell(
                                            child: Container(
                                              alignment: Alignment.topCenter,
                                              child: Icon(
                                                _selectedIndex != index
                                                    ? Icons.keyboard_arrow_down
                                                    : Icons.keyboard_arrow_up,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                if (_selectedIndex == index)
                                                  _selectedIndex = null;
                                                else
                                                  _selectedIndex = index;
                                              });
                                            },
                                          )
                                        : new Container(),
                                    Expanded(
                                      child: Theme(
                                        data: ThemeData(
                                          unselectedWidgetColor: colorMain,
                                        ),
                                        child: Checkbox(
                                            checkColor: Colors
                                                .white, // color of tick Mark
                                            activeColor: colorMain,
                                            value:
                                                propertyPurposesCheckBox[index],
                                            onChanged: (bool val) {
                                              setState(() {
                                                propertyPurposesCheckBox[
                                                        index] =
                                                    !propertyPurposesCheckBox[
                                                        index];
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ExpandableContainer(
                            expanded: _selectedIndex == index ? true : false,
                            list: widget.dashboardStore.filterPropertyModel.data
                                .purposes[index].purposeTypes,
                          )
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(child: resetButton()),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: filterButton(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: colorMain,
                    height: 1,
                  )
                ],
              ),
            )
          : Container(
              height: 0,
              width: 0,
            ),
    );
  }

  //*************** Reset Button ***************//
  resetButton() {
    return Container(
      height: 25,
      // width: width,
      child: RaisedButton(
        onPressed: () {},
        padding: EdgeInsets.all(0),
        color: Colors.white,
        disabledColor: colorMain,
        textColor: Colors.grey,
        disabledTextColor: Colors.white,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Reset',
                style: TextStyle(
                    fontSize: buttonFontSize, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
            side: BorderSide(color: colorMain)),
      ),
    );
  }

//*************** Filter Button ***************//

  filterButton() {
    return Container(
      height: 25,
      // width: width,
      child: RaisedButton(
        onPressed: () {},
        padding: EdgeInsets.all(0),
        color: colorMain,
        disabledColor: colorMain,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Filter',
                style: TextStyle(
                    fontSize: buttonFontSize, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }
}
//*************** Expandable Container For List Filter ***************//

class ExpandableContainer extends StatefulWidget {
  final bool expanded;
  final List<PurposeTypeElement> list;

  ExpandableContainer({
    this.expanded = true,
    this.list,
  });

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  List<bool> propertyPurposesTypeCheckBox = [];
  @override
  void initState() {
    // TODO: implement initState
    propertyPurposesTypeCheckBox =
        List.generate(widget.list.length, (_) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 1.1;
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: widget.expanded ? widget.list.length * 36.0 : 0.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: colorExpandableFill,
              border: Border.all(color: colorExpandableFill, width: 2),
              borderRadius: BorderRadius.circular(10.0)),
          child: ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (context, i) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 10),
                    width: 10,
                    height: 10,
                    color: setColor(widget.list[i].purposeType.title),
                  ),
                  Expanded(
                      flex: 5,
                      child: Text("${widget.list[i].purposeType.title}")),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        height: 27,
                        child: Theme(
                          data: ThemeData(
                            unselectedWidgetColor: colorMain,
                          ),
                          child: Checkbox(
                              activeColor: colorMain,
                              value: propertyPurposesTypeCheckBox[i],
                              onChanged: (bool val) {
                                setState(() {
                                  propertyPurposesTypeCheckBox[i] =
                                      !propertyPurposesTypeCheckBox[i];
                                });
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
