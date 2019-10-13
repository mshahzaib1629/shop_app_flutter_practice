import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    
  // we are setting listen: false in the provider because we are not interested in listening state updates 
  // and rebuild the whole widget. We only want to listen it on FavoriteIcon, so we are using Consumer there 
  // to listen the state at that particular piece of the widget
  // In this way we can enhance the app performance by avoiding unnecessary rebuilds
    final product = Provider.of<Product>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,

          // using Consumer here because only here we are interested in listening the 
          // state updates in current widget
          leading: Consumer<Product>(
            builder: (context, product, child) => IconButton(
              // here the child argument in builder represents the widget under Consumer 
              // body which we don't want to rebuild (it'll be helpful in complex widget tree)
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
            // for example:
            child: Text('This Text will not Rebuild'),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
