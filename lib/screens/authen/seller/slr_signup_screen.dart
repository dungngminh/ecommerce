import 'package:ecommerce/screens/authen/public/widget/plc_signup_body.dart';
import 'package:flutter/material.dart';

class SellerSignUpScreen extends StatelessWidget {
  static const routeName = '/signup_seller';
  const SellerSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody(),
    );
  }
}
