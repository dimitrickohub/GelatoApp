import 'package:flutter/material.dart';
import 'package:flutter_application_2/router/route_constants.dart';
import 'package:flutter_application_2/screens/regisration_page.dart';

class CustomRouter {
  // ignore: missing_return
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => RegisterPage());
    }
  }
}
