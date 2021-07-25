import 'package:ecommerce/screens/authen/public/widget/plc_signup_body.dart';
import 'package:flutter/material.dart';

class PublicSignUpScreen extends StatelessWidget {
  static const routeName = '/signup_public';
  const PublicSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody(),
    );
  }
}
