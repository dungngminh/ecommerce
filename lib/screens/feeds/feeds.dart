import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/screens/feeds/widget/feeds_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/feeds';
  @override
  Widget build(BuildContext context) {
    final popular = ModalRoute.of(context)!.settings.arguments as String? ?? 'all'; // can be null => null = all,
    print(popular);
    final _productProvider = Provider.of<ProductProvider>(context);
    var _listProduct = _productProvider.products;
    if (popular == 'popular') _listProduct = _productProvider.popularProduct;
    print(_listProduct.length);
    return Scaffold(
      appBar: AppBar( 
        title: Text("Feeds"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: _listProduct.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: _listProduct[index],
            child: FeedsProduct(),
          ),
          staggeredTileBuilder: (index) =>
              StaggeredTile.count(2, index.isEven ? 3.6 : 3.8),
          mainAxisSpacing: 7.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}
