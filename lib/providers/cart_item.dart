import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';

class CartItem with ChangeNotifier {
  Product product;
  int quantity;
  CartItem(this.product, this.quantity);

  double get amounts {
    return product.price * quantity;
  }

  bool isEquals(String productId) {
    return product.id == productId;
  }
}
