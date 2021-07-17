import 'package:ecommerce/models/cart_item.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get getAllCartItem => {..._cartItems};

  double get getTotalAmount {
    var totalAmout = 0.0;
    _cartItems
        .forEach((key, value) => totalAmout += value.price * value.quantity);
    return totalAmout;
  }
}
