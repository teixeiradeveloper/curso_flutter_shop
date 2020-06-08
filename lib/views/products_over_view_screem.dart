import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/product_item.dart';

class ProductOverViewScreem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final List<Product> loadedProducts = Provider.of<Products>(context).items;
    final productsProvider = Provider.of<Products>(context);
    final products = productsProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha loja'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ProductItem(products[i]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //defini a quantidade de colunas
          childAspectRatio: 3 / 2, //define a larg e compr
          crossAxisSpacing: 10, //espacamento eixo da linha
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
