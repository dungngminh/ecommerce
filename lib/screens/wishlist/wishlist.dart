import 'package:ecommerce/provider/wishlist_provider.dart';
import 'package:ecommerce/screens/wishlist/widget/wishlist_empty.dart';
import 'package:ecommerce/screens/wishlist/widget/wishlist_item.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/utils/helper_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishList extends StatelessWidget {
  static const routeName = '/wishlist';
  @override
  Widget build(BuildContext context) {
    HelperMethod helperMethod = new HelperMethod();
    final wishListProvider = Provider.of<WishListProvider>(context);
    final wishList = wishListProvider.getAllFavoriteItems;
    return wishList.isEmpty
        ? Scaffold(
            body: EmptyWishlist(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Wish List(${wishList.length})'),
              actions: [
                IconButton(
                  onPressed: () => helperMethod.showAlertDialog(
                    title: 'Remove All Items',
                    subtitle: 'Are you sure?',
                    callBackFunc: () => wishListProvider.clearWishList(),
                    context: context,
                  ),
                  icon: Icon(
                    kDelete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
                itemCount: wishList.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: wishList.values.toList()[index],
                    child: WishListItem(
                      productId: wishList.keys.toList()[index],
                    ),
                  );
                }),
          );
  }
}
