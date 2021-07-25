import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/provider/wishlist_provider.dart';
import 'package:ecommerce/screens/authen/public/plc_signup_screen.dart';
import 'package:ecommerce/screens/authen/seller/slr_login_screen.dart';
import 'package:ecommerce/screens/authen/seller/slr_signup_screen.dart';
import 'package:ecommerce/screens/cart/cart.dart';
import 'package:ecommerce/screens/feeds/feeds.dart';
import 'package:ecommerce/screens/feeds/feedsByCate.dart';
import 'package:ecommerce/screens/init.dart';
import 'package:ecommerce/screens/inner_screen/brand_navigator_rail.dart';
import 'package:ecommerce/screens/inner_screen/product_detail.dart';
import 'package:ecommerce/screens/authen/public/plc_login_screen.dart';
import 'package:ecommerce/screens/main_screen/main_screen.dart';
import 'package:ecommerce/screens/user/user_screen.dart';
import 'package:ecommerce/screens/welcome/welcome.dart';
import 'package:ecommerce/screens/wishlist/wishlist.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider _themeProvider = DarkThemeProvider();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  Future getCurrentAppTheme() async {
    _themeProvider.darkTheme = await _themeProvider.setting.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error',
                    style: GoogleFonts.poppins(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.error,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          );
        }
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => _themeProvider,
            ),
            ChangeNotifierProvider(
              create: (_) => ProductProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => CartProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => WishListProvider(),
            ),
          ],
          child: Consumer<DarkThemeProvider>(
            builder: (context, theme, child) {
              return MaterialApp(
                title: "Ecommerce",
                theme: themeData(theme.darkTheme, context),
                debugShowCheckedModeBanner: false,
                initialRoute: InitState.routeName,
                routes: {
                  InitState.routeName: (context) => InitState(),
                  WelcomeScreen.routeName: (context) => WelcomeScreen(),
                  PublicLoginScreen.routeName: (context) => PublicLoginScreen(),
                  PublicSignUpScreen.routeName: (context) =>
                      PublicSignUpScreen(),
                  SellerLoginScreen.routeName: (context) => SellerLoginScreen(),
                  SellerSignUpScreen.routeName: (context) =>
                      SellerSignUpScreen(),
                  BrandNavigationRailScreen.routeName: (context) =>
                      BrandNavigationRailScreen(),
                  MainScreen.routeName: (context) => MainScreen(),
                  FeedsScreen.routeName: (context) => FeedsScreen(),
                  WishList.routeName: (context) => WishList(),
                  CartScreen.routeName: (context) => CartScreen(),
                  UserScreen.routeName: (context) => UserScreen(),
                  ProductDetail.routeName: (context) => ProductDetail(),
                  FeedsByCategoryScreen.routeName: (context) =>
                      FeedsByCategoryScreen(),
                },
              );
            },
          ),
        );
      },
    );
  }
}
