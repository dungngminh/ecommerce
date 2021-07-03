import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //property
    final themeChange = Provider.of<DarkThemeProvider>(context);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 200,
                bottom: 25,
              ),
              width: size.width * 0.5,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Svg(
                    'assets/images/empty-cart.svg',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              'Your Cart Is Empty',
              style: TextStyle(
                color: themeChange.darkTheme
                    ? Theme.of(context).textSelectionTheme.selectionColor
                    : Colors.black87,
                fontSize: 36,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: size.width * 0.8,
              height: size.height * 0.05,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Shop now'.toUpperCase(),
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
      ),
    );
  }
}
