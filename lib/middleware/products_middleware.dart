import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:shop/actions/actions.dart';
import 'package:shop/logic/products_repository_impl.dart';
import 'package:shop/logic/products_repository.dart';
import 'package:shop/models/app_state.dart';

List<Middleware<AppState>> createProductsMiddleware([
  ProductsRepository repository = const ProductsRepositoryImpl(),
]) {
  final initialLoad = _createLoadPopularProductsAndCategories(repository);
  final refreshPopularProducts = _createRefreshPopularProducts(repository);

  return [
    LoggingMiddleware.printer(),
    TypedMiddleware<AppState, InitialLoadAction>(initialLoad),
    TypedMiddleware<AppState, RefreshPopularProductsAction>(
        refreshPopularProducts),
  ];
}

Middleware<AppState> _createLoadPopularProductsAndCategories(ProductsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadPopularProducts().then(
      (products) {
        store.dispatch(
          PopularProductsLoadedAction(products),
        );
      },
    ).catchError((_) => store.dispatch(PopularProductsNotLoadedAction()));

    repository.loadCategories().then(
          (categories) {
        store.dispatch(
          CategoriesLoadedAction(categories),
        );
      },
    ).catchError((_) => store.dispatch(CategoriesNotLoadedAction()));

    next(action);
  };
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
