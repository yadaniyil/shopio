import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter/material.dart';
import 'package:shop/models/app_state.dart';
import 'package:shop/models/product_model.dart';
import 'toolbar_actions.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  // region UI
  showLoadingDialog(AppState state) {
    return state.popularProducts == null || state.popularProducts.length == 0;
  }

  getBody(AppState state) {
    if (showLoadingDialog(state)) {
      return getProgressView();
    } else {
      return RefreshIndicator(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 9.0,
            children: _buildGridCards(context, state.popularProducts),
          ),
          onRefresh: refreshLatestProducts);
    }
  }

  getProgressView() => Center(child: CircularProgressIndicator());

  Widget foodPicture(products, int index) {
    return Image.network(products[index].imageLink, fit: BoxFit.fitWidth);
  }

  List<Card> _buildGridCards(
      BuildContext context, List<ProductModel> products) {
    final ThemeData theme = Theme.of(context);
    List<Card> cards = List.generate(
      products.length,
      (int index) => Card(
              child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/product');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: foodPicture(products, index),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        products[index].name,
                        style: theme.textTheme.title,
                        maxLines: 1,
                      ),
                      SizedBox(height: 8.0),
                      Text('\$12.00 ', style: theme.textTheme.body2),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );

    return cards;
  }

  // endregion UI

  loadLatestProducts() async {
    String latestProductsUrl =
        'https://www.themealdb.com/api/json/v1/1/latest.php';
    http.Response response = await http.get(latestProductsUrl);
    List categoriesJson = json.decode(response.body)['meals'];
    List<ProductModel> products = List();
    categoriesJson.forEach((json) => products.add(ProductModel.fromJson(json)));


//    StoreConnector<List<ProductModel>, VoidCallback>(
//      converter: (store) {
//        return () => store.dispatch(AddPopularProductsAction(products));
//      },
//      builder: (context, callback) {
//        callback();
//      },
//    );
  }

  Future<Null> refreshLatestProducts() async {
    await loadLatestProducts();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Popular now'),
          actions: getToolbarActions(context),
          automaticallyImplyLeading: false),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return getBody(state);
        },
      ),
    );
  }
}
