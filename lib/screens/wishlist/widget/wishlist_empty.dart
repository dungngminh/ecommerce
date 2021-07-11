import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmptyWishlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //property
    final themeChange = Provider.of<DarkThemeProvider>(context);
    var size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(
                top: 200,
                bottom: 25,
                right: 25,
              ),
              width: size.width * 0.3,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(
                    'assets/images/empty-cart.png',
                  ).image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Text(
            'Your Wishlist Is Empty',
            style: TextStyle(
              color: themeChange.darkTheme
                  ? Theme.of(context).textSelectionTheme.selectionColor
                  : Colors.black87,
              fontSize: 34,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: size.width * 0.5,
            height: size.height * 0.05,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Add a wish'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
