import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailField extends StatelessWidget {
  final bool isSignUp;
  final int? validatorType;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const EmailField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.onChanged,
      this.validatorType = 3,
      required this.isSignUp})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      child: TextFormField(
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (validatorType == 3)
            return RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!)
                ? null
                : "Please provide a valid email";
          else if (validatorType == 1)
            return !isSignUp
                ? 'No user found for that email.'
                : 'The account already exists for that email.';
          else
            return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.openSans(fontWeight: FontWeight.w300),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
