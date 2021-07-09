import 'package:ecommerce/screens/inner_screen/brand_navigator_rail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CustomSwiper extends StatelessWidget {
  const CustomSwiper({
    Key? key,
    required this.size,
    required List<String> listBrand,
  })  : _listBrand = listBrand,
        super(key: key);

  final Size size;
  final List<String> _listBrand;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 200,
      width: size.width,
      child: Swiper(
        autoplay: true,
        onTap: (index) {
          Navigator.of(context).pushNamed(
            BrandNavigationRailScreen.routeName,
            arguments: {
              index,
            },
          );
        },
        itemCount: _listBrand.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16,
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Image.asset(
                      _listBrand[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          );
        },
        layout: SwiperLayout.STACK,
        itemWidth: size.width,
      ),
    );
  }
}
