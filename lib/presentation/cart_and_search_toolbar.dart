import 'package:flutter/material.dart';
import 'cart_button.dart';

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
        CartButton(
          itemCount: 3,
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
        ),
      ]);
}
