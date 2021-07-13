import 'package:ecommerce/screens/feeds/feedsByCate.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({required int index}) : _index = index;

  final int _index;
  final List<Map<String, Object>> _categories = [
    {
      'name': 'Phone & Gadgets',
      'imageSrc': 'assets/images/image_categories/phones.jpg',
    },
    {
      'name': 'Fashion',
      'imageSrc': 'assets/images/image_categories/fashion.jpg',
    },
    {
      'name': 'Beauty',
      'imageSrc': 'assets/images/image_categories/beauty.png',
    },
    {
      'name': 'Watches',
      'imageSrc': 'assets/images/image_categories/watch.jpg',
    },
    {
      'name': 'Laptop',
      'imageSrc': 'assets/images/image_categories/laptop.jpg',
    },
    {
      'name': 'Furniture',
      'imageSrc': 'assets/images/image_categories/furniture.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('${_categories[_index]['name']}');
        Navigator.of(context).pushNamed(FeedsByCategoryScreen.routeName,
            arguments: '${_categories[_index]['name']}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  _categories[_index]['name'] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Theme.of(context).textSelectionTheme.selectionColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white,
                image: DecorationImage(
                  image: Image.asset(
                    _categories[_index]['imageSrc'] as String,
                    fit: BoxFit.fill,
                  ).image,
                ),
              ),
              // margin: EdgeInsets.symmetric(horizontal: 10),
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
