import 'package:ecommerce/screens/widget/feeds_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => const FeedsProduct(),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 2.5 : 2.7),
        mainAxisSpacing: 7.0,
        crossAxisSpacing: 5.0,
      ),
    );
  }
}
