import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem(this.id, this.productId, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.black,
        ),alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: 20),
      ),
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false).removeItem(productId);
      },
      child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: FittedBox(
                    child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text('\$$price'),
                )),
              ),
              title: Text(title),
              subtitle: Text('Total: \$${price * quantity}'),
              trailing: Text('$quantity x'),
            ),
          )),
    );
  }
}
