import 'package:flutter/material.dart';

class CartItem with ChangeNotifier {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageSrc;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price,
      required this.imageSrc});
}
