import 'package:flutter/material.dart';
import 'package:shop/app_keys.dart';
import 'package:shop/containers/app_loading.dart';
import 'package:shop/containers/product_details.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/card_product.dart';
import 'package:shop/presentation/loading_indicator.dart';

class PopularProductsList extends StatelessWidget {
  final List<ProductModel> popularProducts;
  final Function onPopularProductsRefresh;

  PopularProductsList(
      {Key key,
      @required this.popularProducts,
      @required this.onPopularProductsRefresh});

  @override
  Widget build(BuildContext context) {
    return AppLoading(builder: (context, isLoading) {
      return isLoading
          ? LoadingIndicator(key: AppKeys.popularProductsLoading)
          : _buildListView(context, onPopularProductsRefresh);
    });
  }

  Widget _buildListView(
      BuildContext context, Function onPopularProductsRefresh) {
    return RefreshIndicator(
      onRefresh: () {
        return onPopularProductsRefresh();
      },
      child: Container(
        color: Colors.grey[100],
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: _buildGridCards(context, popularProducts),
        ),
      ),
    );
  }

  List<CardProduct> _buildGridCards(
      BuildContext context, List<ProductModel> products) {
    final ThemeData theme = Theme.of(context);
    List<CardProduct> cards = List.generate(
      products.length,
      (int index) => CardProduct(product: products[index], theme: theme)
    );

    return cards;
  }
}
