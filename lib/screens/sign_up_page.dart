// import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_application_2/classes/sharedpref.dart';
import 'package:flutter_application_2/domain/user.dart';
import 'package:flutter_application_2/localization/language_constants.dart';
import 'package:flutter_application_2/root_app.dart';

import 'package:flutter_application_2/sevices/auth.dart';

import 'package:flutter_application_2/theme/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _loading = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image(
                    width: 100,
                    height: 100,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Gelatö',
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w600,
                        fontSize: 30),
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Welcome!',
                      style: TextStyle(
                          color: grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(20),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Feather.user,
                        color: primary,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _emailController,
                          style: TextStyle(color: white),
                          decoration: InputDecoration(
                            hintText: "User name",
                            hintStyle: TextStyle(
                              color: primary.withAlpha(120),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(20),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Feather.lock,
                        color: primary,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          controller: _passwordController,
                          style: TextStyle(color: white),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: primary.withAlpha(120),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: 400,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: !_loading
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            getTranslated(context, 'sign_up'),
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          onPressed: () {
                            _signUpButtonAction();
                            setState(() => _loading = true);
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(primary),
                          ),
                        ),
                )
              ],
            )));
  }

  void _pageTransition() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => RootApp()),
      (Route<dynamic> route) => false,
    );
  }

  void _signUpButtonAction() async {
    _email = _emailController.text;
    _password = _passwordController.text;
    SaveData.saveLoginPass(_email.trim(), _password.trim());

    if (_email.isEmpty || _password.isEmpty) return;

    Userdom user = await _authService.singUpWithEmailAndPassword(
        _email.trim(), _password.trim());
    if (user == null) {
      Fluttertoast.showToast(
          msg: "Can't Sign-Up you, please check your email and password",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: primary,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      _emailController.clear();
      _passwordController.clear();
      _pageTransition();
    }
  }
}
