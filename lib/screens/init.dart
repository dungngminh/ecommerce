import 'package:ecommerce/screens/main_screen/main_screen.dart';
import 'package:ecommerce/screens/welcome/welcome.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InitState extends StatelessWidget {
  static const routeName = '/';
  const InitState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            print(snapshot.data.toString() + ' main screen');
            return MainScreen();
          } else {
            print('welcome_screen');
            return WelcomeScreen();
          }
        } else
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            ),
          );
      },
    );
  }
}
