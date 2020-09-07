import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/models/developers_model.dart';
import 'package:flutterapp/shimmer/simpleListView.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/components/start_rating_widget.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/loaders/color_loader_for_more.dart';

List<Datum> developerNewList = new List();

class SelectDeveloper extends StatefulWidget {
  DashBoardMainStore dashBoardMainStore;
  SelectDeveloper({this.dashBoardMainStore});
  @override
  _SelectDeveloperState createState() => _SelectDeveloperState();
}

class _SelectDeveloperState extends State<SelectDeveloper> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

  @override
  void initState() {
    if (!widget.dashBoardMainStore.isDeveloperListLoaded) {
      widget.dashBoardMainStore.pageNumber = 1;
      widget.dashBoardMainStore
          .getAllDeveloperData(
              context, widget.dashBoardMainStore.pageNumber, "")
          .then((value) {
        widget.dashBoardMainStore.isDeveloperListLoaded = true;
        developerNewList = value.data.data;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        leading: BackButton(),
        title: _isSearching ? _buildSearchField() : Text("Select Developer"),
        actions: _buildActions(),
      ),
      body: Stack(
        children: <Widget>[
          backgroundImage(),
          Observer(
              builder: (_) => widget.dashBoardMainStore.isDeveloperListLoaded
                  ? developersList()
                  : shimmerSimpleListView(context)),
        ],
      ),
    );
  }

  backgroundImage() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          "assets/building.png",
        ),
      ),
    );
  }

  developersList() {
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
                      itemCount: developerNewList.length,
                      itemBuilder: (ctx, index) {
                        var developer = developerNewList[index];
                        var profileUrl =
                            "${widget.dashBoardMainStore.developerModel.url}${developer.logo}";
                        var userjjjjjjjjjjjjjjjjjjjjjjjjjName = developer.name;
                        var companyName = developer.compTypeTitle;
                        var companyAbout = developer.about;
                        var companyNoOfEmployee = developer.noOfEmployee;
                        var companyRating = int.tryParse("${developer.rating}");
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
                                          fit: BoxFit.fill,
                                          width: 60,
                                          height: 60,
                                          imageUrl: profileUrl,
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
                                                    "$companyName",
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
                                                        value: companyRating ==
                                                                null
                                                            ? 0
                                                            : companyRating),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '$companyAbout',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: lighrgrey,
                                                  fontSize: 13.0),
                                            ),
                                            Text(
                                              'No. Of Employees  : $companyNoOfEmployee',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
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
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    if (widget.dashBoardMainStore.pageNumber !=
                        widget
                            .dashBoardMainStore.developerModel.data.lastPage) {
                      widget.dashBoardMainStore.pageNumber =
                          widget.dashBoardMainStore.pageNumber + 1;
                      loadMore(widget.dashBoardMainStore.pageNumber);
                    }
                  }
                  return false;
                },
              ),
            ),
            widget.dashBoardMainStore.isDeveloperListLoadingMore
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 35,
                        width: 35,
                        child: ColorLoader2(),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  )
                : Container(
                    height: 0,
                  )
          ],
        ),
      ),
    );
  }

  loadMore(pageNumber) {
    widget.dashBoardMainStore.isDeveloperListLoadingMore = true;
    widget.dashBoardMainStore
        .getAllDeveloperData(context, pageNumber, "")
        .then((value) {
      for (int i = 0; i < value.data.data.length; i++) {
        developerNewList.add(value.data.data[i]);
      }
      widget.dashBoardMainStore.isDeveloperListLoadingMore = false;
      setState(() {});
    });
  }

  _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search Develoeprs",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            // if (_searchQueryController == null ||
            //     _searchQueryController.text.isEmpty) {
            //   Navigator.pop(context);
            //   return;
            // }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }
}
