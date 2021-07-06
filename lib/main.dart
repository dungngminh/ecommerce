import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  Future getCurrentAppTheme() async {
    themeProvider.darkTheme = await themeProvider.setting.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => themeProvider,
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, theme, child) {
          return MaterialApp(
            title: "Ecommerce",
            theme: themeData(theme.darkTheme, context),
            debugShowCheckedModeBanner: false,
            home: BottomBarScreen(),
          );
        },
      ),
    );
  }
}
