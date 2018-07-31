import 'package:redux/redux.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/actions/actions.dart';

final favouriteProductsReducer = combineReducers<List<ProductModel>>([
  TypedReducer<List<ProductModel>, FavouritesLoadedAction>(
      _setLoadedFavouriteProducts),
  TypedReducer<List<ProductModel>, FavouritesNotLoadedAction>(
      _setNoFavouriteProducts),
]);

List<ProductModel> _setLoadedFavouriteProducts(
    List<ProductModel> favouriteProducts, FavouritesLoadedAction action) {
  return action.favourites;
}

List<ProductModel> _setNoFavouriteProducts(
    List<ProductModel> favouriteProducts, FavouritesNotLoadedAction action) {
  return [];
}
