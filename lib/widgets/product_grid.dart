import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/product_grid_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavoritesOnly;

  const ProductsGrid({Key key, @required this.showFavoritesOnly})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showFavoritesOnly ? productsData.favoriteItems() : productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(8),
      itemCount: products.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductGridItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8),
    );
  }
}
