import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/screens/cart/widget/custom_widget.dart';
import 'package:ecommerce/screens/cart/widget/cart_item.dart';
import 'package:ecommerce/screens/cart/widget/empty_cart.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final availableCartItemList = cartProvider.getAllCartItem;

    Future<void> _showDialog(
        String title, String subtitle, Function() fn) async {
      showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 10,
                  ),
                  child: Placeholder(
                    // ICON
                    fallbackWidth: 20,
                    fallbackHeight: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  fn();
                  Navigator.pop(context);
                },
                child: Text(
                  'OK',
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                ),
              ),
            ],
          );
        },
      );
    }

    return availableCartItemList.isEmpty
        ? Scaffold(
            body: EmptyCart(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Cart(${availableCartItemList.length})',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () => _showDialog('Remove All Items',
                      'Are you sure?', () => cartProvider.clearCart()),
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
                itemCount: availableCartItemList.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: availableCartItemList.values.toList()[index],
                    child: CartItemWidget(
                      productId: availableCartItemList.keys.toList()[index],
                    ),
                  );
                },
              ),
            ),
            bottomSheet: checkoutSection(context),
          );
  }
}
