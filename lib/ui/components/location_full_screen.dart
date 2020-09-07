import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/utills/config.dart';
import '../../shimmer/locationGridView.dart';

class LocationFullScreenWidget extends StatefulWidget {
  final DashBoardMainStore dashboardStore;
  var currentUserImage;
  LocationFullScreenWidget({this.dashboardStore, this.currentUserImage});
  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationFullScreenWidget> {
  int _current = 0;
  var store;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          backgroundColor: colorMain,
          centerTitle: false,
          title: Text('Areas'),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Chat();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  "assets/message.svg",
                  allowDrawingOutsideViewBox: true,
                  height: 35,
                  color: Colors.white,
                ),
              ),
            ),
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.transparent,
              // radius: 45.0,
              child: ClipOval(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 34,
                  width: 34,
                  imageUrl: "${widget.currentUserImage}",
                ),
              ),
            ),
          ],
          leading: InkWell(
              onTap: () {
                Future.delayed(Duration.zero, () {
                  Navigator.pop(context);
                });
              },
              child: Icon(Icons.arrow_back)),
          elevation: 0.0,
          // ignore: missing_required_param
          bottom: PreferredSize(
            child: Container(
              height: 1,
              color: Colors.white,
            ),
          ),
        ),
        body: dashboardSliderWidget(),
      );
    });
  }

  dashboardSliderWidget() {
    return Container(
      color: Colors.grey[100],
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          ),
          SizedBox(
            height: 5,
          ),
          widget.dashboardStore.filterPropertyModel != null
              ? Container(
                  margin: EdgeInsets.only(top: 0, bottom: 10),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: new NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    children: List.generate(
                        widget.dashboardStore.filterPropertyModel.data.areas
                            .length, (index) {
                      return makeLocationGrid(index);
                    }),
                  ),
                )
              : shimmerLocation(),
        ],
      ),
    );
  }

  makeLocationGrid(index) {
    var baseurl = widget.dashboardStore.filterPropertyModel.url;

    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(right: 2, left: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            image: DecorationImage(
                image: NetworkImage(baseurl +
                    '${widget.dashboardStore.filterPropertyModel.data.areas[index].image}'),
                fit: BoxFit.cover),
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter,
                    colors: [
                      Colors.black.withOpacity(.5),
                      Colors.black.withOpacity(.2),
                    ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                    "${widget.dashboardStore.filterPropertyModel.data.areas[index].name}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Signika-Regular',
                    ))
              ],
            ),
          ),
        ),

//        Container(
//          child: Stack(
//            children: <Widget>[
//              Opacity(
//                opacity: 0.9,
//                child: ClipRRect(
//                  borderRadius: BorderRadius.circular(10.0),
//                  child: Image.network(
//                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTDYBWl8gDmaKMgW76MdlPX0JYl6fmIRCausw&usqp=CAU",
//                    fit: BoxFit.fill,
//                    height: 1000,
//                    width: 1000,
//                  ),
//                ),
//              ),
//              Center(
//                  child: Container(
//                margin: EdgeInsets.symmetric(horizontal: 2.0),
//                child: Text(
//                  isCityIDNull
//                      ? "${widget.dashboardStore.filterPropertyModel.data.areas[index].name}"
//                      : "${areasList[index].name}",
//                  textAlign: TextAlign.center,
//                  maxLines: 2,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontWeight: FontWeight.bold,
//                      letterSpacing: 1.0),
//                ),
//              )),
//            ],
//          ),
//        ),
      ),
    );
  }
}
