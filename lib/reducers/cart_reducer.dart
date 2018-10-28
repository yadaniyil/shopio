import 'package:redux/redux.dart';
import 'package:shop/models/cart_model.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/actions/actions.dart';

final cartReducer = combineReducers<List<CartModel>>([
  TypedReducer<List<CartModel>, AddToCartAction>(_addCartProduct),
  TypedReducer<List<CartModel>, RemoveFromCartAction>(_removeCartProduct),
  TypedReducer<List<CartModel>, DecrementCartProductAction>(
      _decrementCartProduct)
]);

List<CartModel> _addCartProduct(
    List<CartModel> cartProducts, AddToCartAction action) {
  bool isProductAlreadyInCart =
      cartProducts.any((item) => item.product == action.product);

  if (isProductAlreadyInCart) {
    // +1 quantity to existing product in cart
    cartProducts.forEach((item) {
      if (item.product == action.product) {
        item.incrementQuantity();
      }
    });
    return cartProducts;
  } else {
    // Add new product to cart
    return List.of(cartProducts)..add(CartModel(action.product, 1));
  }
}

List<CartModel> _removeCartProduct(
    List<CartModel> cartProducts, RemoveFromCartAction action) {
  cartProducts.removeWhere((item) => item.product == action.product);
  return cartProducts;
}

List<CartModel> _decrementCartProduct(
    List<CartModel> cartProducts, DecrementCartProductAction action) {
  cartProducts
      .singleWhere((item) => item.product == action.product)
      .decrementQuantity();
  return cartProducts;
}
