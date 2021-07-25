import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckHavingAccountStatus extends StatelessWidget {
  final bool darkMode;
  final bool type;
  final Function() function;
  const CheckHavingAccountStatus({
    Key? key,
    required this.function,
    this.type = true, required this.darkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          type ? 'New user?  ' : 'Already have an Account? ',
          style: GoogleFonts.poppins(
            color: darkMode?kPrimaryLightColor:kPrimaryColor,
            // fontSize: 1,
          ),
        ),
        GestureDetector(
          onTap: function,
          child: Text(
            type ? 'Sign Up!' : 'Sign in!',
            style: GoogleFonts.poppins(
              color:darkMode?kPrimaryLightColor:kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
