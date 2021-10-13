import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/classes/sharedpref.dart';
import 'package:flutter_application_2/domain/user.dart';
import 'package:flutter_application_2/localization/language_constants.dart';
import 'package:flutter_application_2/root_app.dart';

import 'package:flutter_application_2/screens/sign_up_page.dart';
import 'package:flutter_application_2/sevices/auth.dart';

import 'package:flutter_application_2/theme/colors.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

const String _kSignIn = 'sign_in';
const String _kUserName = 'user_name';
const String kLogoImage = 'assets/images/logo.png';
const String kSingUpText = 'sign_up_text';
const String kSingUp = 'sign_up';
const String kWelconeBack = 'welcome_back';
const String kPassword = 'password';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _loading = false;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  String? _email;
  String? _password;

  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Image(
                width: 100,
                height: 100,
                image: AssetImage(kLogoImage),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Gelatö',
                style: TextStyle(
                    color: white, fontWeight: FontWeight.w600, fontSize: 30),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Text(
                  getTranslated(context, kWelconeBack)!,
                  style: const TextStyle(
                      color: grey, fontWeight: FontWeight.w600, fontSize: 18),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: <Widget>[
                  const Icon(
                    CupertinoIcons.person,
                    color: primary,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _emailController,
                      style: const TextStyle(color: white),
                      decoration: InputDecoration(
                        hintText: getTranslated(context, _kUserName),
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
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(20),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: <Widget>[
                  const Icon(
                    CupertinoIcons.lock,
                    color: primary,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      style: const TextStyle(color: white),
                      decoration: InputDecoration(
                        hintText: getTranslated(context, kPassword),
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
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 60,
              width: 400,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: !_loading
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        getTranslated(context, _kSignIn)!,
                        style: const TextStyle(
                            color: white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      onPressed: () {
                        _signInButtonAction();
                        setState(() => _loading = true);
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(primary),
                      ),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  getTranslated(context, kSingUpText)!,
                  style: const TextStyle(
                      color: grey, fontWeight: FontWeight.w600, fontSize: 15),
                ),
                TextButton(
                  child: Text(
                    getTranslated(context, kSingUp)!,
                    style: const TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.center,
                            child: const SignUpPage(),
                            type: PageTransitionType.scale));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _pageTransition() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const RootApp()),
      (Route<dynamic> route) => false,
    );
  }

  void _signInButtonAction() async {
    _email = _emailController.text;
    _password = _passwordController.text;
    SaveData.saveLoginPass(_email!.trim(), _password!.trim());

    if (_email!.isEmpty || _password!.isEmpty) return;

    Userdom? user = await _authService.singInWithEmailAndPassword(
        _email!.trim(), _password!.trim());
    if (user == null) {
      Fluttertoast.showToast(
          msg: 'Can not Sign-In you, please check your email and password',
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
