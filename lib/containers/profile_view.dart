import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shop/models/app_state.dart';
import 'package:shop/presentation/cart_and_search_toolbar.dart';
import 'package:shop/presentation/profile_content.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Profile view build');
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, _ViewModel vm) {
        return Scaffold(
          appBar: cartAndSearchToolbar(
              title: 'Profile',
              context: context),
          body: ProfileContent()
        );
      },
    );
  }
}

class _ViewModel {
  // Remove in future
  final int cartProductsQuantity;

  _ViewModel({this.cartProductsQuantity});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(cartProductsQuantity: store.state.cartItems.length);
  }
}
