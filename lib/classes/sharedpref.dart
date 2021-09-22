import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

class SaveData {
  static late SharedPreferences localStorage;

  static saveLoginPass(String email, String password) async {
    localStorage = await SharedPreferences.getInstance();

    localStorage.setString("email", email);
    localStorage.setString("password", password);
  }

  static deleteEmailPass(String email, String password) async {
    localStorage = await SharedPreferences.getInstance();
    localStorage.remove('email');
    localStorage.remove('password');
  }

  static getInstance() async {
    localStorage = await SharedPreferences.getInstance();
    String emailSP = localStorage.getString('email')!;
    developer.log('SP ' + emailSP);
    return emailSP;
  }

  static remove() async {
    localStorage = await SharedPreferences.getInstance();
    localStorage.remove('email');
    localStorage.remove('password');
  }
}
