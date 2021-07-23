import 'package:ecommerce/models/cart_item.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/screens/inner_screen/product_detail.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/utils/helper_method.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    HelperMethod helperMethod = new HelperMethod();
    var size = MediaQuery.of(context).size;
    final cartItemAttribute = Provider.of<CartItem>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    var subTotal = cartItemAttribute.price * cartItemAttribute.quantity;

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
                          style: GoogleFonts.poppins(
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
                          onTap: () => helperMethod.showAlertDialog(
                            title: 'Remove Item',
                            subtitle: 'Are you sure?',
                            callBackFunc: () => cartProvider.removeItem(
                              id: widget.productId,
                            ),
                            context: context,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(right: 5),
                            height: 25,
                            width: 25,
                            child: Icon(
                              Icons.remove,
                              color: Colors.red,
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
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '\$ ${cartItemAttribute.price}',
                        style: GoogleFonts.poppins(
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
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      FittedBox(
                        child: Text(
                          '\$' + subTotal.toStringAsFixed(2),
                          style: GoogleFonts.poppins(
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
                        style: GoogleFonts.poppins(
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
                                        id: widget.productId,
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
                                style: GoogleFonts.poppins(
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
