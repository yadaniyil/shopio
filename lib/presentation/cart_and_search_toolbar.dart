import 'package:flutter/material.dart';
import 'package:badges/badges.dart';



AppBar cartAndSearchToolbar(
    {String title,
    BuildContext context,
    bool implyLeading = false,
    int cartProductsQuantity = 0}) {
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
        BadgeIconButton(
          itemCount: cartProductsQuantity,
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
        ),
      ]);
}
