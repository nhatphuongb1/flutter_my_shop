import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/products_overview_page.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/order_list_item.dart';

class OrdersPage extends StatelessWidget {
  static const routeName = "orders";

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Page'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: ordersData.orders.length,
          itemBuilder: (ctx, i) => OrderListItem(
                order: ordersData.orders[i],
              )),
    );
  }
}
