import 'package:firebase_auth/firebase_auth.dart';

class Userdom {
  late String id;
  Userdom.fromFirebase(User user) {
    id = user.uid;
  }
}
