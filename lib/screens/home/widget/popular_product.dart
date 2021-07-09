import 'package:badges/badges.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';

class PopularProduct extends StatefulWidget {
  final int _index;
  PopularProduct({required int index}) : _index = index;
  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  bool _isSelect = false;

  changeColor() {
    setState(() {
      _isSelect = !_isSelect;
    });
  }

  final List<String> _listImage = [
    'assets/images/image_demo/g14.jpg',
    'assets/images/image_demo/g15.png',
    'assets/images/image_demo/g17.jpg',
    'assets/images/image_demo/m15.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset(_listImage[widget._index]).image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 7,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: changeColor,
                    child: Icon(
                      Icons.favorite,
                      color: _isSelect ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Badge(
                  //want to change location of badge ? wrap it with Align or Postioned
                  toAnimate: true,
                  animationType: BadgeAnimationType.scale,
                  shape: BadgeShape.square,
                  badgeColor: Colors.deepPurple,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                  ),
                  badgeContent: const Text(
                    '\$ 1200',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kblack,
                  ),
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Description',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 25,
                          color: kblack,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
