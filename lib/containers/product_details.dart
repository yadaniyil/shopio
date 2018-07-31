import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';
import 'package:shop/models/app_state.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/product_screen.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;

  const ProductDetails({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) {
        return _ViewModel.from(store, product);
      },
      builder: (context, _ViewModel vm) {
        return ProductScreen(
            product: product,
            onAddToFavourites: vm.onAddToFavourites,
            onDeleteFromFavourites: vm.onDeleteFromFavourites,
            favouriteIds: vm.favouriteIds);
      },
    );
  }
}

class _ViewModel {
  final ProductModel product;
  final Function onAddToFavourites;
  final Function onDeleteFromFavourites;
  final List<String> favouriteIds;

  _ViewModel(
      {this.favouriteIds,
      this.product,
      this.onAddToFavourites,
      this.onDeleteFromFavourites});

  static _ViewModel from(Store<AppState> store, ProductModel product) {
    return _ViewModel(
        product: product,
        onAddToFavourites: () {
          store.dispatch(SaveToFavouritesAction(product.id));
        },
        onDeleteFromFavourites: () =>
            store.dispatch(RemoveFromFavouritesAction(product.id)),
        favouriteIds: store.state.favouriteProductsIds);
  }
}
