import 'package:ecommerce/screens/authen/widget/signup_body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signup';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody(),
    );
  }
}
