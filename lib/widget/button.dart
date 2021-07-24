import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final bool? isLoading;
  final Function() onPressed;
  final Color color, textColor;
  const ButtonWidget({
    required this.text,
    required this.onPressed,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.78,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            backgroundColor: color,
          ),
          onPressed: onPressed,
          child: isLoading == null
              ? Text(
                  text,
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : (isLoading!
                  ? Container(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: textColor,
                        strokeWidth: 2.0,
                      ),
                    )
                  : Text(
                      text,
                      style: GoogleFonts.poppins(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
        ),
      ),
    );
  }
}
