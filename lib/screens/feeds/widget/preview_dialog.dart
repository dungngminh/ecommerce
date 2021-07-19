import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/provider/wishlist_provider.dart';
import 'package:ecommerce/screens/inner_screen/product_detail.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreviewDialog extends StatelessWidget {
  final String productId;
  const PreviewDialog({required this.productId});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productData = productProvider.productById(productId);

    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistProvider = Provider.of<WishListProvider>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            constraints: BoxConstraints(
                minHeight: 100,
                maxHeight: MediaQuery.of(context).size.height * 0.5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Image.network(
              productData.imageSrc,
            ),
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: dialogContent(
                    context,
                    0,
                    () => wishlistProvider.addAndRemoveToWishList(
                        productId,
                        productData.title,
                        productData.price,
                        productData.imageSrc),
                  ),
                ),
                Flexible(
                  child: dialogContent(
                    context,
                    1,
                    () {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                        context,
                        ProductDetail.routeName,
                        arguments: productId,
                      );
                    },
                  ),
                ),
                Flexible(
                  child: dialogContent(
                    context,
                    2,
                    !cartProvider.getAllCartItem.containsKey(productId)
                        ? () => cartProvider.addItemToCart(
                            productId,
                            productData.title,
                            productData.price,
                            productData.imageSrc)
                        : () {},
                  ),
                ),
              ],
            ),
          ),

          /************close****************/
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.3),
                shape: BoxShape.circle),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.grey,
                onTap: () =>
                    Navigator.canPop(context) ? Navigator.pop(context) : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.close, size: 28, color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget dialogContent(BuildContext context, int index, Function() function) {
    final cartProvider = Provider.of<CartProvider>(context);
    final wishlistProvider = Provider.of<WishListProvider>(context);
    List<IconData> _dialogIcons = [
      wishlistProvider.getAllFavoriteItems.containsKey(productId)
          ? Icons.favorite
          : Icons.favorite_border,
      Icons.preview,
      kCart,
      kDelete,
    ];

    List<String> _texts = [
      wishlistProvider.getAllFavoriteItems.containsKey(productId)
          ? 'In wishlist'
          : 'Add to wishlist',
      'View product',
      cartProvider.getAllCartItem.containsKey(productId)
          ? 'In Cart '
          : 'Add to cart',
    ];
    List<Color> _colors = [
      wishlistProvider.getAllFavoriteItems.containsKey(productId)
          ? Colors.red
          : Theme.of(context).textSelectionTheme.selectionColor!,
      Theme.of(context).textSelectionTheme.selectionColor!,
      Theme.of(context).textSelectionTheme.selectionColor!,
    ];
    return FittedBox(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: function,
          splashColor: Colors.grey,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            padding: EdgeInsets.all(4),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        offset: const Offset(0.0, 5.0),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    // inkwell color
                    child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          _dialogIcons[index],
                          color: _colors[index],
                          size: 25,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FittedBox(
                    child: Text(
                      _texts[index],
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        //  fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
