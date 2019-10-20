import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_provider.dart';
import '../widgets/products_grid.dart';

import '../providers/product.dart';

// defineing enum values for displaying items
enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatelessWidget {
  

  Widget build(BuildContext context) {

    final productsContainer = Provider.of<ProductProvider>(context, listen: false);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue){
              if(selectedValue == FilterOptions.Favorites){
                productsContainer.showFavoriteOnly();
              }else{
                productsContainer.showAll();
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              // on clicking these items, they generate specific values, as defined value. These values are then processed in the onSelected (property present in same widget)
              PopupMenuItem(child: Text("Only Favorites"), value: FilterOptions.Favorites),
              PopupMenuItem(child: Text("Show All"), value: FilterOptions.All)
            ],
          ),
        ],
      ),
      body: ProductsGrid(),
    );
  }
}