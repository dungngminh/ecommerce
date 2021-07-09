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
      'name': 'Books',
      'imageSrc': 'assets/images/image_categories/books.jpg',
    },
    {
      'name': 'Home Appliances',
      'imageSrc': 'assets/images/image_categories/appliances.png',
    },
    {
      'name': 'Kids',
      'imageSrc': 'assets/images/image_categories/kids.jpg',
    },
    {
      'name': 'Entertainment',
      'imageSrc': 'assets/images/image_categories/entertainment.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      child: Stack(
        children: [
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
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 150,
          ),
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
        ],
      ),
    );
  }
}
