import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDividerWidget extends StatelessWidget {
  final bool darkMode;
  final String title;
  const CustomDividerWidget({
    Key? key,
    required this.title, required this.darkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.015),
      width: size.width * 0.8,
      child: Row(
        children: [
          customDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              title.toUpperCase(),
              style: GoogleFonts.poppins(
                color: darkMode?kPrimaryLightColor:kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Color(0xFFD9D9D9),
              height: 2,
            ),
          ),
        ],
      ),
    );
  }

  Expanded customDivider() {
    return Expanded(
      child: Divider(
        color: Color(0xFFD9D9D9),
        height: 2,
      ),
    );
  }
}
