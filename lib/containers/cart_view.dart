import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';
import 'package:shop/models/app_state.dart';
import 'package:shop/models/cart_model.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/cart_screen.dart';

class CartView extends StatelessWidget {
  CartView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(title: Text('Cart')),
          body: CartScreen(
              cartProducts: vm.cartProducts,
              incrementProductQuantity: vm.incrementProductQuantity,
              decrementProductQuantity: vm.decrementProductQuantity,
              removeProductFromCart: vm.removeProductFromCart),
        );
      },
    );
  }
}

class _ViewModel {
  final List<CartModel> cartProducts;
  final Function(ProductModel) incrementProductQuantity;
  final Function(ProductModel) decrementProductQuantity;
  final Function(ProductModel) removeProductFromCart;

  _ViewModel(
      {this.incrementProductQuantity,
      this.decrementProductQuantity,
      this.removeProductFromCart,
      this.cartProducts});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        incrementProductQuantity: (product) =>
            store.dispatch(AddToCartAction(product)),
        decrementProductQuantity: (product) =>
            store.dispatch(DecrementCartProductAction(product)),
        removeProductFromCart: (product) =>
            store.dispatch(RemoveFromCartAction(product)),
        cartProducts: store.state.cartItems);
  }
}
