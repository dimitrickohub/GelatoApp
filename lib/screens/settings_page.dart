import 'package:flutter/material.dart';
import 'package:flutter_application_2/classes/language.dart';
import 'package:flutter_application_2/localization/language_constants.dart';
import 'package:flutter_application_2/my_app.dart';
import 'package:flutter_application_2/screens/regisration_page.dart';
import 'package:flutter_application_2/sevices/auth.dart';

import 'package:flutter_application_2/theme/colors.dart';
import 'package:page_transition/page_transition.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

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
          getTranslated(context, 'settings'),
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
                  'dima229131@gmail.com',
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ],
            ),
          ]),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.bottomLeft,
              child: DropdownButton<Language>(
                dropdownColor: primary,
                iconSize: 30,
                hint: Text(
                  getTranslated(context, 'change_language'),
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.w600, fontSize: 15),
                ),
                onChanged: (Language language) {
                  _changeLanguage(language);
                },
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem<Language>(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              e.flag,
                              style: TextStyle(
                                fontSize: 15,
                                color: white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(e.name)
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
            onPressed: () {
              AuthService().logOut();
              Navigator.push(
                  context,
                  PageTransition(
                      alignment: Alignment.center,
                      child: RegisterPage(),
                      type: PageTransitionType.scale));
            },
            child: Text(
              getTranslated(context, 'log_out'),
              style: TextStyle(
                  color: primary, fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
