import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/domain/user.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<Userdom> singInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return Userdom.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future<Userdom> singUnWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return Userdom.fromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<Userdom> get currentUser {
    return _fAuth
        .authStateChanges()
        .map((User user) => user != null ? Userdom.fromFirebase(user) : null);
  }
}
