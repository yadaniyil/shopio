import 'package:flutter/material.dart';

import 'screens/start/start_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/product/product_screen.dart';
import 'colors.dart';

class ShopApp extends StatefulWidget {
  @override
  _ShopAppState createState() => _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      theme: _kShopTheme,
      home: StartScreen(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomeScreen(),
        '/cart': (BuildContext context) => CartScreen(),
        '/product': (BuildContext context) => ProductScreen()
      },
    );
  }
}

final ThemeData _kShopTheme = _buildShopTheme();

ThemeData _buildShopTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: Colors.blueAccent,
    primaryColor: Colors.blueAccent,
    buttonColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    textTheme: _buildShopTextTheme(base.textTheme),
    primaryTextTheme: _buildShopTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShopTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(
      color: Colors.black
    )
  );
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
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}
