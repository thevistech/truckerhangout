import 'package:flutter/material.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/config.dart';
import '../../models/filter_property_model.dart';

class HomeTypeFilter extends StatefulWidget {
  final DashBoardMainStore dashboardStore;
  HomeTypeFilter({@required this.dashboardStore});
  @override
  _HomeTypeFilterState createState() => _HomeTypeFilterState();
}

class _HomeTypeFilterState extends State<HomeTypeFilter> {
  int _selectedIndex;
  int countGridView;
  bool homeTypeHasChild = false;
  List<Childe> homeTypeChild;
  List<bool> homeTypeFilterChild;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = 0;
    homeTypeChild = widget?.dashboardStore?.filterPropertyModel?.data
        ?.categories[_selectedIndex]?.childes;
    if (homeTypeChild.length > 0) {
      homeTypeHasChild = true;
      homeTypeFilterChild = List.generate(homeTypeChild.length, (_) => true);
    } else
      homeTypeHasChild = false;
  }

  @override
  Widget build(BuildContext context) {
    return homeTypeFilter();
  }

//*************** Home Type Filter ***************//

  homeTypeFilter() {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          peopertyTypeList(),
          SizedBox(
            height: 10,
          ),
          homeTypeFilterGridView(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
    );
  }

//*************** More Filter / Home Type Filter Property List ***************//

  peopertyTypeList() {
    return Container(
      height: 25,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount:
            widget.dashboardStore.filterPropertyModel.data.categories.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                  homeTypeChild = widget?.dashboardStore?.filterPropertyModel
                      ?.data?.categories[_selectedIndex]?.childes;
                  if (homeTypeChild.length > 0) {
                    homeTypeHasChild = true;
                    homeTypeFilterChild =
                        List.generate(homeTypeChild.length, (_) => true);
                  } else
                    homeTypeHasChild = false;
                });
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      widget.dashboardStore.filterPropertyModel.data
                          .categories[index].parent.title,
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            _selectedIndex == index ? colorMain : colorGrey,
                      ),
                    ),
                  ),
                  index !=
                          widget.dashboardStore.filterPropertyModel.data
                                  .categories.length -
                              1
                      ? Text("|")
                      : Text("")
                ],
              ));
        },
      ),
    );
  }

  //*************** Home Type Filter Grid View ***************//

  homeTypeFilterGridView() {
    return homeTypeHasChild
        ? Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: homeTypeChild.length.isEven
                  ? homeTypeChild.length / 2 * 23.0
                  : homeTypeChild.length / 2 * 27.0,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 8.0,
                children: List.generate(homeTypeChild.length, (index) {
                  return Container(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (homeTypeFilterChild[index])
                            homeTypeFilterChild[index] = false;
                          else
                            homeTypeFilterChild[index] = true;
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                                height: 27,
                                child: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: colorMain,
                                  ),
                                  child: Checkbox(
                                      activeColor: colorMain,
                                      value: homeTypeFilterChild[index],
                                      onChanged: (val) {
                                        setState(() {
                                          homeTypeFilterChild[index] = val;
                                        });
                                      }),
                                )),
                          ),
                          Expanded(
                              flex: 2,
                              child: Text(
                                homeTypeChild[index].child.title,
                                style: TextStyle(fontSize: 12),
                              )),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
        : Container(
            height: 0,
            width: 0,
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
