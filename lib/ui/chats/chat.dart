
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/shimmer/messagesListView.dart';
import 'package:flutterapp/stores/chats_store.dart';
import 'package:flutterapp/ui/chats/tabs/call_screen.dart';
import 'package:flutterapp/ui/chats/tabs/chat_screen.dart';
import 'package:flutterapp/ui/chats/tabs/status_screen.dart';
import 'package:flutterapp/ui/profiles/user_profile.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/constants.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> with SingleTickerProviderStateMixin {
  var userImage;
  var userid;
  var loggedinUserId;
  double _lastFeedScrollOffset = 0;
  ScrollController scrollController;
  TabController _tabController;
  bool showFab = true;
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";
  onlinePersonsChatsStore store = onlinePersonsChatsStore();

  // List<CameraDescription> cameras = [];

  @override
  void initState() {

    if (!store.isGernalApiLoded) getGernalApiData();
    Config.getUserProfilePicture().then((value) {
      setState(() {
        userImage = value;
      });
    });
    Config.getUserID().then((value) {
      setState(() {
        loggedinUserId = value;
        userid = value;
      });
    });
    print('login userid $loggedinUserId');
    scrollController =
        ScrollController();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 3);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar:AppBar(
                elevation: 0.0,
                backgroundColor: colorMain,
                titleSpacing: 0.0,
                title: _isSearching ? _buildSearchField() : Text('Chats'),
                leading: _isSearching ? BackButton() : BackButton(),


                  actions: <Widget>[

                    _isSearching?_buildActions():buildActionIcons()
                  ],
                bottom: TabBar(
                    indicatorWeight: 5.0,
                    indicatorColor: Colors.white,
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: 'CHATS',
                      ),
                      Tab(
                        text: 'STATUS',
                      ),
                      Tab(
                        text: 'CALLS',
                      ),

                    ]
                ),
              ),

    body:Observer(
      builder: (_)=>store.isGernalApiLoded?TabBarView(
            controller: _tabController,
            children: <Widget>[
              //TabCamera(),
              ChatScreen(store:store),
              StatusScreen(store:store),
              CallsScreen(store:store),
            ],
          ):shimmerMessagesListView(context),
    ),
    );
  }
  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search users...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery(query),
    );
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
  _buildActions() {
    if (_isSearching) {

      return IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        );

    }
  }

  buildActionIcons() {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: _startSearch,
            child: Icon(Icons.search)),
        Container(

          child: PopupMenuButton(itemBuilder:(BuildContext context){
            return Constant.choices.map((String choice) {
              return PopupMenuItem(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          } ),
        ),
      ],

    );
  }

  void getGernalApiData() {
    store.getChatGeneralData(context,store.pageNumber).then((value) {
      store.isGernalApiLoded = true;
      store.chatGeneralModel = value;

      print('api loaded :: ${store.isGernalApiLoded}');

      print('friends length :: ${store.chatGeneralModel.friends.data.length}');
      
    });
  }
}