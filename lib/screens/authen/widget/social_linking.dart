import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLinkingAccount extends StatelessWidget {
  final String assetName;
  final Function() onPressed;
  const SocialLinkingAccount({
    Key? key,
    required this.assetName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          assetName,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
