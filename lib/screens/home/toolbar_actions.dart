import 'package:flutter/material.dart';

getToolbarActions(BuildContext context) {
  return <Widget>[
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
  ];
}
