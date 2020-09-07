import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/stores/create_property_store.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:flutterapp/ui/addListing/more_filter_property_purpose_button.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'more_filter_create.dart';
import 'dart:async';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'language_dialog.dart';
import 'dart:math';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:path_provider/path_provider.dart';

class VoiceProperty extends StatefulWidget {
  final LocalFileSystem localFileSystem;
  final DashBoardMainStore dashboardStore;
  var userImage;
  VoiceProperty(
      {@required this.dashboardStore, this.userImage, localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();
  @override
  _VoicePropertyState createState() => _VoicePropertyState();
}

class _VoicePropertyState extends State<VoiceProperty> {
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
  String _currentLocaleId = "";
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();

  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  TextEditingController _controller = new TextEditingController();

  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  @override
  void initState() {
    super.initState();
    initSpeechState();
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (hasSpeech) {
      _localeNames = await speech.locales();

      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
    }

    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    // print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    // print(
    // "Received listener status: $status, listening: ${speech.isListening}");
    setState(() {
      lastStatus = "$status";
    });
  }

  _switchLang(selectedVal) {
    setState(() {
      _currentLocaleId = selectedVal;
    });
    print(selectedVal);
  }

  void startListening() {
    // _start();
    lastWords = "";
    lastError = "";
    speech.listen(
      onResult: resultListener,
      // listenFor: Duration(seconds: 60),
      // pauseFor: Duration(seconds: 3),
      localeId: _currentLocaleId,
      // onSoundLevelChange: soundLevelListener,
      cancelOnError: true,
      partialResults: true,
      // onDevice: true,
      // listenMode: ListenMode.confirmation,
      // sampleRate: 44100,
    );
    setState(() {});
  }

  void stopListening() {
    //_stop();
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      // lastWords = "${result.recognizedWords} - ${result.finalResult}";
      lastWords = "${result.recognizedWords}";
      if (result.finalResult) showToast("$lastWords", false);
    });
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
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
            'List Property',
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
                      'List Property by Voice Recording',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Just tap button to voice recording',
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
                GestureDetector(
                  onLongPressStart: (longPressDetail) {
                    !_hasSpeech || speech.isListening ? null : startListening();
                  },
                  onLongPressEnd: (longPressDetail) {
                    speech.isListening ? stopListening() : null;
                  },
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: colorMain)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Material(
                          shape:
                              CircleBorder(side: BorderSide(color: colorMain)),
                          color: Colors.white,
                          child: Lottie.asset(!speech.isListening
                              ? 'assets/mic.json'
                              : 'assets/listen.json') /* Ink.image(
                          image: AssetImage('assets/mike.png'),
                          width: 50.0,
                          height: 50.0,
                          child: InkWell(
                            onTap: () {},
                          ),
                        ), */
                          ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _visible == false
                    ? GestureDetector(
                        onTap: () {
                          _toggle();
                        },
                        child: Text('More options'))
                    : Container(),
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

  _start() async {
    try {
      if (await AudioRecorder.hasPermissions) {
        if (_controller.text != null && _controller.text != "") {
          String path = _controller.text;
          if (!_controller.text.contains('/')) {
            Directory appDocDirectory =
                await getApplicationDocumentsDirectory();
            path = appDocDirectory.path + '/' + _controller.text;
          }
          print("Start recording: $path");
          await AudioRecorder.start(
              path: path, audioOutputFormat: AudioOutputFormat.AAC);
        } else {
          await AudioRecorder.start();
        }
        bool isRecording = await AudioRecorder.isRecording;
        setState(() {
          _recording = new Recording(duration: new Duration(), path: "");
          _isRecording = isRecording;
        });
      } else {
        showToast("You must accept permissions", true);
        // Scaffold.of(context).showSnackBar(
        //     new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  _stop() async {
    var recording = await AudioRecorder.stop();
    print("Stop recording: ${recording.path}");
    bool isRecording = await AudioRecorder.isRecording;
    File file = widget.localFileSystem.file(recording.path);
    print("  File length: ${await file.length()}");
    setState(() {
      _recording = recording;
      _isRecording = isRecording;
    });
    _controller.text = recording.path;
  }
}
