import 'dart:async';

import 'package:shop/models/app_tab.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/models/product_model.dart';

class InitialLoadAction {}

// region Load Popular Product
class PopularProductsNotLoadedAction {}

class PopularProductsLoadedAction {
  final List<ProductModel> popularProducts;

  PopularProductsLoadedAction(this.popularProducts);

  @override
  String toString() {
    return 'PopularProductsLoadedAction{popularProducts: $popularProducts}';
  }
}
// endregion Load Popular Product

// region Refresh Popular Product
class RefreshPopularProductsAction {
  final Completer<Null> completer;

  RefreshPopularProductsAction({Completer completer})
      : this.completer = completer ?? Completer<Null>();
}

class PopularProductsRefreshedAction {
  final List<ProductModel> popularProducts;

  PopularProductsRefreshedAction(this.popularProducts);

  @override
  String toString() {
    return 'PopularProductsRefreshedAction{popularProducts: $popularProducts}';
  }
}

class PopularProductsNotRefreshedAction {}
// endregion Refresh Popular Product

// region Bottom Bar Tabs
class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);

  @override
  String toString() {
    return 'UpdateTabAction{newTab: $newTab}';
  }
}
// endregion Bottom Bar Tabs

// region Categories
class LoadCategoriesAction {}

class CategoriesLoadedAction {
  final List<CategoryModel> categories;

  CategoriesLoadedAction(this.categories);

  @override
  String toString() {
    return 'CategoriesLoadedAction{categories: $categories}';
  }
}

class CategoriesNotLoadedAction {}
// endregion Categories
