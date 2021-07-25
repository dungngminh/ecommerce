import 'package:ecommerce/screens/cart/cart.dart';
import 'package:ecommerce/screens/feeds/feeds.dart';
import 'package:ecommerce/screens/user/user_screen.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackdropWidget extends StatelessWidget {
  const BackdropWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: -50,
          left: 140,
          child: Transform.rotate(
            angle: 0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3),
              ),
              height: 150,
              width: 250,
            ),
          ),
        ),
        Positioned(
          top: -50,
          left: 50,
          child: Transform.rotate(
            angle: 0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3),
              ),
              height: 150,
              width: 250,
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 140,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3),
              ),
              height: 150,
              width: 250,
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 20,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3),
              ),
              height: 150,
              width: 250,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: Image.asset('assets/images/cheems.jpg').image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Cheems',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 110, vertical: 20),
                  child: Column(
                    children: [
                      contextNavigator(
                          context, FeedsScreen.routeName, 'Feeds', kFeed),
                      SizedBox(
                        height: 10,
                      ),
                      contextNavigator(
                          context, CartScreen.routeName, 'Cart', kCart),
                      SizedBox(
                        height: 10,
                      ),
                      contextNavigator(
                          context, UserScreen.routeName, 'User', kUser),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  InkWell contextNavigator(
      BuildContext context, String routeName, String content, IconData icon) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            content,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Icon(
            icon,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
