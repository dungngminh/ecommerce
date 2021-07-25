import 'package:shared_preferences/shared_preferences.dart';

class Setting {
  static const THEME_STATUS = "THEMESTATUS";
  static const LOGIN_STATUS = "ISLOGGEDIN";
  static const EMAIL_KEY = "EMAILKEY";

  Future<bool> setDarkTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(THEME_STATUS) ?? false;
  }
 
  Future<bool> saveStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(LOGIN_STATUS, isLoggedIn);
  }

  Future<bool> saveEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(EMAIL_KEY, email);
  }

  //lấy data trong SPreference

  Future<bool> getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(LOGIN_STATUS) ?? false;
  }

  Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(EMAIL_KEY) ?? "";
  }
}
