import 'dart:async';

import 'package:shop/models/app_tab.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/models/products_filter.dart';

// region Initial Load
class InitialLoadAction {}

// Initial loading will download popular products and categories
class InitialLoadedAction {
  final List<ProductModel> popularProducts;
  final List<CategoryModel> categories;
  final List<String> areas;
  final List<String> favouriteIds;

  InitialLoadedAction(
      this.popularProducts, this.categories, this.areas, this.favouriteIds);

  @override
  String toString() {
    return 'InitialLoadedAction {'
        'popularProducts: ${popularProducts.length}, '
        'categories: ${categories.length}, '
        'areas: ${areas.length}, '
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

// region Products
class LoadProductsAction {
  final ProductsFilter productsFilter;
  final List<String> filters;

  LoadProductsAction(this.productsFilter, this.filters);

  @override
  String toString() {
    return 'LoadProductsAction{productsFilter: $productsFilter, filters: $filters}';
  }
}

class ProductsLoadedAction {
  final List<ProductModel> products;

  ProductsLoadedAction(this.products);

  @override
  String toString() {
    return 'ProductsLoadedAction{products: $products}';
  }
}

class ProductsNotLoadedAction {
  final Exception exception;

  ProductsNotLoadedAction(this.exception);

  @override
  String toString() {
    return 'ProductsNotLoadedAction{exception: $exception}';
  }
}

class RefreshProductsAction {
  final Completer<Null> completer;

  RefreshProductsAction({Completer completer})
      : this.completer = completer ?? Completer<Null>();
}

class ProductsRefreshedAction {
  final List<ProductModel> products;

  ProductsRefreshedAction(this.products);

  @override
  String toString() {
    return 'ProductsRefreshedAction{products: $products}';
  }
}

class ProductsNotRefreshedAction {}

class ClearProductsAction {}
// endregion Products

// region Product
class LoadProductAction {
  final String id;

  LoadProductAction(this.id);
}

class ProductLoadedAction {
  final ProductModel product;

  ProductLoadedAction(this.product);
}

class ProductNotLoadedAction {
  final Error error;

  ProductNotLoadedAction(this.error);
}
// endregion Product

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

// region Cart
class AddToCartAction {
  final ProductModel product;

  AddToCartAction(this.product);

  @override
  String toString() {
    return 'AddToCartAction{product: $product}';
  }
}

class RemoveFromCartAction {
  final ProductModel product;

  RemoveFromCartAction(this.product);

  @override
  String toString() {
    return 'RemoveFromCartAction{product: $product}';
  }
}

class DecrementCartProductAction {
  final ProductModel product;

  DecrementCartProductAction(this.product);

  @override
  String toString() {
    return 'DecrementCartProductAction{product: $product}';
  }
}

// endregion Cart
