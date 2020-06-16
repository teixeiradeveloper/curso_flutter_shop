import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/widgets/badge.dart';
import '../widgets/product_grid.dart';

enum FilterOption { Favorite, All }

class ProductOverViewScreem extends StatefulWidget {
  @override
  _ProductOverViewScreemState createState() => _ProductOverViewScreemState();
}

class _ProductOverViewScreemState extends State<ProductOverViewScreem> {
  bool _showFavoritOnly = false;

  @override
  Widget build(BuildContext context) {
    // final List<Product> loadedProducts = Provider.of<Products>(context).items;
    // final Products products = Provider.of(context); // aqui se é para contralar a marcacao do favorito em outra pagina

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha loja'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              setState(() {
                if (selectedValue == FilterOption.Favorite) {
                  // products.showFavoriteOnly();
                  _showFavoritOnly = true;
                } else {
                  // products.showFavoriteAll();
                  _showFavoritOnly = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente favoritos'),
                value: FilterOption.Favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOption.All,
              )
            ],
          ),
          Consumer<Cart>(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            builder: (_, cart, child) => Badge(
              value: cart.itemCount.toString(),
              child:
                  child, //aqui está informando para que o child não sofra alterações no widget
            ),
          ),
        ],
      ),
      body: ProductGrid(_showFavoritOnly),
    );
  }
}
