import 'package:flutter/material.dart';
import '../providers/product.dart';
// import '../providers/counter_provider.dart';

class ProductDetailScreem extends StatefulWidget {
  ProductDetailScreem();

  @override
  _ProductDetailScreemState createState() => _ProductDetailScreemState();
}

class _ProductDetailScreemState extends State<ProductDetailScreem> {
  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context).settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      // body: Column( // aqui um exemplo do uso do provider
      //   children: <Widget>[
      //     Text(CounterProvider.of(context).state.value.toString()),
      //     RaisedButton(
      //       child: Text('+'),
      //       onPressed: () {
      //         setState(() {
      //           // context
      //           //     .dependOnInheritedWidgetOfExactType<CounterProvider>()
      //           //     .state
      //           //     .inc();
      //           CounterProvider.of(context).state.inc();
      //         });
      //         print(CounterProvider.of(context).state.value);
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}
