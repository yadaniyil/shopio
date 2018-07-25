import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shop/models/app_state.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/presentation/cart_and_search_toolbar.dart';
import 'package:shop/presentation/categories_list.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Scaffold(
          appBar: cartAndSearchToolbar(title: 'Categories', context: context),
          body: CategoriesList(categories: vm.categories),
        );
      },
    );
  }
}

class _ViewModel {
  final bool isLoading;
  final List<CategoryModel> categories;

  _ViewModel({@required this.isLoading, @required this.categories});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        isLoading: store.state.isInitialLoading, categories: store.state.categories);
  }
}
