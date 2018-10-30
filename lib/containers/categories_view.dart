import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';
import 'package:shop/models/app_state.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/presentation/areas_list.dart';
import 'package:shop/presentation/cart_and_search_toolbar.dart';
import 'package:shop/presentation/categories_list.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: cartAndSearchToolbar(
                title: 'Categories',
                context: context,
                tabs: [
                  Tab(text: 'Meals'),
                  Tab(text: 'Countries'),
                ]),
            body: TabBarView(
              children: [
                CategoriesList(
                    isLoading: vm.isLoading,
                    categories: vm.categories,
                    clearProducts: vm.clearProducts),
                AreasList(
                    isLoading: vm.isLoading,
                    areas: vm.areas,
                    clearProducts: vm.clearProducts)
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final bool isLoading;
  final List<CategoryModel> categories;
  final List<String> areas;
  final Function clearProducts;

  _ViewModel(
      {@required this.isLoading,
      @required this.categories,
      @required this.areas,
      @required this.clearProducts});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        isLoading: store.state.isInitialLoading,
        categories: store.state.categories,
        areas: store.state.areas,
        clearProducts: () => store.dispatch(ClearProductsAction()));
  }
}
