import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/screens/cart/widget/custom_widget.dart';
import 'package:ecommerce/screens/cart/widget/cart_item.dart';
import 'package:ecommerce/screens/cart/widget/empty_cart.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/utils/helper_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    HelperMethod helperMethod = new HelperMethod();
    final cartProvider = Provider.of<CartProvider>(context);
    final availableCartItemList = cartProvider.getAllCartItem;

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
                  onPressed: () => helperMethod.showAlertDialog(
                    title: 'Remove All Items',
                    subtitle: 'Are you sure?',
                    callBackFunc: () => cartProvider.clearCart(),
                    context: context,
                  ),
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
            bottomSheet: checkoutSection(context, cartProvider.getTotalAmount),
          );
  }
}
