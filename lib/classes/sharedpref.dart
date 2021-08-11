import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  SharedPreferences localStorage;
  saveLoginPass(String email, String password) async {
    localStorage = await SharedPreferences.getInstance();

    localStorage.setString('email', email);
    localStorage.setString('password', password);
  }
}
