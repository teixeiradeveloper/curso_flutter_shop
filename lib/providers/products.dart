import 'package:flutter/material.dart';
import './product.dart';
import '../data/dummy_data.dart';

class Products with ChangeNotifier {
//notificador de mudanças

  List<Product> _items = DUMMY_PRODUCTS;

  // bool _showFavoriteOnly = false;

  List<Product> get items =>
      [..._items]; // [..._items] está retornando uma cópia

  List<Product> get favoriteItems {
    return _items
        .where((prod) => prod.isFavorite)
        .toList(); //retornar somente os favoritos
  }

  // List<Product> get items {
  //   if (_showFavoriteOnly) {
  //     return _items
  //         .where((prod) => prod.isFavorite)
  //         .toList(); //retornar somente os favoritos
  //   } else {
  //     return [..._items];
  //   }
  // }

  // void showFavoriteOnly() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showFavoriteAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    _items.add(product);

    notifyListeners();
  }
}
