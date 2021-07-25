import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:ecommerce/screens/authen/public/plc_signup_screen.dart';
import 'package:ecommerce/screens/authen/widget/custom_divider.dart';
import 'package:ecommerce/screens/authen/widget/email_field.dart';
import 'package:ecommerce/screens/main_screen/main_screen.dart';
import 'package:ecommerce/widget/check_account_status.dart';
import 'package:ecommerce/screens/authen/widget/login_background.dart';
import 'package:ecommerce/screens/authen/widget/password_field.dart';
import 'package:ecommerce/screens/authen/widget/social_linking.dart';
import 'package:ecommerce/services/firebase_authenticate.dart';
import 'package:ecommerce/services/firebase_firestore.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  final _db = FireDatabase();

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
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
        );
        if (result != null) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Future.delayed(Duration(milliseconds: 300), () {
          Navigator.pushNamed(context, MainScreen.routeName);
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
    var date = DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formatDate = '${dateParse.day}-${dateParse.month}-${dateParse.year}';
    try {
      setState(() {
        _isLoading = !_isLoading;
      });
      final resultUser = await _auth.signInWithGoogle();

      print('login to ${resultUser!.user!.email}');

      final snackBar = SnackBar(
        content: Text(
          resultUser.user!.email != null
              ? 'Logged in with ${resultUser.user!.email}'
              : 'Error occured! Please try again',
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
      if (resultUser.user!.email == null) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        final _uid = _auth.getCurrentUser!.uid;
        final isExist = await _db.isExistInFirestore(_uid);
        print(isExist ? 'ton tai' : 'ko');
        print(_uid);
        if (!isExist) {
          await _db
              .addUser(
                uid: _uid,
                email: resultUser.user!.email!,
                name: resultUser.user!.displayName,
                imageUrl: resultUser.user!.photoURL,
                phoneNumber: resultUser.user!.phoneNumber,
                joinedDate: formatDate,
                createAt: DateTime.now(),
              )
              .then(
                (value) => print(
                    value ? 'add google ok' : 'add google false or existed'),
              );
        }
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Future.delayed(Duration(milliseconds: 300), () {
          Navigator.pushNamed(context, MainScreen.routeName);
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
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login'.toUpperCase(),
              style: GoogleFonts.poppins(
                color: themeProvider.darkTheme
                    ? kPrimaryLightColor
                    : kPrimaryColor,
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
                    darkMode: themeProvider.darkTheme,
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
                    darkMode: themeProvider.darkTheme,
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
              darkMode: themeProvider.darkTheme,
              function: () =>
                  Navigator.pushNamed(context, PublicSignUpScreen.routeName),
            ),
            CustomDividerWidget(
              darkMode: themeProvider.darkTheme,
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
