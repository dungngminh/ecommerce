import 'package:ecommerce/screens/widget/full_cart.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screens/widget/empty_cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List products = [];
    return products.isNotEmpty
        ? Scaffold(
            body: EmptyCart(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Cart Items Counts'),
              actions: [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    kDelete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 70),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return FullCart();
                },
              ),
            ),
            bottomSheet: checkoutSection(),
          );
  }

  Widget checkoutSection() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: darkGrey, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Material(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Checkout',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              'Total: ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '\$450',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
