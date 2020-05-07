import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/cart_item.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({Key key, this.cartItem}) : super(key: key);
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final productId = cartItem.product.id;
    return Dismissible(
        key: ValueKey(productId),
        background: Container(
          padding: EdgeInsets.all(10),
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 36,
          ),
          alignment: Alignment.centerRight,
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          cart.removeItem(productId);
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: ListTile(
            leading:
                CircleAvatar(child: Image.network(cartItem.product.imageUrl)),
            title: Text(cartItem.product.title),
            subtitle: Text('Total: \$ ${cartItem.amounts}'),
            trailing: Text('${cartItem.quantity} x'),
          ),
        ));
  }
}
