import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/product_item.dart';

import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoritOnly;

  ProductGrid(this.showFavoritOnly);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final products = showFavoritOnly
        ? productsProvider.favoriteItems
        : productsProvider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //defini a quantidade de colunas
        childAspectRatio: 3 / 2, //define a larg e compr
        crossAxisSpacing: 10, //espacamento eixo da linha
        mainAxisSpacing: 10,
      ),
    );
  }
}
