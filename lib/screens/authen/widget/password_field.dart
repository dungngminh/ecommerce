import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatelessWidget {
  final bool isRepeat;
  final ValueChanged<String> onChanged;

  const PasswordField(
      {Key? key, required this.onChanged, this.isRepeat = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: isRepeat ? 'Repeat Password ' : 'Password',
          hintStyle: GoogleFonts.openSans(fontWeight: FontWeight.w300),
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
