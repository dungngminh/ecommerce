import 'package:ecommerce/models/favorite_item.dart';
import 'package:ecommerce/provider/wishlist_provider.dart';
import 'package:ecommerce/screens/inner_screen/product_detail.dart';
import 'package:ecommerce/utils/helper_method.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WishListItem extends StatefulWidget {
  final String productId;
  const WishListItem({Key? key, required this.productId}) : super(key: key);

  @override
  _WishListItemState createState() => _WishListItemState();
}

class _WishListItemState extends State<WishListItem> {
  @override
  Widget build(BuildContext context) {
    //attributes and providers
    HelperMethod helperMethod = new HelperMethod();
    final favoriteItem = Provider.of<FavoriteItem>(context);
    final wishlistProvider = Provider.of<WishListProvider>(context);
    print("Wishlist" + widget.productId);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            right: 30,
            bottom: 10,
            top: 10,
            left: 10,
          ),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            elevation: 3,
            child: InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                ProductDetail.routeName,
                arguments: widget.productId,
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: 100,
                      child: Image.network(favoriteItem.imageSrc),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              favoriteItem.title,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '\$${favoriteItem.price}',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        //Remove Button
        Positioned(
          top: 20,
          right: 15,
          child: Container(
            height: 30,
            width: 30,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              padding: EdgeInsets.all(0.0),
              color: Colors.red,
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onPressed: () => helperMethod.showAlertDialog(
                title: 'Remove Favorite Item',
                subtitle: 'Are you sure?',
                callBackFunc: () => wishlistProvider.removeItem(
                  id: widget.productId,
                ),
                context: context,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
