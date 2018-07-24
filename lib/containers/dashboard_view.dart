import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';
import 'package:shop/models/app_state.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/cart_and_search_toolbar.dart';
import 'package:shop/presentation/popular_products_list.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Scaffold(
          appBar: cartAndSearchToolbar(title: 'Popular now', context: context),
          body: PopularProductsList(
              popularProducts: vm.popularProducts,
              onPopularProductsRefresh: vm.onPopularProductsRefresh),
        );
      },
    );
  }
}

class _ViewModel {
  final bool loading;
  final List<ProductModel> popularProducts;
  final Function onPopularProductsRefresh;

  _ViewModel(
      {@required this.loading,
      @required this.popularProducts,
      @required this.onPopularProductsRefresh});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        loading: store.state.isLoading,
        popularProducts: store.state.popularProducts,
        onPopularProductsRefresh: () {
          var action = RefreshPopularProductsAction();
          store.dispatch(action);
          return action.completer.future;
        });
  }
}
