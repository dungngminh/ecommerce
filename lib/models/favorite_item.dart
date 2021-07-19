import 'package:flutter/material.dart';

class FavoriteItem with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String imageSrc;

  FavoriteItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.imageSrc});
}