import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/user.dart';
import 'package:flutter_application_2/screens/regisration_page.dart';
import 'package:flutter_application_2/root_app.dart';
import 'package:flutter_application_2/sevices/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootApp(),
    ),
  );
}
