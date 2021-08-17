import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
// void main() => runApp(MyApp());
  //   MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: RegisterPage(),
  //   ),
  // );
// }
