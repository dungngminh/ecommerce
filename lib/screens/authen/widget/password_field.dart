import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatefulWidget {
  final bool darkMode;
  final bool isSignUp;
  final bool isRepeat;
  final ValueChanged<String> onChanged;
  final String? password;
  final Function()? onCompleted;
  final TextInputAction? nextAction;

  const PasswordField({
    Key? key,
    this.isRepeat = false,
    required this.onChanged,
    this.onCompleted,
    this.password,
    this.nextAction,
    required this.isSignUp,
    required this.darkMode,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isHidePass = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            textInputAction: widget.nextAction,
            obscureText: _isHidePass,
            validator: (value) {
              return widget.password == null
                  ? (value!.length < 8 ? 'Password must >=8 characters' : null)
                  : (widget.password != value
                      ? 'The password confirmation does not match'
                      : null);
            },
            onChanged: widget.onChanged,
            onEditingComplete: widget.onCompleted,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.isRepeat ? 'Repeat Password ' : 'Password',
              hintStyle: GoogleFonts.poppins(
                color: kPrimaryColor ,
              ),
              icon: Icon(
                Icons.lock,
                color: kPrimaryColor,
              ),
            ),
          ),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              setState(() {
                _isHidePass = !_isHidePass;
              });
            },
            icon: Icon(
              _isHidePass ? Icons.visibility : Icons.visibility_off,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
