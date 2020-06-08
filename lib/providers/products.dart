import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/dummy_data.dart';

class Products with ChangeNotifier {
//notificador de mudanças

  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items =>
      [..._items]; // [..._items] está retornando uma cópia

  void addProduct(Product product) {
    _items.add(product);

    notifyListeners();
  }
}
