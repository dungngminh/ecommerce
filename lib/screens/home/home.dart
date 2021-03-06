import 'package:backdrop/backdrop.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/screens/feeds/feeds.dart';
import 'package:ecommerce/screens/home/widget/backdrop.dart';
import 'package:ecommerce/screens/home/widget/category.dart';
import 'package:ecommerce/screens/home/widget/custom_carousel.dart';
import 'package:ecommerce/screens/home/widget/custom_swiper.dart';
import 'package:ecommerce/screens/home/widget/popular_product.dart';
import 'package:ecommerce/widget/inkwel_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _listImage = [
    'assets/images/image_demo/g14.jpg',
    'assets/images/image_demo/g15.png',
    'assets/images/image_demo/g17.jpg',
    'assets/images/image_demo/m15.jpg',
  ];

  List<String> _listBrand = [
    'assets/images/image_brand/acer.png',
    'assets/images/image_brand/asus.png',
    'assets/images/image_brand/apple.png',
    'assets/images/image_brand/dell.png',
    'assets/images/image_brand/hp.png',
    'assets/images/image_brand/razer.png',
    'assets/images/image_brand/surface.png',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final popularProductList = productProvider.popularProduct;
    return BackdropScaffold(
      //want to change radius ?, let's Override frontLayerBorderRadius : default Pub is 16
      frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      headerHeight: size.height * 0.1,
      appBar: BackdropAppBar(
        title: Text("Home"),
        leading: BackdropToggleButton(
          icon: AnimatedIcons.menu_home,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.transparent,
                  backgroundImage: Image.asset('assets/images/icon.png').image,
                ),
              ),
            ),
          ),
        ],
      ),
      backLayer: BackdropWidget(),
      frontLayer: SingleChildScrollView(
        child: Column(
          children: [
            CustomCarousel(size: size, listImage: _listImage),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color:
                          Theme.of(context).textSelectionTheme.selectionColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 180,
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ListView.separated(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryWidget(index: index);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 20,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 16, left: 16, top: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Brands',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color:
                          Theme.of(context).textSelectionTheme.selectionColor,
                    ),
                  ),
                  customInkWel(
                    onTap: () {},
                    child: Text(
                      'View more...',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomSwiper(size: size, listBrand: _listBrand),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 14, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Product',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color:
                          Theme.of(context).textSelectionTheme.selectionColor,
                    ),
                  ),
                  customInkWel(
                    onTap: () => Navigator.of(context)
                        .pushNamed(FeedsScreen.routeName, arguments: 'popular'),
                    child: Text(
                      'View more...',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 250,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                itemCount: popularProductList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: popularProductList[index],
                    child: PopularProduct(),
                  );
                },
                separatorBuilder: (context, index) {
                  //Spacing item in listview
                  return SizedBox(
                    width: 20,
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
