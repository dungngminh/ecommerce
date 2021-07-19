import 'package:badges/badges.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/provider/wishlist_provider.dart';
import 'package:ecommerce/screens/cart/cart.dart';
import 'package:ecommerce/screens/feeds/widget/feeds_product.dart';
import 'package:ecommerce/screens/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/feeds';
  @override
  Widget build(BuildContext context) {
    final popular = ModalRoute.of(context)!.settings.arguments as String? ??
        'all'; // can be null => null = all,
    print(popular);
    final _productProvider = Provider.of<ProductProvider>(context);
    var _listProduct = _productProvider.products;
    if (popular == 'popular') _listProduct = _productProvider.popularProduct;
    print(_listProduct.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(popular == 'all' ? 'Feeds' : 'Popular Product'),
        actions: [
          Consumer<WishListProvider>(
            builder: (context, wlProvider, child) => Badge(
              badgeColor: Colors.pink,
              animationType: BadgeAnimationType.scale,
              toAnimate: true,
              position: BadgePosition.topEnd(
                top: 6,
                end: 6,
              ),
              badgeContent: Text(
                wlProvider.getAllFavoriteItems.length.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(WishList.routeName);
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) => Badge(
              badgeColor: Colors.pinkAccent,
              animationType: BadgeAnimationType.scale,
              toAnimate: true,
              position: BadgePosition.topEnd(
                top: 6,
                end: 6,
              ),
              badgeContent: Text(
                cartProvider.getAllCartItem.length.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: _listProduct.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: _listProduct[index],
            child: FeedsProduct(),
          ),
          staggeredTileBuilder: (index) =>
              StaggeredTile.count(2, index.isEven ? 3.6 : 3.8),
          mainAxisSpacing: 7.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}
