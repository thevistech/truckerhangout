import 'package:flutter/material.dart';
import 'package:flutterapp/utills/config.dart';

class NewsAndInfoDetail extends StatefulWidget {
  @override
  _NewsAndInfoDetailState createState() => _NewsAndInfoDetailState();
}

class _NewsAndInfoDetailState extends State<NewsAndInfoDetail> {
  var imgUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS6wHc3OzKebPw9iQ9NMcjKRHSxIFKN2Ds2LQ&usqp=CAU";
  var posteCreatedTime = DateTime.now()
      .subtract(Duration(minutes: 59, seconds: 2, hours: 23, days: 2));
  var title = "Foreign buyers are turning their back on";

  var description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce euismod dolor libero, at mattis purus egestas ac. Duis sollicitudin lacus in molestie fringilla. Ut quis maximus eros. Phasellus eleifend, tortor eu varius imperdiet, nisl quam dapibus dolor, eu gravida ligula est a mauris. Mauris elementum malesuada maximus. Nulla molestie est sed ipsum tristique interdum. Integer sit amet arcu nulla. Aliquam sed dictum diam. Vivamus non metus ullamcorper, porta erat a, bibendum ante. Vestibulum aliquam mi sed dui consequat, nec imperdiet metus vestibulum. Ut euismod ultricies aliquet.\n\nMaecenas a aliquet est. Suspendisse viverra sapien justo. Donec molestie ultrices lorem, ac fringilla tortor. Vivamus eu cursus lacus. Nulla facilisi. Sed dui felis, ultrices eget blandit ac, aliquet sed leo. Duis nibh nibh, imperdiet id nisl nec, molestie tempor lectus.\n\nIn hac habitasse platea dictumst. Proin laoreet, lectus in malesuada egestas, libero mauris dapibus nisi, nec posuere arcu nunc in justo. Nunc tempor, mi eu consequat scelerisque, velit augue posuere nisi, vel interdum ante magna ac ligula. Vivamus a vulputate orci. Aenean consectetur, augue fringilla condimentum molestie, turpis augue hendrerit neque, ac tincidunt felis augue a metus. Mauris pretium pellentesque massa et ornare. Integer dolor metus, pretium nec sollicitudin at, faucibus et justo. Donec vel urna ut velit dapibus tincidunt. Cras accumsan eu dui tempor imperdiet. Morbi varius euismod sem a cursus.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorMain,
          title: Text('News And Blogs'),
          titleSpacing: 0.0,
          actions: actionWidgets(context),
        ),
        body: ListView(
          children: <Widget>[
            postUiDesign(
                context: context,
                isDetail: true,
                postUserfullName: "Uzair",
                postUsercompanyTitle: "The Vistech",
                carosalImage: imgUrl,
                postUserImage:
                    "https://truckerhangout.com/storage/app/public/user/images/uzair.jpg",
                jobPostingdTime: posteCreatedTime),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
              child: Text("$title",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("$description",
                  style: TextStyle(
                    color: Colors.black54,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
