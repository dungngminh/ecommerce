import 'package:ecommerce/models/settings.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  Setting setting = Setting();

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    setting.setDarkTheme(value);
    notifyListeners();
  }
}
