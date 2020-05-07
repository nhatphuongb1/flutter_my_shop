import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/providers/cart.dart';

class Badge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
        child: Row(
      children: <Widget>[
        Consumer<Cart>(
          builder: (ctx, cart, _) => Text('${cart.totalItems} items'),
        ),
        IconButton(
          icon: Icon(Icons.shopping_basket),
          onPressed: () {
            Navigator.of(context).pushNamed(CartPage.routeName);
          },
        ),
      ],
    ));
  }
}
