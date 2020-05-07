import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart_item.dart';
import 'package:shop_app/providers/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  int get totalItems {
    int count = 0;
    _items.forEach((k, v) => {count += v.quantity});
    return count;
  }

  double get totalAmount {
    double amount = 0;
    _items.forEach((k, v) => {amount += v.amounts});
    return amount;
  }

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  void addItem(Product product) {
    if (!_items.containsKey(product.id)) {
      _items[product.id] = CartItem(product, 1);
    } else {
      _items[product.id].quantity++;
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void updateCartItemTotal(String productId, total) {
    if (_items.containsKey(productId)) {
      _items[productId].quantity = total;
      notifyListeners();
    }
  }

  CartItem getCartItem(String id) {
    return _items[id];
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
