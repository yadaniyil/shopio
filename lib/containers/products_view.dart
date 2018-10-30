import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';
import 'package:shop/models/app_state.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/models/products_filter.dart';
import 'package:shop/presentation/cart_and_search_toolbar.dart';
import 'package:shop/presentation/popular_products_list.dart';
import 'package:shop/presentation/products_list.dart';

class ProductsView extends StatelessWidget {
  final ProductsFilter filter;
  final List<String> filters;

  const ProductsView({Key key, this.filter, this.filters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      onInit: (store) => store.dispatch(LoadProductsAction(filter, filters)),
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Scaffold(
          appBar: cartAndSearchToolbar(
              implyLeading: true, title: filters.first, context: context),
          body: ProductsList(
              isLoading: vm.loading,
              products: vm.products,
              onProductsRefresh: vm.onProductsRefresh),
        );
      },
    );
  }
}

class _ViewModel {
  final bool loading;
  final List<ProductModel> products;
  final Function onProductsRefresh;

  _ViewModel(
      {@required this.loading,
      @required this.products,
      @required this.onProductsRefresh});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        loading: store.state.isProductsLoading,
        products: store.state.products,
        onProductsRefresh: () {
          var action = RefreshProductsAction();
          store.dispatch(action);
          return action.completer.future;
        });
  }
}
