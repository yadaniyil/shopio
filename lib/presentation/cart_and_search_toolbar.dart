import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:shop/containers/cart_quantity.dart';

AppBar cartAndSearchToolbar(
    {String title,
    BuildContext context,
    bool implyLeading = false}) {
  return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: implyLeading,
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            print('Search action pressed');
          },
        ),
        CartQuantity(
          builder: (BuildContext context, int cartQuantity) {
            return BadgeIconButton(
              itemCount: cartQuantity,
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed('/cart');
              },
            );
          },
        ),
      ]);
}
