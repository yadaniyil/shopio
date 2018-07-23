import 'package:flutter/material.dart';
import 'package:shop/presentation/cart_and_search_toolbar.dart';

class FavouritesView extends StatefulWidget {
  @override
  _FavouritesViewState createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cartAndSearchToolbar('Favourites', context),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 140.0),
          Icon(Icons.favorite_border, size: 120.0, color: Colors.red),
          SizedBox(height: 40.0),
          Text(
            'You do not have favourite items yet',
            textAlign: TextAlign.center,
            textScaleFactor: 1.2,
          )
        ],
      ),
    );
  }
}
