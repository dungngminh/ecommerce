import 'package:ecommerce/provider/dark_theme_provider.dart';
import 'package:ecommerce/screens/cart/cart.dart';
import 'package:ecommerce/screens/feeds/feeds.dart';
import 'package:ecommerce/screens/inner_screen/brand_navigator_rail.dart';
import 'package:ecommerce/screens/user/user.dart';
import 'package:ecommerce/screens/wishlist/wishlist.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:ecommerce/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  Future getCurrentAppTheme() async {
    themeProvider.darkTheme = await themeProvider.setting.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => themeProvider,
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, theme, child) {
          return MaterialApp(
            title: "Ecommerce",
            theme: themeData(theme.darkTheme, context),
            debugShowCheckedModeBanner: false,
            home: BottomBarScreen(),
            routes: {
              BrandNavigationRailScreen.routeName: (context) =>
                  BrandNavigationRailScreen(),
              FeedsScreen.routeName: (context) => FeedsScreen(),
              WishList.routeName: (context) => WishList(),
              CartScreen.routeName: (context) => CartScreen(),
              UserScreen.routeName: (context) => UserScreen(),
            },
          );
        },
      ),
    );
  }
}
