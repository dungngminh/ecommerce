import 'package:badges/badges.dart';
import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/provider/wishlist_provider.dart';
import 'package:ecommerce/screens/cart/cart.dart';
import 'package:ecommerce/screens/feeds/widget/feeds_product.dart';
import 'package:ecommerce/screens/wishlist/wishlist.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    print("detail" + productId);
    final productAttribute = productProvider.productById(productId);

    //cartProvider
    final cartProvder = Provider.of<CartProvider>(context);

    //wishlistProvider
    final wishListProvider = Provider.of<WishListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: themeProvider.darkTheme ? Colors.white : Colors.black,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        title: Text(
          productAttribute.title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: themeProvider.darkTheme ? Colors.white : Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          Badge(
            badgeColor: Colors.pink,
            animationType: BadgeAnimationType.scale,
            toAnimate: true,
            position: BadgePosition.topEnd(
              top: 6,
              end: 6,
            ),
            badgeContent: Text(
              wishListProvider.getAllFavoriteItems.length.toString(),
              style: GoogleFonts.poppins(
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
          Badge(
            badgeColor: Colors.purpleAccent,
            animationType: BadgeAnimationType.scale,
            toAnimate: true,
            position: BadgePosition.topEnd(
              top: 6,
              end: 6,
            ),
            badgeContent: Text(
              cartProvder.getAllCartItem.length.toString(),
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black12),
            height: size.height * 0.42,
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
                                style: GoogleFonts.poppins(
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
                              style: GoogleFonts.poppins(
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
                          style: GoogleFonts.poppins(
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
                                style: GoogleFonts.poppins(
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
                                style: GoogleFonts.poppins(
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
                    style: GoogleFonts.poppins(
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
                SizedBox(
                  height: 20,
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
                        style: GoogleFonts.poppins(fontSize: 16, color: kwhite),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'BUY NOW',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textSelectionTheme
                                    .selectionColor),
                          ),
                          Icon(
                            Icons.payment,
                            color: Colors.green,
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
                      color: Colors.grey,
                      child: InkWell(
                        onTap: () => wishListProvider.addAndRemoveToWishList(
                          productAttribute.id,
                          productAttribute.title,
                          productAttribute.price,
                          productAttribute.imageSrc,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite,
                            color: wishListProvider.getAllFavoriteItems
                                    .containsKey(productAttribute.id)
                                ? Colors.red
                                : Colors.white,
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
            style: GoogleFonts.poppins(
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontWeight: FontWeight.bold,
              fontSize: 21.0,
            ),
          ),
          Text(
            info,
            style: GoogleFonts.poppins(
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
