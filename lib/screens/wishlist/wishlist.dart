import 'package:ecommerce/screens/wishlist/widget/wishlist_empty.dart';
import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  static const routeName = '/wishlist/wishlist.dart';
  @override
  Widget build(BuildContext context) {
    List wishlistList = [];
    return wishlistList.isNotEmpty
        ? Scaffold(
            body: EmptyWishlist(),
          )
        : Scaffold(
            body: Container(),
          );
  }
}
