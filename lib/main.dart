import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/product_overview_screen.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "MyShop - Title",
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.redAccent,
        fontFamily: 'Lato'
      ),
      home: ProductOverviewScreen(),
    );
  }
}  