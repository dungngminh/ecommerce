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

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LoginBackground(
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
          EmailField(
            hintText: 'Your Email',
            icon: Icons.person,
            onChanged: (String value) {},
          ),
          PasswordField(
            onChanged: (String value) {},
          ),
          ButtonWidget(text: 'LOGIN', onPressed: () {}),
          SizedBox(
            height: size.height * 0.03,
          ),
          CheckHavingAccountStatus(
            function: () =>
                Navigator.pushNamed(context, SignUpScreen.routeName),
          )
        ],
      ),
    );
  }
}
