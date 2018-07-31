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
  final initialLoad = _createInitialLoading(repository);
  final refreshPopularProducts = _createRefreshPopularProducts(repository);
  final loadFavouriteProducts = _createLoadFavouriteProducts(repository);
  final saveFavouriteProduct = _createSaveFavouriteProduct(repository);
  final removeFavouriteProducts = _createRemoveFavouriteProduct(repository);

  return [
    LoggingMiddleware.printer(),
    TypedMiddleware<AppState, InitialLoadAction>(initialLoad),
    TypedMiddleware<AppState, RefreshPopularProductsAction>(
        refreshPopularProducts),
    TypedMiddleware<AppState, LoadFavouritesAction>(loadFavouriteProducts),
    TypedMiddleware<AppState, SaveToFavouritesAction>(saveFavouriteProduct),
    TypedMiddleware<AppState, RemoveFromFavouritesAction>(
        removeFavouriteProducts),
  ];
}

Middleware<AppState> _createInitialLoading(ProductsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    Future
        .wait([
          repository.loadPopularProducts(),
          repository.loadCategories(),
          repository.loadFavouriteIds()
        ])
        .then((List responses) => triggerActions(responses, store))
        .catchError((e) => store.dispatch(InitialNotLoadedAction()));

    next(action);
  };
}

triggerActions(List responses, Store<AppState> store) {
  List<ProductModel> popularProducts = List();
  List<CategoryModel> categories = List();
  List<String> favouriteIds = List();

  if (responses[0] is List<ProductModel>) popularProducts.addAll(responses[0]);

  if (responses[1] is List<CategoryModel>) categories.addAll(responses[1]);

  if (responses[2] is List<String>) favouriteIds.addAll(responses[2]);

  store
      .dispatch(InitialLoadedAction(popularProducts, categories, favouriteIds));
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
    repository.loadFavouriteProducts().then(
      (favourites) {
        store.dispatch(
          FavouritesLoadedAction(favourites),
        );
      },
    ).catchError((_) {
      store.dispatch(FavouritesNotLoadedAction());
    });

    next(action);
  };
}

Middleware<AppState> _createSaveFavouriteProduct(
    ProductsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    if (action is SaveToFavouritesAction) {
      repository.saveToFavourites(action.productId);
    }
    next(action);
  };
}

Middleware<AppState> _createRemoveFavouriteProduct(
    ProductsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    if (action is SaveToFavouritesAction) {
      repository.removeFromFavorites(action.productId);
    }
    next(action);
  };
}
