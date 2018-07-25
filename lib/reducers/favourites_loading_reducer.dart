import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';

final favouritesLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, FavouritesLoadedAction>(_setLoaded),
  TypedReducer<bool, FavouritesNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
