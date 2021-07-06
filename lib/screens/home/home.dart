import 'package:backdrop/backdrop.dart';
import 'package:ecommerce/screens/home/widget/custom_carousel.dart';
import 'package:ecommerce/screens/home/widget/custom_swiper.dart';
import 'package:ecommerce/widget/inkwel_custom.dart';
import 'package:flutter/material.dart';

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
          IconButton(
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
        ],
      ),
      backLayer: Center(
        child: Text("Information"),
      ),
      frontLayer: Column(
        children: [
          CustomCarousel(size: size, listImage: _listImage),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Brands',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Theme.of(context).textSelectionTheme.selectionColor,
                  ),
                ),
                customInkWel(
                  onTap: () {},
                  child: Text(
                    'View more...',
                    style: TextStyle(
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
        ],
      ),
    );
  }
}
