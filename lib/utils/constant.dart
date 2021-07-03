import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';

//COLOR
Color kblack = Color(0xFF000000);
Color kwhite = Color(0xFFFFFFFF);
Color kTitle = Color(0xDD00000);
Color kSubTitle = Color(0x8A00000);

Color favColor = Color(0xFFF44336);
Color favBadgeColor = Color(0xFFE57373);

Color cartColor = Color(0xFF5E3581);
Color cartBadgeColor = Color(0xFFBA68C8);

Color gradientFStart = Color(0xFFE040FB);
Color gradientFEnd = Color(0xFFE1BEE7);
Color endColor = Color(0xFF11249F);
Color gradientLEnd = Color(0xFFAB47BC);
Color gradientLStart = Color(0xFFAA00FF);
Color starterColor = Color(0xFF3383CD);
Color darkGrey = Color.fromRGBO(18, 18, 18, 1);
//TEXT STYLE

//ThemeData
ThemeData themeData(bool isDarkMode, BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: isDarkMode ? darkGrey : Colors.white,
    primarySwatch: Colors.blue,
    primaryColor: isDarkMode ? darkGrey : Colors.blue,
    accentColor: Colors.lightBlue,
    backgroundColor: isDarkMode ? darkGrey : kwhite,
    indicatorColor: isDarkMode ? Color(0XFF0E1D36) : Color(0XFFF1F5F8),
    buttonColor: isDarkMode ? Color(0xFF3B3B3B) : Color(0xFFF1F5FB),
    hintColor: isDarkMode ? Colors.grey.shade300 : Colors.grey.shade800,
    highlightColor: isDarkMode ? Color(0xFF372901) : Color(0xFFFCE192),
    hoverColor: isDarkMode ? Color(0xFF3a3a3b) : Color(0xFF4285F4),
    focusColor: isDarkMode ? Color(0xFF0B2512) : Color(0xFFa8DAB5),
    disabledColor: Colors.grey,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: isDarkMode ? kwhite : kblack,
    ),
    cardColor: isDarkMode ? Color(0xFF151515) : kwhite,
    canvasColor: isDarkMode ? darkGrey : Colors.white,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkMode ? ColorScheme.dark() : ColorScheme.light(),
        ),
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: isDarkMode ? Colors.white : Colors.grey,
      selectedItemColor: Colors.blue,
    ),
  );
}

//IconBottomBar

IconData kHome = Icons.home;
IconData kFeed = Icons.rss_feed_rounded;
IconData kSearch = Icons.search;
IconData kCart = Icons.shopping_cart;
IconData kUser = Icons.person;
