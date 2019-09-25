import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // ProductDetailScreen(this.title);

  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {

    final productId = ModalRoute.of(context).settings.arguments as String; // get the productId by arguments passed in routing
    // by getting the id via arguments, we may fetch product information with the help of product id
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
