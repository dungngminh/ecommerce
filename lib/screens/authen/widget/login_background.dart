import 'package:ecommerce/screens/welcome/welcome.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;

  const LoginBackground({Key? key, required this.child}) : super(key: key);

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
              'assets/images/main_top.png',
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: -5,
            right: -20,
            child: Image.asset(
              'assets/images/login_bottom.png',
              width: size.width * 0.4,
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
