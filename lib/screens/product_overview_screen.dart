import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product_provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/badge.dart';
import '../widgets/products_grid.dart';

import '../providers/product.dart';
import '../widgets/app_drawer.dart';

// defineing enum values for displaying items
enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  Widget build(BuildContext context) {
    final productsContainer =
        Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        actions: <Widget>[
          Consumer<CartProvider>(
            // here we passed the IconButon to child of the Consumer because we don't want it to rebuild it.
            // And we passed its reference to the Badge (widget) via using ch. ch is automatically considered as
            // the child widget of the Comsumer
            builder: (context, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              // on clicking these items, they generate specific values, as defined value.
              // These values are then processed in the onSelected (property present in same widget)
              PopupMenuItem(
                  child: Text("Only Favorites"),
                  value: FilterOptions.Favorites),
              PopupMenuItem(
                child: Text("Show All"),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
