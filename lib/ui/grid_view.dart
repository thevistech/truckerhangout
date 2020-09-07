import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  @override
  _GridViewState createState() => _GridViewState();
}

class _GridViewState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.transparent,
              // radius: 45.0,
              child: ClipOval(
                child: Image.network('https://unsplash.com/photos/gREquCUXQLI',
                fit: BoxFit.cover,
                height: 40,
                width: 40,
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          title: Text(
            'Bahria Town Karachi Maps',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.normal),
          ),
        ),
        body: Container(
            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(14),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                childAspectRatio: 8.0 / 9.0,
                children: List.generate(10, (index) {
                  return Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        child: Image.network(
                          'https://images.pexels.com/photos/1457842/pexels-photo-1457842.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          fit: BoxFit.fill,
                        )),
                  );
                }))));
  }
}
