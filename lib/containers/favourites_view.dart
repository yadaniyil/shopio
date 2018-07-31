import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';
import 'package:shop/models/app_state.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/cart_and_search_toolbar.dart';
import 'package:shop/presentation/favourites_list.dart';

class FavouritesView extends StatelessWidget {
  FavouritesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      onInit: (store) => store.dispatch(LoadFavouritesAction()),
      builder: (context, vm) {
        return Scaffold(
          appBar: cartAndSearchToolbar(title: 'Favourites', context: context),
          body: FavouritesList(
              favouriteProducts: vm.favouriteProducts, isLoading: vm.isLoading),
        );
      },
    );
  }
}

class _ViewModel {
  final bool isLoading;
  final List<ProductModel> favouriteProducts;

  _ViewModel({@required this.isLoading, @required this.favouriteProducts});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        isLoading: store.state.isFavouritesLoading,
        favouriteProducts: store.state.favouriteProducts);
  }
}
