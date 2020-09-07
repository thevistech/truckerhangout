import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/stores/create_property_store.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/chats/chat.dart';
import 'package:flutterapp/ui/addListing/select_developers.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'more_filter_create.dart';
import 'dart:async';

class CreateProjects extends StatefulWidget {
  final DashBoardMainStore dashboardStore;
  var userImage;
  CreateProjects({@required this.dashboardStore, this.userImage});
  @override
  _CreateProjectsState createState() => _CreateProjectsState();
}

class _CreateProjectsState extends State<CreateProjects> {
  bool _visible = false;
  final createPropertyStore = CreatePropertyStore();

//Speech to Text
  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";

  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 5;

    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          title: Text(
            'List Project',
            style: TextStyle(color: Colors.white),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back)),
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
                  imageUrl: "${widget.userImage}",
                ),
              ),
            ),
          ],
          backgroundColor: colorMain,
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: null,
            child: Container(
              height: 2,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: height,
                  color: colorMain,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'List Project by Options',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Fill the form below to submit projects',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    showDeveloperDialog()
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                MoreFilterCreate(
                  dashboardStore: widget.dashboardStore,
                ),
                // images.length == 0 ? pickImageButton() : Container(),
                // images.length == 0
                //     ? SizedBox(
                //         height: 10,
                //       )
                //     : Container(),
                buildGridView(),
                Text("You can select upto six images"),
                SizedBox(
                  height: 20,
                ),
                submitButton(),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ));
  }

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 6,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          startInAllView: true,
          statusBarColor: "#2A326D",
          actionBarColor: "#2A326D",
          actionBarTitle: "Select Pictures",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  showDeveloperDialog() {
    return Container(
      height: height40,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SelectDeveloper(
              dashBoardMainStore: widget.dashboardStore,
            );
          }));
        },
        child: Observer(
          builder: (_) => TextField(
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              enabled: false,
              fillColor: Colors.white,
              filled: true,
              hintText: createPropertyStore.localeNames == null
                  ? "Select Developers"
                  : createPropertyStore.localeNames,
              prefixIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                decoration:
                    BoxDecoration(color: colorMain, shape: BoxShape.circle),
                child: Icon(
                  Icons.developer_mode,
                  size: prefixIconSize,
                  color: Colors.white,
                ),
              ),
              suffixIcon: Container(
                child: Icon(
                  Icons.arrow_drop_down,
                  size: prefixIconSize,
                  color: colorMain,
                ),
              ),
              hintStyle: TextStyle(
                color: colorMain,
              ),
              contentPadding: EdgeInsets.all(10.0),
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0)),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(32.0),
                ),
                borderSide: BorderSide(color: colorMain, width: 1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildGridView() {
    return Container(
      child: InkWell(
        onTap: () {
          loadAssets();
        },
        child: Container(
          height: 250 /*  (images.length <= 3 ? 135 : 270) */,
          padding: EdgeInsets.all(15.0),
          child: DottedBorder(
            color: colorMain,
            strokeWidth: 1,
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(6, (index) {
                Asset asset;
                try {
                  if (images[index] != null) asset = images[index];
                } catch (e) {
                  print("Exception: " + e.toString());
                }
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: colorMain,
                      ),
                      borderRadius: BorderRadius.circular(2.0)),
                  margin: EdgeInsets.all(5.0),
                  child: asset != null
                      ? AssetThumb(
                          asset: asset,
                          width: 300,
                          height: 300,
                        )
                      : Icon(Icons.add),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  submitButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: height40,
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        onPressed: () {},
        color: colorMain,
        disabledColor: colorMain,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Submit',
            style: TextStyle(
                fontSize: buttonFontSize, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }
}
