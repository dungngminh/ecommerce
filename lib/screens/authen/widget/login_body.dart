import 'package:ecommerce/screens/authen/signup_screen.dart';
import 'package:ecommerce/screens/authen/widget/email_field.dart';
import 'package:ecommerce/screens/authen/widget/check_account_status.dart';
import 'package:ecommerce/screens/authen/widget/login_background.dart';
import 'package:ecommerce/screens/authen/widget/password_field.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _key = GlobalKey<FormState>();

  void _submit() {
    FocusScope.of(context).unfocus();
    if (_key.currentState!.validate()) {
      print(true);
      _key.currentState!.save();
    } else
      print('fail');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login'.toUpperCase(),
              style: GoogleFonts.openSans(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              'assets/icons/login.svg',
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Form(
              key: _key,
              child: Column(
                children: [
                  EmailField(
                    hintText: 'Your Email',
                    icon: Icons.person,
                    onChanged: (String value) {},
                  ),
                  PasswordField(
                    onCompleted: _submit,
                    onChanged: (String value) {},
                  ),
                ],
              ),
            ),
            ButtonWidget(
              text: 'LOG IN',
              onPressed: _submit,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            CheckHavingAccountStatus(
              function: () =>
                  Navigator.pushNamed(context, SignUpScreen.routeName),
            )
          ],
        ),
      ),
    );
  }
}
