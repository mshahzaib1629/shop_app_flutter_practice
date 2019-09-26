import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // telling the flutter that we want to interact with ProductPovider provider in this widget
    final productsData = Provider.of<ProductProvider>(context);
    final productsList = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: productsList.length,
      itemBuilder: (context, index) => ProductItem(
        productsList[index].id,
        productsList[index].title,
        productsList[index].imageUrl,
      ),
      // gridDelegate allows us to define how the grid should be structured
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
