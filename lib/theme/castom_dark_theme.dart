import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/colors.dart';

class MyDarkTheme {
  Color? bg1;
  Color? accent1;
  bool isDark;

  MyDarkTheme({required this.isDark});

  ThemeData get themeData {
    TextTheme txtTheme =
        (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    Color txtColor = txtTheme.bodyText1!.color!;
    ColorScheme colorScheme = ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        primaryVariant: primary,
        secondary: primary,
        secondaryVariant: primary,
        background: black,
        surface: black,
        onBackground: txtColor,
        onSurface: txtColor,
        onError: white,
        onPrimary: white,
        onSecondary: white,
        error: Colors.red.shade400);

    var t = ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme)
        .copyWith(highlightColor: accent1, toggleableActiveColor: accent1);

    return t;
  }
}
