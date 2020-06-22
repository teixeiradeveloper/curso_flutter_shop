import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
    @required this.productId,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingItem) => CartItem(
          productId: product.id,
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
                productId: product.id,
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

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
