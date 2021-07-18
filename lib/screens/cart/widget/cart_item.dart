import 'package:ecommerce/models/cart_item.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/screens/inner_screen/product_detail.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatefulWidget {
  final String productId;

  CartItemWidget({required this.productId});
  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final cartItemAttribute = Provider.of<CartItem>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    var subTotal = cartItemAttribute.price * cartItemAttribute.quantity;

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
                  child: Placeholder( // ICON
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

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        ProductDetail.routeName,
        arguments: widget.productId,
      ),
      child: Container(
        height: 130,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: const Radius.circular(16),
            topRight: const Radius.circular(16),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.network(cartItemAttribute.imageSrc).image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          cartItemAttribute.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kblack,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32),
                          onTap: () => _showDialog(
                            'Remove Item',
                            'Are you sure?',
                            () => cartProvider.removeItem(widget.productId),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(right: 5),
                            height: 25,
                            width: 25,
                            child: Image(
                              image: Svg(
                                'assets/icons/cross.svg',
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Price: ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '\$ ${cartItemAttribute.price}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        'Sub Total: ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      FittedBox(
                        child: Text(
                          '\$' + subTotal.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Free ship',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Row(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(32),
                              onTap: cartItemAttribute.quantity == 1
                                  ? () {}
                                  : () => cartProvider.reduceItemFromCart(
                                        widget.productId,
                                        cartItemAttribute.title,
                                        cartItemAttribute.price,
                                        cartItemAttribute.imageSrc,
                                      ),
                              child: Container(
                                height: 25,
                                width: 25,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 12,
                            child: Container(
                              width: size.width * 0.1,
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                cartItemAttribute.quantity.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(32),
                              onTap: () => cartProvider.addItemToCart(
                                widget.productId,
                                cartItemAttribute.title,
                                cartItemAttribute.price,
                                cartItemAttribute.imageSrc,
                              ),
                              child: Container(
                                height: 25,
                                width: 25,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
