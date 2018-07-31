import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';

final favouriteIdsReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, InitialLoadedAction>(_setLoadedFavouriteIds),
  TypedReducer<List<String>, InitialNotLoadedAction>(_setNotLoadedFavouriteIds),
  TypedReducer<List<String>, SaveToFavouritesAction>(_setSaveToFavouriteIds),
  TypedReducer<List<String>, RemoveFromFavouritesAction>(
      _setRemoveFromFavouriteIds)
]);

List<String> _setLoadedFavouriteIds(
    List<String> categories, InitialLoadedAction action) {
  return action.favouriteIds;
}

List<String> _setNotLoadedFavouriteIds(
    List<String> categories, InitialNotLoadedAction action) {
  return [];
}

List<String> _setSaveToFavouriteIds(
    List<String> favouriteIds, SaveToFavouritesAction action) {
  if (favouriteIds.contains(action.productId))
    return favouriteIds;
  else
    return List.from(favouriteIds)..add(action.productId);
}

List<String> _setRemoveFromFavouriteIds(
    List<String> favouriteIds, RemoveFromFavouritesAction action) {
  if (favouriteIds.contains(action.productId))
    return List.from(favouriteIds)..remove(action.productId);
  else
    return favouriteIds;
}
