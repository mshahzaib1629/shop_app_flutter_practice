import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_provider.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/product_overview_screen.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wraping the whole app in ChangeNotifierProvider; it allows us to register a class which we can listen in child
    // widgets whenever this class updates
    return ChangeNotifierProvider(
      builder: (context) => ProductProvider(),
      child: MaterialApp(
        title: "MyShop - Title",
        theme: ThemeData(
            primaryColor: Colors.purple,
            accentColor: Colors.redAccent,
            fontFamily: 'Lato'),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
