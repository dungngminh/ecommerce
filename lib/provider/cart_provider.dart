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

  void addItemToCart(String id, String title, double price, String imageSrc) {
    if (_cartItems.containsKey(id)) {
      _cartItems.update(
        id,
        (existingProduct) => CartItem(
          id: existingProduct.id,
          title: existingProduct.title,
          quantity: existingProduct.quantity + 1,
          price: existingProduct.price,
          imageSrc: existingProduct.imageSrc,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        id,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
          imageSrc: imageSrc,
        ),
      );
    }
    notifyListeners();
  }

  void reduceItemFromCart(
      String id, String title, double price, String imageSrc) {
    if (_cartItems.containsKey(id)) {
      _cartItems.update(
        id,
        (existingProduct) => CartItem(
          id: existingProduct.id,
          title: existingProduct.title,
          quantity: existingProduct.quantity - 1,
          price: existingProduct.price,
          imageSrc: existingProduct.imageSrc,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _cartItems.remove(id);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
