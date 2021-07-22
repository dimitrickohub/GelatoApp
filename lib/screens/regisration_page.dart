import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/user.dart';
import 'package:flutter_application_2/localization/language_constants.dart';
import 'package:flutter_application_2/root_app.dart';
import 'package:flutter_application_2/screens/sign_up_page.dart';
import 'package:flutter_application_2/sevices/auth.dart';

import 'package:flutter_application_2/theme/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      getTranslated(context, 'welcome_back'),
                      style: TextStyle(
                          color: grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
                SizedBox(
                  height: 20,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white.withAlpha(12),
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(20),
                //     ),
                //   ),
                //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                //   child: TextField(
                //     style: TextStyle(color: white),
                //     controller: nameController,
                //     decoration: InputDecoration(
                //         border: InputBorder.none,
                //         labelText: 'User Name',
                //         labelStyle: TextStyle(color: white)),
                //   ),
                // ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(10),
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
                            hintText: getTranslated(context, 'user_name'),
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
                // Container(
                //   height: 50,
                //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                //   child: TextField(
                //     style: TextStyle(color: white),
                //     obscureText: true,
                //     controller: passwordController,
                //     decoration: InputDecoration(
                //         fillColor: Colors.white.withAlpha(12),
                //         filled: true,
                //         border: OutlineInputBorder(
                //           borderSide: BorderSide(color: primary),
                //         ),
                //         labelText: 'Password',
                //         labelStyle: TextStyle(color: white)),
                //   ),
                // ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(10),
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
                            hintText: getTranslated(context, 'password'),
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
                    child: ElevatedButton(
                      // splashColor: primary,
                      // highlightColor: primary,
                      // style: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(10)),
                      // color: primary,
                      style: ElevatedButton.styleFrom(
                        primary: primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        // padding: EdgeInsets.symmetric(
                        //     horizontal: 50, vertical: 20),
                        // textStyle: TextStyle(
                        //     fontSize: 30, fontWeight: FontWeight.bold)
                      ),
                      child: Text(
                        getTranslated(context, 'sign_in'),
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      onPressed: () {
                        _signInButtonAction();
                        Navigator.push(
                            context,
                            PageTransition(
                                alignment: Alignment.center,
                                child: RootApp(),
                                type: PageTransitionType.scale));
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text(
                      getTranslated(context, 'sign_up_text'),
                      style: TextStyle(
                          color: grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    FlatButton(
                      child: Text(
                        getTranslated(context, 'sign_up'),
                        style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                alignment: Alignment.center,
                                child: SignUpPage(),
                                type: PageTransitionType.scale));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }

  void _signInButtonAction() async {
    _email = _emailController.text;
    _password = _passwordController.text;
    developer.log(_email);

    if (_email.isEmpty || _password.isEmpty) return;

    Userdom userdom = await _authService.singInWithEmailAndPassword(
        _email.trim(), _password.trim());
    if (userdom = null) {
      Fluttertoast.showToast(
          msg: "Can't Sign-In you, please check your email and password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      _emailController.clear();
      _passwordController.clear();
    }
  }
}
