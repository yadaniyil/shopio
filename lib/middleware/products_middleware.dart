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
  final loadPopularProducts = _createLoadPopularProducts(repository);
  final refreshPopularProducts = _createRefreshPopularProducts(repository);

  return [
    LoggingMiddleware.printer(),
    TypedMiddleware<AppState, LoadPopularProductsAction>(loadPopularProducts),
    TypedMiddleware<AppState, RefreshPopularProductsAction>(
        refreshPopularProducts),
  ];
}

Middleware<AppState> _createLoadPopularProducts(ProductsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadPopularProducts().then(
      (products) {
        store.dispatch(
          PopularProductsLoadedAction(products),
        );
      },
    ).catchError((_) => store.dispatch(PopularProductsNotLoadedAction()));

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
