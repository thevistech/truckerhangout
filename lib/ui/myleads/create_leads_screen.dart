import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/stores/create_property_store.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/addListing/language_dialog.dart';
import 'package:flutterapp/ui/addListing/more_filter_create.dart';
import 'package:flutterapp/ui/addListing/more_filter_property_purpose_button.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'dart:async';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:math';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:path_provider/path_provider.dart';

class CreateLeadsScreen extends StatefulWidget {
  final LocalFileSystem localFileSystem;
  final DashBoardMainStore dashboardStore;
  var userImage;
  CreateLeadsScreen(
      {@required this.dashboardStore, this.userImage, localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();
  @override
  _CreateLeadsScreenState createState() => _CreateLeadsScreenState();
}

class _CreateLeadsScreenState extends State<CreateLeadsScreen> {
  bool _visible = false;
  final createPropertyStore = CreatePropertyStore();

  String _currentLocaleId = "";
  List<LocaleName> _localeNames = [];

  Random random = new Random();
  TextEditingController _controller = new TextEditingController();

  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  var imgUrl;

  @override
  void initState() {
    super.initState();

    Config.getUserProfilePicture().then((value) {
      setState(() {
        imgUrl = value;
      });
    });
  }



  _switchLang(selectedVal) {
    setState(() {
      _currentLocaleId = selectedVal;
    });
    print(selectedVal);
  }


  selectLanguagePicker(context, store) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return LanguageList(
          createPropertyStore: store,
          localeNames: _localeNames,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 3.5;

    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          title: Text(
            'Create Leads',
            style: TextStyle(color: Colors.white),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back)),
          actions: actionWidgets(context),
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
                      'Create Leads by Filling Information',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Just tap button away to create leads',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyCustomMenuPropertyPurpose(
                      store: widget.dashboardStore,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    showLanguageTextFeild(),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                MoreFilterCreate(
                  dashboardStore: widget.dashboardStore,
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  maintainSize: false,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: _visible,
                  child: Container(
                    child: MoreFilterCreate(
                      dashboardStore: widget.dashboardStore,
                    ),
                  ),
                ),
                //_visible == true ? pickImageButton() : Container(),
                // _visible == true ? buildGridView() : Container(),
                SizedBox(
                  height: 20,
                ),
                _visible == true
                    ? GestureDetector(
                    onTap: () {
                      _toggle();
                    },
                    child: Text('Less options'))
                    : Container(),
                SizedBox(
                  height: _visible == true ? 20 : 0,
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
                        color: smokeybgColor,
                      ),
                      borderRadius: BorderRadius.circular(2.0)),
                  margin: EdgeInsets.all(5.0),
                  child: asset != null
                      ? AssetThumb(
                    asset: asset,
                    width: 300,
                    height: 300,
                  )
                      : Icon(
                    Icons.add,
                    color: colorMain,
                  ),
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

  showLanguageTextFeild() {
    return Container(
      height: height40,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: () {
          selectLanguagePicker(context, createPropertyStore);
        },
        child: Observer(
          builder: (_) => TextField(
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              enabled: false,
              fillColor: Colors.white,
              filled: true,
              hintText: createPropertyStore.localeNames == null
                  ? "Select Language"
                  : createPropertyStore.localeNames,
              prefixIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                decoration:
                BoxDecoration(color: colorMain, shape: BoxShape.circle),
                child: Icon(
                  Icons.archive,
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

  TextFileds(language) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Container(
              height: height40,
              child: TextFormField(
                style: TextStyle(fontSize: 12),
                enabled: false,
                //controlleur: passController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: language,
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Container(
                    margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                    decoration:
                    BoxDecoration(color: colorMain, shape: BoxShape.circle),
                    child: Icon(
                      Icons.lock,
                      size: prefixIconSize,
                      color: colorMain,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0.0),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(const Radius.circular(32.0)),
                      borderSide: BorderSide(color: colorMain, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(color: colorMain, width: 2.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide: BorderSide(color: colorMain, width: 2.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
