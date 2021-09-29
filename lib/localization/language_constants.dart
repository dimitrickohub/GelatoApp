import 'package:flutter/material.dart';
import 'package:flutter_application_2/localization/localization.dart';

import 'package:shared_preferences/shared_preferences.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String RUSSIAN = 'ru';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}

// ignore: missing_return
Locale _locale(String languageCode) {
  if (languageCode == ENGLISH)
    return Locale(ENGLISH, 'US');
  else
    return Locale(RUSSIAN, "RU");
}

String? getTranslated(BuildContext context, String key) {
  return Localization.of(context)!.translate(key);
}
