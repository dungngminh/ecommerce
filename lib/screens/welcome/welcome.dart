import 'package:ecommerce/screens/welcome/widget/welcome_body.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = "/welcome";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeBody(),
    );
  }
}
