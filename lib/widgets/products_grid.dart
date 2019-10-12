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
      
      // We shoud use ".value" approach if we are using provider on something that's part of a list or a grid 
      // because widgets are recycled by flutter, but the data that is attached to the widget changes. 
      // When using changeNotifierProvider.value, we actually make sures that provider works even if data changes 
      // for the widget.
      // If we use builder function here, it'll not work correctly bcz now the provider is tied to its data and 
      // is attached/detached to/from the widget instead of changing data being attached to the same provider.
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        
        // using the current product to make its ChangeNotifier:
        value: productsList[index],
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
