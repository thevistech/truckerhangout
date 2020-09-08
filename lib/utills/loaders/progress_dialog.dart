import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterapp/utills/UiColors.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/loaders/color_loader.dart';

bool _isDialogShowing = false;
ProgressExtended _progressExtended = ProgressExtended();

class ProgressDialogDotted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _progressExtended = ProgressExtended();

    return _progressExtended;
  }

  showProgressDialog(BuildContext context) {
    _progressExtended.createState().showProgressDialog(context);
  }

  hideProgressDialog(BuildContext context) {
    _progressExtended.createState().hideProgressDialog(context);
  }
}

class ProgressExtended extends StatefulWidget {
  ProgressExtended();
  @override
  _ProgressExtendedState createState() => _ProgressExtendedState();
}

class _ProgressExtendedState extends State<ProgressExtended> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: goBack,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Consts.radiusBorder),
              topRight: Radius.circular(Consts.radiusBorder),
              bottomLeft: Radius.circular(Consts.radiusBorder),
              bottomRight: Radius.circular(Consts.radiusBorder)),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      ),
    );
  }

  Future<bool> goBack() {
    return Future.value(false);
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: ColorLoader5(
            dotOneColor: colorMain,
            dotTwoColor: UiColors.black,
            dotThreeColor: UiColors.white,
          ),
        ),
      ],
    );
  }

  showProgressDialog(BuildContext context) async {
    _isDialogShowing = true;
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        var customDialog = ProgressDialogDotted();
        return customDialog;
      },
    );
  }

  hideProgressDialog(BuildContext context) async {
    Navigator.of(context, rootNavigator: true).pop('dialog');
    _isDialogShowing = false;
  }
}

class Consts {
  Consts._();

  static const double radiusBorder = 5.0;
  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
