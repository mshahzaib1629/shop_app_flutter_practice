import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import '../providers/product_provider.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {

  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<ProductProvider>(context);
    // showFavs is boolean value received from product_overview_screen, 
    // it determines which filter shoud be applied on the products list
    final productsList = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: productsList.length,
      
      
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
