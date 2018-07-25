import 'dart:async';

import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:shop/actions/actions.dart';
import 'package:shop/logic/products_repository_impl.dart';
import 'package:shop/logic/products_repository.dart';
import 'package:shop/models/app_state.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/models/product_model.dart';

List<Middleware<AppState>> createProductsMiddleware([
  ProductsRepository repository = const ProductsRepositoryImpl(),
]) {
  final initialLoad = _createLoadPopularProductsAndCategories(repository);
  final refreshPopularProducts = _createRefreshPopularProducts(repository);
  final loadFavouriteProducts = _createLoadFavouriteProducts(repository);

  return [
    LoggingMiddleware.printer(),
    TypedMiddleware<AppState, InitialLoadAction>(initialLoad),
    TypedMiddleware<AppState, RefreshPopularProductsAction>(
        refreshPopularProducts),
    TypedMiddleware<AppState, LoadFavouritesAction>(loadFavouriteProducts),
  ];
}

Middleware<AppState> _createLoadPopularProductsAndCategories(
    ProductsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    Future
        .wait([repository.loadPopularProducts(), repository.loadCategories()])
        .then((List responses) => triggerActions(responses, store))
        .catchError((e) => store.dispatch(InitialNotLoadedAction()));

    next(action);
  };
}

triggerActions(List responses, Store<AppState> store) {
  List<ProductModel> popularProducts = List();
  List<CategoryModel> categories = List();

  if (responses[0] is List<ProductModel>) {
    popularProducts.addAll(responses[0]);
    categories.addAll(responses[1]);
  } else {
    popularProducts.addAll(responses[1]);
    categories.addAll(responses[0]);
  }

  store.dispatch(InitialLoadedAction(popularProducts, categories));
}

Middleware<AppState> _createRefreshPopularProducts(
    ProductsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    if (action is RefreshPopularProductsAction) {
      repository.loadPopularProducts().then(
        (products) {
          store.dispatch(
            PopularProductsRefreshedAction(products),
          );
          action.completer.complete();
        },
      ).catchError((_) {
        store.dispatch(PopularProductsNotRefreshedAction());
        action.completer.complete();
      });
    }
    next(action);
  };
}

Middleware<AppState> _createLoadFavouriteProducts(
    ProductsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    if (action is RefreshPopularProductsAction) {
      repository.loadFavouriteProducts().then(
        (favourites) {
          store.dispatch(
            FavouritesLoadedAction(favourites),
          );
        },
      ).catchError((_) {
        store.dispatch(FavouritesNotLoadedAction());
      });
    }
    next(action);
  };
}
