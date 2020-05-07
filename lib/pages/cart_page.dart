import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/cart_list_item.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final order = Provider.of<Orders>(context);
    final items = cart.items.values.toList();
    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping Cart"),
        ),
        drawer: AppDrawer(),
        body: Container(
          child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Total:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Consumer<Cart>(
                        builder: (context, item, _) => Text(
                          '\$ ${cart.totalAmount}',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .title
                                  .color),
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                      child: Text(
                        'ORDER NOW',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        order.addOrder(
                            cart.items.values.toList(), cart.totalAmount);
                        cart.clear();
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) => CartListItem(
                            cartItem: items[index],
                          )))
            ],
          ),
        ));
  }
}
