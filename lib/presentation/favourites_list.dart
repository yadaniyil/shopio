import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/loading_indicator.dart';

class FavouritesList extends StatelessWidget {
  final List<ProductModel> favouriteProducts;
  final bool isLoading;

  FavouritesList(
      {Key key, @required this.favouriteProducts, @required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getBody();
  }

  Widget _getBody() {
    if (isLoading) {
      return LoadingIndicator();
    } else if (favouriteProducts.isEmpty) {
      return _noFavouriteItems;
    } else {
      return _favouriteItems;
    }
  }

  Widget get _noFavouriteItems {
    return ListView(
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
    );
  }

  Widget get _favouriteItems {
    return ListView(
      children: <Widget>[Text('Items')],
    );
  }
}
