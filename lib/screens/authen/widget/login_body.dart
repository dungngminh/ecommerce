import 'package:ecommerce/screens/authen/signup_screen.dart';
import 'package:ecommerce/screens/authen/widget/custom_divider.dart';
import 'package:ecommerce/screens/authen/widget/email_field.dart';
import 'package:ecommerce/screens/authen/widget/check_account_status.dart';
import 'package:ecommerce/screens/authen/widget/login_background.dart';
import 'package:ecommerce/screens/authen/widget/password_field.dart';
import 'package:ecommerce/screens/authen/widget/social_linking.dart';
import 'package:ecommerce/services/firebase_authenticate.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/widget/bottombar.dart';
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
  String _emailInput = '';
  String _passInput = '';
  bool _isLoading = false;
  //authen
  final _auth = AuthFirebase();

  _submit() async {
    FocusScope.of(context).unfocus();
    if (_key.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = !_isLoading;
        });
        final result =
            await _auth.signInWithEmailAndPassword(_emailInput, _passInput);
        print(result ?? 'Hello ' + _emailInput);
        final snackBar = SnackBar(
          content: Text(
            result ?? 'Hello ' + _emailInput,
            style: GoogleFonts.poppins(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          behavior: SnackBarBehavior.fixed,
          backgroundColor: Colors.white,
        );
        if (result != null) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Future.delayed(Duration(milliseconds: 300), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomBarScreen(),
              ),
            );
          });
        }
      } finally {
        setState(() {
          _isLoading = !_isLoading;
        });
      }
    }
  }

  _loginWithGoogle() async {
    try {
      setState(() {
        _isLoading = !_isLoading;
      });
      final result = await _auth.signInWithGoogle();
      print(result);
      final snackBar = SnackBar(
        content: Text(
          result ?? 'Error occured! Please try again',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: GoogleFonts.poppins(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.white,
      );
      if (result == null) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Future.delayed(Duration(milliseconds: 300), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomBarScreen(),
            ),
          );
        });
      }
    } finally {
      setState(() {
        _isLoading = !_isLoading;
      });
    }
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
              style: GoogleFonts.poppins(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SvgPicture.asset(
              'assets/icons/login.svg',
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Form(
              key: _key,
              child: Column(
                children: [
                  EmailField(
                    isSignUp: false,
                    hintText: 'Your Email',
                    icon: Icons.person,
                    onChanged: (String value) {
                      setState(() {
                        _emailInput = value;
                      });
                    },
                  ),
                  PasswordField(
                    isSignUp: false,
                    onChanged: (String value) {
                      setState(() {
                        _passInput = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            ButtonWidget(
              text: 'LOG IN',
              onPressed: _submit,
              isLoading: _isLoading,
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            CheckHavingAccountStatus(
              function: () =>
                  Navigator.pushNamed(context, SignUpScreen.routeName),
            ),
            CustomDividerWidget(
              title: 'OR',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialLinkingAccount(
                  assetName: 'assets/icons/google.svg',
                  onPressed: _loginWithGoogle,
                ),
                SocialLinkingAccount(
                  assetName: 'assets/icons/facebook.svg',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
