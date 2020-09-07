import 'package:flutter/material.dart';
import 'package:flutterapp/stores/forget_password_store.dart';
import 'package:flutterapp/stores/send_code_store.dart';
import 'package:flutterapp/ui/SignIn.dart';
import 'package:flutterapp/ui/dashboard_main.dart';
import 'package:flutterapp/ui/reset_your_password.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'dashboard.dart';
import 'reset_your_password.dart';

class VerificationCode extends StatefulWidget {
  String mobileNumber;
  VerificationCode({this.mobileNumber});
  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  SendCodeStore store = SendCodeStore();
  final codeController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  @override
  void dispose() {
  //  store.dispose();
   // textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 1.1;
    double height = MediaQuery.of(context).size.height / 15;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bgimg.png'),
                  colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstIn),
                  fit: BoxFit.fill
                 )),
          child: SizedBox(
            height: height * 15,
            child: Column(
              children: <Widget>[
                Expanded(child: Container()),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0,right: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.verified_user,
                              color: colorMain,),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "VERIFICATION CODE",
                                style: TextStyle(
                                    fontSize: headingFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          Text(
                            "Enter password reset code you have received",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: subHeadingFontSize),
                          ),
                          verificationCodeSixNumberWidget(),
                          verifyAndContinueButtonWidget(height, width),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignIn()),
                                      (Route<dynamic> route) => false,
                                );
                              },
                              child: Text("Back to sign in",
                              style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.bold),)),
                        ],
                      ),
                    )),
                Expanded(child: bottomBarTextCopyright()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  verificationCodeSixNumberWidget() {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 0, right:0),
        child: PinCodeTextField(
          length: 6,
          obsecureText: false,
          animationType: AnimationType.fade,
          textInputType: TextInputType.number,
          pinTheme: PinTheme(
            activeColor: colorMain,
            disabledColor: Colors.grey[600],
            inactiveColor: Colors.grey[600],
            inactiveFillColor: colorMain,
            selectedColor: Colors.grey[600],
            shape: PinCodeFieldShape.underline,
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: colorMain,
          ),
          animationDuration: Duration(milliseconds: 300),
          controller: textEditingController,
          onCompleted: (v) {},
          onChanged: (value) => store.code = value,
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ));
  }

  verifyAndContinueButtonWidget(height, width) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
      height: height40,
      width: width,
      child: RaisedButton(
        onPressed: () {
          store.mobileNumber = widget.mobileNumber;
          store.validateCode(store.code);
          if (store.error.code != null) {
            showToast(store.error.code, true);
            return;
          }
          store.verifyCode(context).then((response) {
            if (response.error == "true")
              showToast(response.message, true);

            else {
              textEditingController.clear();
              print("code "+store.code);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ResetPassword(code:store.code,mobileNumber: store.mobileNumber,)));
              //showToast(response.message, true);
            }
          });
        },
        color: colorMain,
        disabledColor: colorMain,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'VERIFY & CONTINUE',
              style: TextStyle(fontSize: buttonFontSize,
              fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }
}
