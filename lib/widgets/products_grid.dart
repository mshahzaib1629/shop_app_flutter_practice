import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<ProductProvider>(context);
    final productsList = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: productsList.length,
      // Using ChangeNotifierProvider in products_grid.dart file also to use Product (model) as Provider here, we are 
      // taking products as separate single products so that they can be dealt as single instance in this changeNotifierListener
      itemBuilder: (context, index) => ChangeNotifierProvider(
        
        // using the current product to make its ChangeNotifier:
        builder: (context) => productsList[index],
        child: ProductItem(
        // productsList[index].id,
        // productsList[index].title,
        // productsList[index].imageUrl,
      ),
      ),
      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
