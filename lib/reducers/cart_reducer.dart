import 'package:redux/redux.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/actions/actions.dart';

final cartReducer = combineReducers<List<ProductModel>>([
  TypedReducer<List<ProductModel>, AddToCartAction>(
      _setAddCartProduct),
  TypedReducer<List<ProductModel>, RemoveFromCartAction>(
      _setRemoveCartProduct)
]);

List<ProductModel> _setAddCartProduct(
    List<ProductModel> cartProducts, AddToCartAction action) {
  return List.from(cartProducts)..add(action.product);
}

List<ProductModel> _setRemoveCartProduct(
    List<ProductModel> cartProducts, RemoveFromCartAction action) {
  return List.from(cartProducts)..remove(action.product);
}