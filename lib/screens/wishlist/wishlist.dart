import 'package:ecommerce/screens/wishlist/widget/wishlist_empty.dart';
import 'package:ecommerce/screens/wishlist/widget/wishlist_full.dart';
import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  static const routeName = '/wishlist';
  @override
  Widget build(BuildContext context) {
    List wishlistList = [];
    return wishlistList.isNotEmpty
        ? Scaffold(
            body: EmptyWishlist(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Wish List'),
            ),
            body: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return WishlistFull();
                }),
          );
  }
}
