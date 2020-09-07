import 'package:flutter/material.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:search_widget/search_widget.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Container(
            //  color: Colors.grey,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              //   padding: EdgeInsets.all(5),
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10.0)),
                    ),
                    height: 40,
                    // color: Colors.grey[300],
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Container(
                          // margin: EdgeInsets.fromLTRB(8, 5, 0, 5),
                          decoration: BoxDecoration(
                            color: colorMain,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              size: suffixIconSize,
                            ),
                            onPressed: () {
                              //  print('search icon clicked');
                            },
                            color: Colors.white,
                          ),
                        ),
//                        focusedBorder: OutlineInputBorder(
//                            borderRadius: BorderRadius.all(const Radius.circular(10.0)),
//                         //   borderSide: BorderSide(color: colorMain, width: 2.0)
//                        ),
//                        enabledBorder: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         // borderSide: BorderSide(color: colorMain, width: 2.0),
//                        ),
                        hintText: "Search Property",
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(6),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Chat();
                        }));
                      },
                      child: Image.asset('assets/appbarchat.png')),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: CircleAvatar(
                      radius: 30,
                      // radius: 45.0,
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      // child: Image.asset('assets/appbarprofile.png',),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
//              IconButton(
//                icon: Icon(Icons.verified_user),
//                onPressed: () => null,
//              ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

//class SearchingBar extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<SearchingBar> {
//  List<LeaderBoard> list = <LeaderBoard>[
//    LeaderBoard("Flutter", 54),
//    LeaderBoard("React", 22.5),
//    LeaderBoard("Ionic", 24.7),
//    LeaderBoard("Xamarin", 22.1),
//  ];
//
//  LeaderBoard _selectedItem;
//
//  bool _show = true;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        actions: <Widget>[
//          SearchWidget<LeaderBoard>(
//            dataList: list,
//            hideSearchBoxWhenItemSelected: false,
//            listContainerHeight: MediaQuery.of(context).size.height / 4,
//            queryBuilder: (query, list) {
//              return list
//                  .where((item) => item.username
//                  .toLowerCase()
//                  .contains(query.toLowerCase()))
//                  .toList();
//            },
//            popupListItemBuilder: (item) {
//              return PopupListItemWidget(item);
//            },
//            selectedItemBuilder: (selectedItem, deleteSelectedItem) {
//              return SelectedItemWidget(selectedItem, deleteSelectedItem);
//            },
//            // widget customization
//            noItemsFoundWidget: NoItemsFound(),
//            textFieldBuilder: (controller, focusNode) {
//              return MyTextField(controller, focusNode);
//            },
//            onItemSelected: (item) {
//              setState(() {
//                _selectedItem = item;
//              });
//            },
//          ),
//        ],
//      //  actions: <Widget>[SearchWidget<>()],
//        title: const Text("Search Widget"),
//      ),
//      body: SingleChildScrollView(
//        padding: const EdgeInsets.symmetric(vertical: 16),
//        child: Column(
//          children: <Widget>[
////            const SizedBox(
////              height: 16,
////            ),
////            if (_show)
//
//            const SizedBox(
//              height: 32,
//            ),
//            Text(
//              "${_selectedItem != null ? _selectedItem.username : ""
//                  "No item selected"}",
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          setState(() {
//            _show = !_show;
//          });
//        },
//        child: Icon(Icons.swap_horizontal_circle),
//      ),
//    );
//  }
//}
//
//class LeaderBoard {
//  LeaderBoard(this.username, this.score);
//
//  final String username;
//  final double score;
//}
//
//class SelectedItemWidget extends StatelessWidget {
//  const SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);
//
//  final LeaderBoard selectedItem;
//  final VoidCallback deleteSelectedItem;
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: const EdgeInsets.symmetric(
//        vertical: 2,
//        horizontal: 4,
//      ),
//      child: Row(
//        children: <Widget>[
//          Expanded(
//            child: Padding(
//              padding: const EdgeInsets.only(
//                left: 16,
//                right: 16,
//                top: 8,
//                bottom: 8,
//              ),
//              child: Text(
//                selectedItem.username,
//                style: const TextStyle(fontSize: 14),
//              ),
//            ),
//          ),
//          IconButton(
//            icon: Icon(Icons.delete_outline, size: 22),
//            color: Colors.grey[700],
//            onPressed: deleteSelectedItem,
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class MyTextField extends StatelessWidget {
//  const MyTextField(this.controller, this.focusNode);
//
//  final TextEditingController controller;
//  final FocusNode focusNode;
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//      child: TextField(
//        controller: controller,
//        focusNode: focusNode,
//        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//        decoration: InputDecoration(
//          enabledBorder: const OutlineInputBorder(
//            borderSide: BorderSide(
//              color: Colors.pink,
//            ),
//          ),
//          focusedBorder: OutlineInputBorder(
//            borderSide: BorderSide(color: Theme.of(context).primaryColor),
//          ),
//          suffixIcon: Container(
//           // margin: EdgeInsets.fromLTRB(8, 5, 0, 5),
//            decoration:
//            BoxDecoration(color: colorMain, shape: BoxShape.rectangle),
//            child: Icon(
//              Icons.search,
//              size: suffixIconSize,
//              color: Colors.white,
//            ),
//          ),
//         // border: BoxDecoration,
//          hintText: "Search here...",
//          contentPadding: const EdgeInsets.only(
//            left: 16,
//            right: 20,
//            top: 14,
//            bottom: 14,
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class NoItemsFound extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Icon(
//          Icons.folder_open,
//          size: 24,
//          color: Colors.grey[900].withOpacity(0.7),
//        ),
//        const SizedBox(width: 10),
//        Text(
//          "No Items Found",
//          style: TextStyle(
//            fontSize: 16,
//            color: Colors.grey[900].withOpacity(0.7),
//          ),
//        ),
//      ],
//    );
//  }
//}
//
//class PopupListItemWidget extends StatelessWidget {
//  const PopupListItemWidget(this.item);
//
//  final LeaderBoard item;
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: const EdgeInsets.all(12),
//      child: Text(
//        item.username,
//        style: const TextStyle(fontSize: 16),
//      ),
//    );
//  }
//}
