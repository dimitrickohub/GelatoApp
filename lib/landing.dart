import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/user.dart';
import 'package:flutter_application_2/root_app.dart';
import 'package:flutter_application_2/screens/regisration_page.dart';
import 'package:flutter_application_2/screens/sign_up_page.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Userdom user = Provider.of<Userdom>(context);
    final bool isSignIn = user != null;

    return isSignIn ? RootApp() : RegisterPage();
  }
}
