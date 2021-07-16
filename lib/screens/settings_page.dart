import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/colors.dart';
import 'package:page_transition/page_transition.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: black,
      elevation: 0,
      title: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "Settings",
          style: TextStyle(
            fontSize: 20,
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 25,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: 20,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/profile.png'),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  'Dmitry Rachko',
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Text(
                  'dima229131@gamil.com',
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
