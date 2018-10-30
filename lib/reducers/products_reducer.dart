import 'package:redux/redux.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/actions/actions.dart';

final productsReducer = combineReducers<List<ProductModel>>([
  TypedReducer<List<ProductModel>, ProductsLoadedAction>(
      _onProductsLoaded),
  TypedReducer<List<ProductModel>, ProductsNotLoadedAction>(
      _onProductsNotLoaded),
  TypedReducer<List<ProductModel>, ClearProductsAction>(
      _onProductsCleared)
]);

List<ProductModel> _onProductsLoaded(
    List<ProductModel> products, ProductsLoadedAction action) {
  return action.products;
}

List<ProductModel> _onProductsNotLoaded(
    List<ProductModel> products, ProductsNotLoadedAction action) {
  return [];
}

List<ProductModel> _onProductsCleared(
    List<ProductModel> products, ClearProductsAction action) {
  return [];
}