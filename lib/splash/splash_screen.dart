import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_application_2/root_app.dart';
import 'package:flutter_application_2/screens/regisration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  Route routeLand = MaterialPageRoute(builder: (context) => RootApp());
  final routesReg = MaterialPageRoute(builder: (context) => RegisterPage());

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
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage("assets/images/logo.png"), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? status = (prefs.getString('email') ?? null);
    print(status);
    // print("Splash is work!  email: " + prefs.getString('email')!);
    if (status != null) {
      Navigator.pushReplacement(context, routeLand);
    } else {
      Navigator.pushReplacement(context, routesReg);
    }
  }
}




// import 'dart:async';

// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   final String nextRoute;

//   SplashScreen({this.nextRoute});
//   @override
//   State<StatefulWidget> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 2), () {
//       Navigator.of(context).pushReplacementNamed(widget.nextRoute);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('EVILEG'),
//             Text("Welcome to social network of programmers")
//           ],
//         ),
//       ),
//     );
//   }
// }
