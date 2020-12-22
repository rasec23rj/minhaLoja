import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:minhaLoja/providers/product.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get item {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    print("total: ${total}");
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existeItem) => CartItem(
          id: existeItem.id,
          title: existeItem.title,
          quantity: existeItem.quantity + 1,
          price: existeItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          title: product.title,
          price: product.price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
