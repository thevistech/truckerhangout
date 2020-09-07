import 'package:flutter/material.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:intl/intl.dart';

class PriceFilter extends StatefulWidget {
  final DashBoardMainStore dashboardStore;
  PriceFilter({@required this.dashboardStore});
  @override
  _PriceFilterState createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  var rangeValues;
  var start;
  var end;
  double min, max;

  @override
  void initState() {
    min = widget.dashboardStore.filterPropertyModel.data.minPrice.toDouble();
    max = widget.dashboardStore.filterPropertyModel.data.maxPrice.toDouble();
    rangeValues = RangeValues(min, max);

    start = num.parse(min.toStringAsFixed(0));
    start = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(start);
    end = num.parse(max.toStringAsFixed(0));
    end = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(end);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return priceFilter();
  }

  //*************** Price Filter ***************//

  priceFilter() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: colorMain,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 5, left: 20.0, right: 20.0, bottom: 10),
            child: Column(
              children: <Widget>[
                /* Row(
                  children: <Widget>[
                    Text(
                      'Price Range',
                      style:
                          TextStyle(color: Color(0xff837676), fontSize: 14.0),
                    ),
                    Text('(0 results)',
                        style: TextStyle(
                            color: Color(0xff837676), fontSize: 14.0)),
                  ],
                ), */
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                      height: 40,
                      width: 240,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorMain, width: 1.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Price : ',
                              style: TextStyle(
                                  color: Color(0xff837676), fontSize: 14.0)),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                              start == null || end == null
                                  ? 'Price Range'
                                  : '$start - $end',
                              style: TextStyle(
                                  color: Color(0xff837676), fontSize: 14.0))
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      valueIndicatorColor:
                          Colors.blue, // This is what you are asking for
                      inactiveTrackColor:
                          Color(0xFF8D8E98), // Custom Gray Color
                      activeTrackColor: colorMain,
                      thumbColor: lightTxtColor,
                      overlayColor: colorDivider, // Custom Thumb overlay Color
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 22.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: RangeSlider(
                        min: min,
                        max: max,
                        values: rangeValues,
                        onChanged: (RangeValues values) {
                          setState(() {
                            rangeValues = values;
                            start =
                                num.parse(rangeValues.start.toStringAsFixed(0));
                            start = NumberFormat.compactCurrency(
                              decimalDigits: 2,
                              symbol: '',
                            ).format(start);
                            end = num.parse(rangeValues.end.toStringAsFixed(0));
                            end = NumberFormat.compactCurrency(
                              decimalDigits: 2,
                              symbol: '',
                            ).format(end);
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
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
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            color: colorMain,
            height: 1,
          )
        ],
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
