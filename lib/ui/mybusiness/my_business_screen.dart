import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ui/components/start_rating_widget.dart';
import 'package:flutterapp/utills/TabBar.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/custom_tab_bar.dart';

class MyBusinessScreen extends StatefulWidget {
  var currentUserImage;
  MyBusinessScreen({this.currentUserImage});
  @override
  _MyBusinessScreenState createState() => _MyBusinessScreenState();
}

class _MyBusinessScreenState extends State<MyBusinessScreen>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController;

  bool showFab = true;
  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(0.0), // here the desired height
                child: AppBar(
                  elevation: 0.0,
                  backgroundColor: colorMain,
                )),
            body: NestedScrollView(
                controller: scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      actions: actionWidgets(context),
                      pinned: true,
                      forceElevated: innerBoxIsScrolled,
                      floating: true,
                      centerTitle: false,
                      backgroundColor: colorMain,
                      title: Text('My Business'),
                      leading: InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop("Discard");
                          },
                          child: Icon(Icons.arrow_back)),
                      titleSpacing: 0.0,

                    )
                  ];
                },
                body: Stack(
                  children: <Widget>[
                    backgroundImage(),
                    busiessList()

                  ],
                )
            )));
  }

  busiessList() {
    return Positioned.fill(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(
              child: NotificationListener<ScrollNotification>(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 12,
                      itemBuilder: (ctx, index) {
//                        var developer = developerNewList[index];
//                        var profileUrl =
//                            "${widget.dashBoardMainStore.developerModel.url}${developer.logo}";
//                        var userjjjjjjjjjjjjjjjjjjjjjjjjjName = developer.name;
//                        var companyName = developer.compTypeTitle;
//                        var companyAbout = developer.about;
//                        var companyNoOfEmployee = developer.noOfEmployee;
//                        var companyRating = int.tryParse("${developer.rating}");
                        return Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          width: 60,
                                          height: 60,
                                          imageUrl: 'https://miro.medium.com/max/1024/1*Jl7k5Z8SZ0UYwClHB1JfDg.jpeg',
                                          placeholder: (context, url) =>
                                              Container(
                                                height: 60,
                                                width: 60,
                                                color: colorIconDefault,
                                              ),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                                height: 60,
                                                width: 60,
                                                color: colorIconDefault,
                                              ),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(left: 10.0)),
                                    Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    "NexaBuilt",
                                                    maxLines: 2,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 13.0),
                                                  ),
                                                ),
                                                Container(
                                                  child: IconTheme(
                                                    data: IconThemeData(
                                                      color: Colors.amber,
                                                      size: 15,
                                                    ),
                                                    child: StarDisplay(
                                                       value: 3
//                                                        companyRating ==
//                                                            null
//                                                            ? 0
//                                                            : companyRating),
                                                  ),
                                                )),
                                              ],
                                            ),
                                            Text(
                                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: lighrgrey,
                                                  fontSize: 13.0),
                                            ),

                                          ],
                                        ))
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Divider(
                                  color: colorDivider,
                                  height: 2,
                                )
                              ],
                            ));
                      }),
                ),
//                onNotification: (ScrollNotification scrollInfo) {
//                  if (scrollInfo.metrics.pixels ==
//                      scrollInfo.metrics.maxScrollExtent) {
//                    if (widget.dashBoardMainStore.pageNumber !=
//                        widget
//                            .dashBoardMainStore.developerModel.data.lastPage) {
//                      widget.dashBoardMainStore.pageNumber =
//                          widget.dashBoardMainStore.pageNumber + 1;
//                      loadMore(widget.dashBoardMainStore.pageNumber);
//                    }
//                  }
//                  return false;
//                },
              ),
            ),
//            widget.dashBoardMainStore.isDeveloperListLoadingMore
//                ? Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Container(
//                  height: 35,
//                  width: 35,
//                  child: ColorLoader2(),
//                ),
//                SizedBox(
//                  height: 40,
//                )
//              ],
//            )
//                : Container(
//              height: 0,
//            )
          ],
        ),
      ),
    );
  }
}
