import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';

class SignUpBackground extends StatelessWidget {
  const SignUpBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/signup_top.png',
              height: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/main_bottom.png',
              width: size.width * 0.2,
            ),
          ),
          child,
          Positioned(
            top: 20,
            left: 10,
            child: IconButton(
              splashRadius: 20,
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: kPrimaryColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
