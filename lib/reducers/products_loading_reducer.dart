import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';

final productsLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, ProductsLoadedAction>(_setLoaded),
  TypedReducer<bool, ProductsNotLoadedAction>(_setLoaded),
  TypedReducer<bool, LoadProductsAction>(_setLoading),
]);

bool _setLoaded(bool state, action) {
  return false;
}

bool _setLoading(bool state, action) {
  return true;
}
