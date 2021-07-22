import 'package:ecommerce/screens/authen/login_screen.dart';
import 'package:ecommerce/screens/authen/widget/check_account_status.dart';
import 'package:ecommerce/screens/authen/widget/custom_divider.dart';
import 'package:ecommerce/screens/authen/widget/email_field.dart';
import 'package:ecommerce/screens/authen/widget/password_field.dart';
import 'package:ecommerce/screens/authen/widget/signup_background.dart';
import 'package:ecommerce/screens/authen/widget/social_linking.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  String emailInput = '';
  String passwordInput = '';

  String rePasswordInput = '';

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

    return SignUpBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'signup'.toUpperCase(),
              style: GoogleFonts.openSans(
                color: kPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            SvgPicture.asset(
              'assets/icons/signup.svg',
              height: size.height * 0.30,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Form(
              key: _key,
              child: Column(
                children: [
                  EmailField(
                    hintText: 'Your Email',
                    icon: Icons.person,
                    onChanged: (String value) {
                      setState(() {
                        emailInput = value;
                      });
                    },
                  ),
                  PasswordField(
                    nextAction: TextInputAction.next,
                    onChanged: (String value) {
                      setState(() {
                        passwordInput = value;
                      });
                    },
                  ),
                  PasswordField(
                    onCompleted: _submit,
                    password: passwordInput,
                    isRepeat: true,
                    onChanged: (String value) {
                      rePasswordInput = value;
                    },
                  ),
                ],
              ),
            ),
            ButtonWidget(text: 'SIGN IN', onPressed: _submit),
            SizedBox(
              height: size.height * 0.015,
            ),
            CheckHavingAccountStatus(
              function: () => Navigator.pushNamed(
                context,
                LoginScreen.routeName,
              ),
              type: false,
            ),
            CustomDividerWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialLinkingAccount(
                  assetName: 'assets/icons/google.svg',
                  onPressed: () {},
                ),
                SocialLinkingAccount(
                  assetName: 'assets/icons/facebook.svg',
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
