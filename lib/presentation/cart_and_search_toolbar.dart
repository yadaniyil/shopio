import 'package:flutter/material.dart';

AppBar cartAndSearchToolbar(
    {String title, BuildContext context, bool implyLeading = false}) {
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
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
        )
      ]);
}
