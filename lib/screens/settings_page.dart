import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/classes/language.dart';
import 'package:flutter_application_2/classes/sharedpref.dart';
import 'package:flutter_application_2/config.dart';

import 'package:flutter_application_2/localization/language_constants.dart';
import 'package:flutter_application_2/my_app.dart';
import 'package:flutter_application_2/screens/regisration_page.dart';
import 'package:flutter_application_2/sevices/auth.dart';

import 'package:flutter_application_2/theme/colors.dart';

import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

const String kSettings = 'settings';
const String kLogoImage = 'assets/images/profile.png';
const String kChangeLanguage = 'change_language';
const String kLogOut = 'log_out';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? _email;
  bool _isTap = false;
  late var imagePicker;

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  void initState() {
    super.initState();
    getInstance();
    imagePicker = new ImagePicker();
  }

  void getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = (prefs.getString('email') ?? '');
    });
  }

  XFile? image;
  var _image;
  _imgFromGallery() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: getAppBar() as PreferredSizeWidget?,
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      title: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          getTranslated(context, kSettings)!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
              onPressed: () {
                if (_isTap) {
                  setState(() {
                    _isTap = false;
                  });
                } else
                  setState(() {
                    _isTap = true;
                  });
                currentTheme.switchTheme();
              },
              icon: Icon(
                _isTap ? CupertinoIcons.moon : CupertinoIcons.sun_max,
                color: white,
              )),
        )
      ],
    );
  }

  Widget getBody() {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              width: 20,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: (_image != null
                            ? FileImage(_image)
                            : const AssetImage(kLogoImage))
                        as ImageProvider<Object>,
                    fit: BoxFit.fill),
              ),
              child: TextButton(
                onPressed: () async {
                  _imgFromGallery();
                },
                child: Text(''),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _email.toString(),
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Text(
                  getTranslated(context, 'my_profile')!,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
              ],
            ),
          ]),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Language>(
                dropdownColor: primary,
                iconSize: 30,
                iconEnabledColor: primary,
                hint: Text(
                  getTranslated(context, kChangeLanguage)!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
                onChanged: (Language? language) {
                  _changeLanguage(language!);
                },
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem<Language>(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: grey,
                              ),
                              child: Container(
                                child: Text(
                                  e.flag,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(e.name,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 130, right: 130),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Text(
                getTranslated(context, kLogOut)!,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              onPressed: () {
                SaveData.remove();
                AuthService().logOut();
                Navigator.push(
                    context,
                    PageTransition(
                        alignment: Alignment.center,
                        child: RegisterPage(),
                        type: PageTransitionType.scale));
              },
            ),
          ),
        ],
      ),
    );
  }
}
