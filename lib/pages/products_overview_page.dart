import 'package:flutter/material.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/badge_widget.dart';
import 'package:shop_app/widgets/product_grid.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewPage extends StatefulWidget {
  static const routeName = "/";
  @override
  _ProductsOverviewPageState createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  var showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Shop'),
          actions: <Widget>[
            Badge(),
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  {
                    if (selectedValue == FilterOptions.Favorites) {
                      showFavoritesOnly = true;
                    } else {
                      showFavoritesOnly = false;
                    }
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.Favorites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                ),
              ],
            )
          ],
        ),
        drawer: AppDrawer(),
        body: ProductsGrid(showFavoritesOnly: showFavoritesOnly));
  }
}
