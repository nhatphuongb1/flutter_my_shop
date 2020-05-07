import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/app_drawer.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key key, this.product}) : super(key: key);
  static const routeName = '/product-detail';
  final Product product;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    final String productId =
        ModalRoute.of(context).settings.arguments as String;
    final product =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(product.imageUrl),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$ ${product.price}',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                '${product.title}',
                style: TextStyle(fontSize: 20),
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                '${product.description}',
                style: TextStyle(fontSize: 14),
                maxLines: 5,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                alignment: Alignment.center,
                child: FlatButton(
                  disabledColor: Colors.grey,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    cart.addItem(product);
                  },
                  child: Text(
                    'Buy',
                    style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color,
                        fontSize: 16),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
