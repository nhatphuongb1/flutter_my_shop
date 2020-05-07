import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/providers/order_item.dart';

class OrderListItem extends StatefulWidget {
  final OrderItem order;
  const OrderListItem({Key key, this.order}) : super(key: key);

  @override
  _OrderListItemState createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$ ${widget.order.amount}'),
            subtitle: Text(
                '${DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime)}'),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_more : Icons.expand_less),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height:
                  min(widget.order.products.length.toDouble() * 20 + 20, 180),
              child: ListView(
                children: widget.order.products
                    .map((prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              prod.product.title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$ ${prod.product.price}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                            )
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
