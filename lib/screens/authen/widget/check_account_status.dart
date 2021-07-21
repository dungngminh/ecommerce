import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckHavingAccountStatus extends StatelessWidget {
  final bool type;
  final Function() function;
  const CheckHavingAccountStatus({
    Key? key,
    required this.function,
    this.type = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          type ? 'New user?  ' : 'Already have an Account? ',
          style: GoogleFonts.openSans(
            color: kPrimaryColor,
          ),
        ),
        GestureDetector(
          onTap: function,
          child: Text(
            type ? 'Sign Up!' : 'Sign in!',
            style: GoogleFonts.openSans(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
