import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';

final initialLoadingReducer = combineReducers<bool>([
  TypedReducer<bool, InitialLoadedAction>(_setLoaded),
  TypedReducer<bool, InitialNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
