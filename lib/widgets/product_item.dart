import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../utils/app_routes.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  ProductItem();

  @override
  Widget build(BuildContext context) {
    // notificar sempre que houver uma mudanca, listen: sempre continuar ouvindo
    final Product product = Provider.of<Product>(context, listen: false);
    final Cart cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments: product,
            );
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (ctx) => ProductDetailScreem(product),
            //   ),
            // );
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.toggleFavorite();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItem(product);
              // print(cart.itemCount);
            },
          ),
        ),
      ),
    );

    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(10),
    //   child: GridTile(
    //     child: GestureDetector(
    //       child: Image.network(
    //         product.imageUrl,
    //         fit: BoxFit.cover,
    //       ),
    //       onTap: () {
    //         Navigator.of(context).pushNamed(
    //           AppRoutes.PRODUCT_DETAIL,
    //           arguments: product,
    //         );
    //         // Navigator.of(context).push(
    //         //   MaterialPageRoute(
    //         //     builder: (ctx) => ProductDetailScreem(product),
    //         //   ),
    //         // );
    //       },
    //     ),
    //     footer: GridTileBar(
    //       backgroundColor: Colors.black87,
    //       leading: IconButton(
    //         icon: Icon(
    //             product.isFavorite ? Icons.favorite : Icons.favorite_border),
    //         color: Theme.of(context).accentColor,
    //         onPressed: () {
    //           product.toggleFavorite();
    //         },
    //       ),
    //       title: Text(
    //         product.title,
    //         textAlign: TextAlign.center,
    //       ),
    //       trailing: IconButton(
    //         icon: Icon(Icons.shopping_cart),
    //         color: Theme.of(context).accentColor,
    //         onPressed: () {},
    //       ),
    //     ),
    //   ),
    // );
  }
}
