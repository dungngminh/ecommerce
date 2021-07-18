import 'package:badges/badges.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/screens/inner_screen/product_detail.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularProduct extends StatefulWidget {
  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  bool _isSelect = false;

  changeColor() {
    setState(() {
      _isSelect = !_isSelect;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productAttribute = Provider.of<Product>(context);

    final cartProvider = Provider.of<CartProvider>(context);
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetail.routeName,
          arguments: productAttribute.id),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.network(productAttribute.imageSrc).image,
                        fit: BoxFit.contain),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 7,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: changeColor,
                      child: Icon(
                        Icons.favorite,
                        color: _isSelect ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Badge(
                    //want to change location of badge ? wrap it with Align or Postioned
                    toAnimate: true,
                    animationType: BadgeAnimationType.scale,
                    shape: BadgeShape.square,
                    badgeColor: Colors.deepPurple,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                    ),
                    badgeContent: Text(
                      '\$ ${productAttribute.price}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productAttribute.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kblack,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          productAttribute.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => cartProvider.addItemToCart(
                              productAttribute.id,
                              productAttribute.title,
                              productAttribute.price,
                              productAttribute.imageSrc,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            child: Icon(
                              Icons.add_shopping_cart,
                              size: 25,
                              color: kblack,
                            ),
                          ),
                        ),
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
