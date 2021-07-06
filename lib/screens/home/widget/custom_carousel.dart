import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({
    Key? key,
    required this.size,
    required List<String> listImage,
  })  : _listImage = listImage,
        super(key: key);

  final Size size;
  final List<String> _listImage;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 280,
        aspectRatio: size.height / size.width,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.decelerate,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: _listImage.map(
        (image) {
          return Builder(
            builder: (BuildContext context) {
              return Image.asset(
                image, // image
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              );
            },
          );
        },
      ).toList(),
    );
  }
}
