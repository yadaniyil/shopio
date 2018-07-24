import 'package:flutter/material.dart';
import 'package:shop/actions/actions.dart';
import 'package:shop/middleware/products_middleware.dart';
import 'package:shop/routes.dart';

import 'screens/start/start_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/product/product_screen.dart';
import 'colors.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop/models/app_state.dart';
import 'reducers/app_state_reducer.dart';
import 'package:redux_logging/redux_logging.dart';

void main() {
  // ignore: deprecated_member_use
  MaterialPageRoute.debugEnableFadingRoutes = true;
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: createProductsMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          title: 'Shop',
          theme: shopTheme,
          routes: {
            Routes.home: (context) {
              return StoreBuilder<AppState>(
                onInit: (store) => store.dispatch(InitialLoadAction()),
                builder: (context, store) => HomeScreen(),
              );
            },
            Routes.cart: (context) => CartScreen()
          }),
    );
  }
}

final ThemeData shopTheme = _buildShopTheme();

ThemeData _buildShopTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: secondaryColor,
      primaryColor: Colors.white,
      buttonColor: secondaryColor,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      textSelectionColor: textSelectionColor,
      errorColor: errorRedColor,
      textTheme: _buildShopTextTheme(base.textTheme),
      primaryTextTheme: _buildShopTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildShopTextTheme(base.accentTextTheme),
      primaryIconTheme: base.iconTheme.copyWith(color: Colors.black));
}

TextTheme _buildShopTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        displayColor: Colors.black,
        bodyColor: Colors.black,
      );
}
