import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get item {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingItem) => CartItem(
          id: existingItem.id,
          price: existingItem.price,
          quantity: existingItem.quantity + 1,
          title: existingItem.title,
        ),
      );
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
                id: Random().nextDouble().toString(),
                price: product.price,
                quantity: 1,
                title: product.title,
              ));
    }

    notifyListeners();

    // if (_items.containsKey(product.id)) {
    //   _items.update(product.id, (existingItem) {
    //     return CartItem(
    //       id: existingItem.id,
    //       price: existingItem.price,
    //       quantity: existingItem.quantity + 1,
    //       title: existingItem.title,
    //     );
    //   });
    // }
  }
}
