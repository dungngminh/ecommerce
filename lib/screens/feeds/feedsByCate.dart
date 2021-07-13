import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/screens/feeds/widget/feeds_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class FeedsByCategoryScreen extends StatelessWidget {
  static const routeName = '/feedsByCate';
  @override
  Widget build(BuildContext context) {
    final _productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final categoryName = ModalRoute.of(context)!.settings.arguments as String;

    final productList = _productProvider.productByCategory(categoryName);
    return Scaffold(
      appBar: AppBar(
        title: Text("Feeds"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: productList.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: productList[index],
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
