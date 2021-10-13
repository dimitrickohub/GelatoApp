import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_application_2/root_app.dart';
import 'package:flutter_application_2/screens/regisration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kLogoImage = 'assets/images/logo.png';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  Route routeLand = MaterialPageRoute(builder: (context) => const RootApp());
  final routesReg =
      MaterialPageRoute(builder: (context) => const RegisterPage());

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 110,
          height: 110,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(kLogoImage), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      navigateUser();
    });
  }

  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: unnecessary_null_in_if_null_operators
    String? status = (prefs.getString('email') ?? null);
    // print(status);

    if (status != null) {
      Navigator.pushReplacement(context, routeLand);
    } else {
      Navigator.pushReplacement(context, routesReg);
    }
  }
}
