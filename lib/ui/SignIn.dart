import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterapp/ui/cards_dashboard.dart';
import 'package:flutterapp/ui/signup/sign_up.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/ui/forgot_password.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utills/config.dart';
import '../stores/sign_in_store.dart';
import 'dashboard.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final store = SignInStore();

  String msg = '';
  bool passwordVisible;
  bool showTooltip = false;

  //Focus Nodes
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  //Controllers
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.setupValidations();
    passwordVisible = false;
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height / 15;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
//          decoration: BoxDecoration(
//              image: DecorationImage(
//                  image: AssetImage('assets/bg_image.png'),
//                  colorFilter: new ColorFilter.mode(
//                      Colors.white.withOpacity(0.3), BlendMode.dstIn),
//                  fit: BoxFit.fill)),
          child: SizedBox(
            height: height * 15,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Image.asset('assets/cloud.png')
                      // Image.asset('assets/youarealmost.png')
                     // backgroundImage(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.exit_to_app,
                            color: colorMain,
                          ),
                          // Image.asset('assets/signin.png'),
                          // Icon(Icons.insert_drive_file),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'SIGN IN',
                            style: TextStyle(
                                fontSize: headingFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                          // Image.asset('assets/signupandsubmit.png')
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Enter Your Credentials',
                        style: TextStyle(fontSize: subHeadingFontSize),
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      //buildTextField("Email"),
                      emailAndNumberWidget(height, width),
                      SizedBox(
                        height: 15,
                      ),
                      passwordWidget(height, width),
                      SizedBox(
                        height: 30,
                      ),
                      signInWidget(height, width),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                        child: new Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ForgotPassword();
                                  }));
                                },
                                child: new Text(
                                  "Forget Your Password?",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black),
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SignUpNew();
                                  }));
                                },
                                child: new Text("Create an Account?",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.black)),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 2, child: bottomBarTextCopyright()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  passwordWidget(height, width) {
    return Container(
      height: height40,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Observer(
          builder: (_) => TextFormField(
            style: TextStyle(fontSize: 12),
            obscureText: !passwordVisible,
            focusNode: passwordFocus,
            //  obscureText: true,
            controller: passController,
            onChanged: (value) => store.password = value,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 12),
              //  errorText: store.error.password,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0)),
              suffixIcon: IconButton(
                icon: Icon(
                    // Based on passwordVisible state choose the icon
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: colorMain),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
              prefixIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                decoration:
                    BoxDecoration(color: colorMain, shape: BoxShape.circle),
                child: Icon(
                  Icons.lock,
                  size: prefixIconSize,
                  color: Colors.white,
                ),
              ),
              contentPadding: EdgeInsets.all(5),
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  emailAndNumberWidget(height, width) {
    return SizedBox(
      height: height40,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Observer(
          builder: (_) => TextFormField(
            style: TextStyle(fontSize: 12),
            focusNode: emailFocus,
            textInputAction: TextInputAction.next,
            onChanged: (value) => store.email = value,
            onFieldSubmitted: (term) {
              _fieldFocusChange(context, emailFocus, passwordFocus);
            },
            controller: emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              // errorText: store.error.email,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0)),
              hintText: 'Email & Number',
              hintStyle: TextStyle(fontSize: 12),
              prefixIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                decoration:
                    BoxDecoration(color: colorMain, shape: BoxShape.circle),
                child: Icon(
                  Icons.person,
                  size: suffixIconSize,
                  color: Colors.white,
                ),
              ),
              contentPadding: EdgeInsets.all(5),
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return Stack(
      alignment: Alignment.topRight,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: height40,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0)),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                decoration:
                    BoxDecoration(color: colorMain, shape: BoxShape.circle),
                child: Icon(
                  Icons.person,
                  size: suffixIconSize,
                  color: Colors.white,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    showTooltip = !showTooltip;
                  });
                },
              ),
              hintText: "Password",
              contentPadding: EdgeInsets.all(5),
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(32.0)),
                  borderSide: BorderSide(color: colorMain, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                setState(() {
                  showTooltip = true;
                });
                return "";
              }
            },
          ),
        ),
        Positioned(
          top: 45,
          right: 10,
          //You can use your own custom tooltip widget over here in place of below Container
          child: showTooltip
              ? Container(
                  width: 250,
                  height: 50,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      "Your passwords must match and be 6 characters long.",
                      style: TextStyle(
                          color: Colors.white, backgroundColor: Colors.black),
                    ),
                  ),
                )
              : Container(),
        )
      ],
    );
  }

  signInWidget(heightButton, width) {
    return Observer(
      builder: (_) => Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        padding: EdgeInsets.all(0.0),
        height: height40,
        width: width,
        child: RaisedButton(
          padding: EdgeInsets.all(0),
          onPressed: store.validateEmailAndPassword() ? null : callSignInApi,
          color: colorMain,
          disabledColor: disabledButtonColor,
          textColor: Colors.white,
          disabledTextColor: Colors.white,
          child: Stack(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  ' SIGN IN',
                  style: TextStyle(
                      fontSize: buttonFontSize, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                //  padding: const EdgeInsets.symmetric(horizontal: 0),
                margin: EdgeInsets.all(4),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_forward,
                        size: prefixIconSize,
                        color: colorMain,
                      )),
                ),
              ),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }

  callSignInApi() {
    store.getTheUsers(context).then((response) {
      if (response.error == "false") {
        //showToast(response.messages[0], false);
        Config.setUserName("${response.data.user.userFullName}");
        Config.setUserDisplayName("${response.data.user.displayName}");
        Config.setUserEmail("${response.data.user.email}");
        Config.setUserProfilePicture(
            "${response.data.url}${response.data.user.img}");
        Config.setBasicImageUrl("${response.data.user.img}");
        Config.setUserID("${response.data.user.userId}");
        Config.setCompanyID("${response.data.user.compId}");
        Config.setUserCompanyName("${response.data.user.compName}");
        // Config.setUserMobile("${response.data.user}");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CardDasboard()),
          (Route<dynamic> route) => false,
        );
      } else if (response.error == "true") {
        showToast(response.messages[0], true);
      }
    });
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  showToast(msg, error) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: error == true ? Colors.red : Colors.green,
        textColor: error == true ? Colors.white : Colors.black,
        fontSize: 16.0);
  }
}
