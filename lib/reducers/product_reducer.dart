import 'package:redux/redux.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/actions/actions.dart';

final productReducer = combineReducers<ProductModel>([
  TypedReducer<ProductModel, ProductLoadedAction>(_onProductLoaded),
  TypedReducer<ProductModel, ProductNotLoadedAction>(_onProductNotLoaded),
]);

ProductModel _onProductLoaded(
    ProductModel product, ProductLoadedAction action) {
  return action.product;
}

ProductModel _onProductNotLoaded(
    ProductModel product, ProductNotLoadedAction action) {
  return null;
}
