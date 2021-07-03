import 'package:ecommerece/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class FullCart extends StatefulWidget {
  const FullCart({Key? key}) : super(key: key);

  @override
  _FullCartState createState() => _FullCartState();
}

class _FullCartState extends State<FullCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: const Radius.circular(16),
          topRight: const Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://nguyencongpc.vn/photos/17/ASUS-Gaming-ROG-Zephyrus-GA401II-HE019T-4.jpg',
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'adadadadadada',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kblack,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(32),
                        onTap: () {},
                        child: Container(
                          height: 25,
                          width: 25,
                          child: Image(
                            image: Svg(
                              'assets/icons/cross.svg',
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('hello'),
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
