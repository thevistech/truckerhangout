import 'package:flutter/material.dart';
import 'package:flutterapp/stores/reset_password_store.dart';
import 'package:flutterapp/ui/SignIn.dart';
import 'package:flutterapp/ui/ThankyouScreen.dart';
import 'package:flutterapp/utills/config.dart';

class ResetPassword extends StatefulWidget {
  String code;
  String mobileNumber;

  ResetPassword({this.code, this.mobileNumber});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.setupValidations();
  }

  final FocusNode newPasswordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final store = ResetPasswordStore();

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
            fit: BoxFit.fill,
            colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(0.5), BlendMode.dstIn),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.lock,
                              color: colorMain,),
                              SizedBox(width: 5),
                              Text(
                                "RESET YOUR PASSWORD?",
                                style: TextStyle(
                                    fontSize: headingFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          Text(
                            "Enter new password and confirm password",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: subHeadingFontSize),
                          ),
                          newPasswordWidget(height, width),
                          confirmPasswordWidget(height, width),
                          submitButtonWidget(height, width),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: Text("Back to sign in",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),)),
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

  newPasswordWidget(height, width) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
      height: height40,
     // width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        onChanged: (value) => store.password = value,
        controller: newPasswordController,
        focusNode: newPasswordFocusNode,
        onFieldSubmitted: (term) {
          fieldFocusChange(
              context, newPasswordFocusNode, confirmPasswordFocusNode);
        },
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(color: Colors.black),
          hintText: 'New Password',
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.lock,
              size: prefixIconSize,
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.all(10.0),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: colorMain, width: 1.0),
          ),
        ),
      ),
    );
  }

  confirmPasswordWidget(height, width) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      height: height40,
      width: width,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        onChanged: (value) => store.confirmPassword = value,
        controller: confirmPasswordController,
        textInputAction: TextInputAction.done,
        focusNode: confirmPasswordFocusNode,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(color: Colors.black),
          hintText: 'Confirm Password',
          prefixIcon: Container(
            margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
            decoration: BoxDecoration(color: colorMain, shape: BoxShape.circle),
            child: Icon(
              Icons.lock,
              size: prefixIconSize,
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.all(10.0),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(const Radius.circular(32.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: colorMain, width: 1.0),
          ),
        ),
      ),
    );
  }

  submitButtonWidget(height, width) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
      height: height40,
      width: width,
      child: RaisedButton(
        onPressed: () {
          print("code reset screen " + widget.code);
          store.code = widget.code;
          store.mobileNumber = widget.mobileNumber;
          store.validatePassword(store.password);
          store.validateConfirmPassword(store.confirmPassword);
          if (store.error.password != null) {
            showToast(store.error.password, true);
            return;
          }
          if (store.error.confirmPassword != null) {
            showToast(store.error.confirmPassword, true);
            return;
          }
          store.resetPassword(context).then((response) {
            if (response.error == "false")
              showToast(response.message, false);
            else {
              showToast(response.message, true);
            }
          });
          //_onClickOnSubmit();
        },
        color: colorMain,
        disabledColor: colorMain,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'SUBMIT',
              style: TextStyle(fontSize: buttonFontSize

              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

  _onClickOnSubmit() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ThankyouScreen();
    }));
  }
}
