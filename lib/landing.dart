import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/user.dart';
import 'package:flutter_application_2/root_app.dart';
import 'package:flutter_application_2/screens/regisration_page.dart';

import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Userdom user = Provider.of<Userdom>(context);
    // ignore: unnecessary_null_comparison
    final bool isSignIn = user != null;

    return isSignIn ? const RootApp() : const RegisterPage();
  }
}
