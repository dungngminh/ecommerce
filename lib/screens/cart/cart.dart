import 'dart:async';

import 'package:ecommerce/screens/cart/widget/custom_widget.dart';
import 'package:ecommerce/screens/cart/widget/cart_item.dart';
import 'package:ecommerce/screens/cart/widget/empty_cart.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    List products = [];
    return products.isEmpty
        ? Scaffold(
            body: EmptyCart(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Cart Items Counts',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    kDelete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 90),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CartItemWidget();
                },
              ),
            ),
            bottomSheet: checkoutSection(context),
          );
  }
}
