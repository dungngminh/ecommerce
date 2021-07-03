import 'package:ecommerece/screens/widget/full_cart.dart';
import 'package:flutter/material.dart';
import 'package:ecommerece/screens/widget/empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FullCart(),
    );
  }
}
