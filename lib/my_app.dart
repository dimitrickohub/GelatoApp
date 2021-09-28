import 'package:flutter/material.dart';
import 'package:flutter_application_2/config.dart';

import 'package:flutter_application_2/domain/user.dart';

import 'package:flutter_application_2/localization/language_constants.dart';

import 'package:flutter_application_2/sevices/auth.dart';
import 'package:flutter_application_2/songsJson/songs_service.dart';
import 'package:flutter_application_2/splash/splash_screen.dart';

import 'package:flutter_application_2/theme/castom_dark_theme.dart';
import 'package:flutter_application_2/theme/castom_light_theme.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization/localization.dart';

import 'config.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _email;

  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = (prefs.getString('email') ?? null);
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    getInstance();
    currentTheme.addListener(() {
      print('Changes');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    MyDarkTheme darkTheme = MyDarkTheme(isDark: true);
    MyLightTheme lightTheme = MyLightTheme(isDark: false);
    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color?>(Colors.blue[800])),
        ),
      );
    } else {
      return StreamProvider<Userdom?>.value(
        value: AuthService().currentUser,
        initialData: null,
        child: Provider(
          create: (_) => SongService.create(),
          dispose: (_, SongService service) => service.client.dispose(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme.themeData,
            darkTheme: darkTheme.themeData,
            themeMode: currentTheme.carrentTheme(),
            home: SplashScreen(),
            locale: _locale,
            supportedLocales: [
              Locale("en", "US"),
              Locale("ru", "RU"),
            ],
            localizationsDelegates: [
              Localization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale!.languageCode &&
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
          ),
        ),
      );
    }
  }
}
