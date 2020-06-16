import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import './views/products_over_view_screem.dart';
import './utils/app_routes.dart';
import './views/product_detail_screem.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // exemplo de uso provider
    // return CounterProvider(
    //   child: MaterialApp(
    //     title: 'Minha Loja',
    //     theme: ThemeData(
    //       primarySwatch: Colors.purple,
    //       accentColor: Colors.deepOrange,
    //       fontFamily: 'Lato',
    //     ),
    //     home: ProductOverViewScreem(),
    //     routes: {
    //       AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreem(),
    //     },
    //   ),
    // );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverViewScreem(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreem(),
        },
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Minha Loja'),
//       ),
//       body: Center(
//         child: Text('Vamos desenvolver uma loja?'),
//       ),
//     );
//   }
// }
