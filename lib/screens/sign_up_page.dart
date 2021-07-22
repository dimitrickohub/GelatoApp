import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/user.dart';
import 'package:flutter_application_2/root_app.dart';
import 'package:flutter_application_2/sevices/auth.dart';

import 'package:flutter_application_2/theme/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  height: 50,
                ),
                Container(
                    height: 60,
                    width: 400,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: RaisedButton(
                      splashColor: primary,
                      highlightColor: primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: primary,
                      child: Text(
                        'Sign-Up',
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      onPressed: () {
                        _signUpButtonAction();
                        // print(_emailController.text);
                        // print(_passwordController.text);
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         alignment: Alignment.center,
                        //         child: RootApp(),
                        //         type: PageTransitionType.scale));
                      },
                    )),
              ],
            )));
  }

  void _signUpButtonAction() async {
    _email = _emailController.text;
    _password = _passwordController.text;

    if (_email.isEmpty || _password.isEmpty) return;

    Userdom userdom = await _authService.singUnWithEmailAndPassword(
        _email.trim(), _password.trim());
    if (userdom = null) {
      Fluttertoast.showToast(
          msg: "Can't Sign-Up you, please check your email and password",
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
