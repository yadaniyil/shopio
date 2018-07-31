import 'dart:async';

import 'package:shop/models/app_tab.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/models/product_model.dart';

// region Initial Load
class InitialLoadAction {}

// Initial loading will download popular products and categories
class InitialLoadedAction {
  final List<ProductModel> popularProducts;
  final List<CategoryModel> categories;
  final List<String> favouriteIds;

  InitialLoadedAction(this.popularProducts, this.categories, this.favouriteIds);

  @override
  String toString() {
    return 'InitialLoadedAction {'
        'popularProducts: ${popularProducts.length}, '
        'categories: ${categories.length}, '
        'favouriteIds: ${favouriteIds.length}, ';
  }
}

class InitialNotLoadedAction {}
// endregion Initial Load

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

// region Favourites
class SaveToFavouritesAction {
  final String productId;

  SaveToFavouritesAction(this.productId);

  @override
  String toString() {
    return 'AddToFavouritesAction{productId: $productId}';
  }
}

class RemoveFromFavouritesAction {
  final String productId;

  RemoveFromFavouritesAction(this.productId);

  @override
  String toString() {
    return 'RemoveFromFavouritesAction{productId: $productId}';
  }
}

class LoadFavouritesAction {}

class FavouritesLoadedAction {
  final List<ProductModel> favourites;

  FavouritesLoadedAction(this.favourites);

  @override
  String toString() {
    return 'FavouritesLoadedAction{favourites: $favourites}';
  }
}

class FavouritesNotLoadedAction {}
// endregion Favourites
