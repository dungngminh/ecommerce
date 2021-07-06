import 'package:backdrop/backdrop.dart';
import 'package:ecommerce/utils/constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BackdropScaffold(
      //Override frontLayerBorderRadius : default Pub is 16
      // frontLayerBorderRadius: BorderRadius.only(
      //   topLeft: Radius.circular(0),
      //   topRight: Radius.circular(0),
      // ),
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
      frontLayer: Center(
        child: Text("MainScreen"),
      ),
    );
  }
}
