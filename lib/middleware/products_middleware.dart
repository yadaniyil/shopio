import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:shop/actions/actions.dart';
import 'package:shop/logic/ProductsRepositoryImpl.dart';
import 'package:shop/logic/products_repository.dart';
import 'package:shop/models/app_state.dart';

List<Middleware<AppState>> createProductsMiddleware([
  ProductsRepository repository = const ProductsRepositoryImpl(),
]) {
  final loadPopularProducts = _createLoadPopularProducts(repository);

  return [
    LoggingMiddleware.printer(),
    TypedMiddleware<AppState, LoadPopularProductsAction>(loadPopularProducts),
    TypedMiddleware<AppState, PopularProductsLoadedAction>(loadPopularProducts),
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
