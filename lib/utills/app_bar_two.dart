import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:search_widget/search_widget.dart';

class SearchingBarTwo extends StatelessWidget { //This is appbar Two
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBarTwo(height: 100),
    );
  }
}

class MyCustomAppBarTwo extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBarTwo({
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
                    icon: Icon(Icons.arrow_back),
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
                        hintText: "Search Real Estate",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
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
                  child: Text('Invite', textAlign: TextAlign.center,),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 20,
                    // radius: 45.0,
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    // child: Image.asset('assets/appbarprofile.png',),
                    backgroundColor: Colors.transparent,
                  ),
                ),
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