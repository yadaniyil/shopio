import 'package:redux/redux.dart';

import 'package:shop/actions/actions.dart';
import 'package:shop/models/product_model.dart';

final popularProductsReducer = combineReducers<List<ProductModel>>([
  TypedReducer<List<ProductModel>, PopularProductsLoadedAction>(
      _setLoadedPopularProducts),
  TypedReducer<List<ProductModel>, PopularProductsNotLoadedAction>(
      _setNoPopularProducts),
]);

List<ProductModel> _setLoadedPopularProducts(
    List<ProductModel> popularProducts, PopularProductsLoadedAction action) {
  return action.popularProducts;
}

List<ProductModel> _setNoPopularProducts(
    List<ProductModel> popularProducts, PopularProductsNotLoadedAction action) {
  return [];
}

