import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';

final areasReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, InitialLoadedAction>(
      _areasLoaded),
  TypedReducer<List<String>, InitialNotLoadedAction>(
      _areasNotLoaded),
]);

List<String> _areasLoaded(
    List<String> areas, InitialLoadedAction action) {
  return action.areas;
}

List<String> _areasNotLoaded(
    List<String> areas, InitialNotLoadedAction action) {
  return [];
}
