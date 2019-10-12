import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // ProductDetailScreen(this.title);

  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String; 
        // get the productId by arguments passed in routing
    // by getting the id via arguments, we may fetch product information with the help of product id

    // get the loaded product's data from provider class by passing the selected product's id
    // setting the listen false, because we don't want to rebuild this widget on occuring any change in the provider
    // here we are only interested in getting data, not in getting updates
    final loadedProduct = Provider.of<ProductProvider>(context, listen: false).findById(productId);
 
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
