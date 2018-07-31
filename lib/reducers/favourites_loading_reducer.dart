import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';

final favouritesLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, FavouritesLoadedAction>(_setLoaded),
  TypedReducer<bool, FavouritesNotLoadedAction>(_setLoaded),
  TypedReducer<bool, LoadFavouritesAction>(_setLoading),
]);

bool _setLoaded(bool state, action) {
  return false;
}

bool _setLoading(bool state, action) {
  return true;
}
