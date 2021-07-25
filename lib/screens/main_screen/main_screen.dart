import 'package:ecommerce/screens/main_screen/widget/bottombar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main';
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarScreen();
  }
}
