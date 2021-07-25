import 'package:ecommerce/screens/authen/public/widget/plc_login_body.dart';
import 'package:flutter/material.dart';

class PublicLoginScreen extends StatelessWidget {
  static const routeName = '/login_public';
  const PublicLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
    );
  }
}
