import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailField extends StatelessWidget {
  final bool darkMode;
  final bool isSignUp;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const EmailField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.onChanged,
      required this.isSignUp,
      required this.darkMode})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      child: TextFormField(
        textInputAction: TextInputAction.next,
        validator: (value) {
          return RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value!)
              ? null
              : "Please provide a valid email";
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
