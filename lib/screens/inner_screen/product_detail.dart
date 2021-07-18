import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/screens/cart/cart.dart';
import 'package:ecommerce/screens/feeds/widget/feeds_product.dart';
import 'package:ecommerce/screens/wishlist/wishlist.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  static const routeName = '/productAttribute';
  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    var size = MediaQuery.of(context).size;
    //productProvider
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final productList = productProvider.products;

    final productId = ModalRoute.of(context)!.settings.arguments as String;
    // print(productId);
    final productAttribute = productProvider.productById(productId);

    //cartProvider
    final cartProvder = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'DETAIL',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(WishList.routeName);
            },
            icon: Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black12),
            height: size.height * 0.48,
            width: double.infinity,
            child:
                Image.network(productAttribute.imageSrc, fit: BoxFit.contain),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 16.0, bottom: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.save,
                              size: 24,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.share,
                              size: 24,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * 0.9,
                              child: Text(
                                productAttribute.title,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '\$ ${productAttribute.price}',
                              style: TextStyle(
                                color: themeProvider.darkTheme
                                    ? Theme.of(context).disabledColor
                                    : Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          productAttribute.description,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 21,
                            color: themeProvider.darkTheme
                                ? Theme.of(context).disabledColor
                                : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      _detail(themeProvider.darkTheme, 'Brand:  ',
                          productAttribute.brand),
                      _detail(themeProvider.darkTheme, 'Quantity:  ',
                          '${productAttribute.quantity} left'),
                      _detail(themeProvider.darkTheme, 'Category:  ',
                          productAttribute.productCategory),
                      _detail(themeProvider.darkTheme, 'Popularity:  ',
                          productAttribute.isPopular ? 'Yes' : 'No'),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      Container(
                        color: Theme.of(context).backgroundColor,
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'No reviews yet',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textSelectionTheme
                                      .selectionColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2),
                              child: Text(
                                'Be the first review!',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: themeProvider.darkTheme
                                      ? Theme.of(context).disabledColor
                                      : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Text(
                    'Suggested products: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  margin: EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 350,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: productList[index],
                        child: FeedsProduct(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        primary: Colors.redAccent.shade400,
                      ),
                      onPressed: () => cartProvder.addItemToCart(
                          productAttribute.id,
                          productAttribute.title,
                          productAttribute.price,
                          productAttribute.imageSrc),
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(fontSize: 16, color: kwhite),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      child: Row(
                        children: [
                          Text(
                            'BUY NOW',
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textSelectionTheme
                                    .selectionColor),
                          ),
                          Icon(
                            Icons.payment,
                            color: Colors.grey,
                            size: 19,
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    color: themeProvider.darkTheme
                        ? Theme.of(context).disabledColor
                        : kSubTitle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _detail(bool themeState, String title, String info) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontWeight: FontWeight.bold,
              fontSize: 21.0,
            ),
          ),
          Text(
            info,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color:
                  themeState ? Theme.of(context).disabledColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
