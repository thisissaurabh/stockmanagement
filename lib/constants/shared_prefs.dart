import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Keys {
  final String token = 'token';
  final String email = 'email';
  final String password = 'password';
  final String loginDone = 'login_done';
}

class SharedPrefs {
  String login = 'login';
  static SharedPreferences? _prefs;

  Future clearPrefs() async {
    _prefs!.clear();
  }

  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }



  Future setLoginTrue() async {
    return await _prefs?.setBool(login, true);
  }

  bool? getLogin() {
    return _prefs?.getBool(login);
  }

  Future setLoginFalse() async {
    return await _prefs?.setBool(login, false);
  }
}
