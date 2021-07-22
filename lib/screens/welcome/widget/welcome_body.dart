import 'package:ecommerce/screens/authen/login_screen.dart';
import 'package:ecommerce/screens/authen/signup_screen.dart';
import 'package:ecommerce/screens/welcome/widget/welcome_background.dart';
import 'package:ecommerce/widget/button.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WelcomeBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'welcome to shop app'.toUpperCase(),
              // textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              'assets/icons/chat.svg',
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ButtonWidget(
              text: 'LOG IN',
              onPressed: () =>
                  Navigator.pushNamed(context, LoginScreen.routeName),
            ),
            ButtonWidget(
              text: 'SIGN UP',
              onPressed: () =>Navigator.pushNamed(context, SignUpScreen.routeName),
              color: kPrimaryLightColor,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
