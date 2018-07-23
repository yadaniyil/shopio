import 'package:flutter/material.dart';

AppBar cartAndSearchToolbar(String text, BuildContext context) {
  return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Text(text),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            print('Search action pressed');
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
        )
      ]);
}