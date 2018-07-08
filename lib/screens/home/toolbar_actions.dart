import 'package:flutter/material.dart';

getToolbarActions() {
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
        print('Tune action pressed');
      },
    )
  ];
}
