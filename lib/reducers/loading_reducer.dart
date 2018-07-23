import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, PopularProductsLoadedAction>(_setLoaded),
  TypedReducer<bool, PopularProductsNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
