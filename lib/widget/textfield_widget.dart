import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final Widget child;
  const TextFieldWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
