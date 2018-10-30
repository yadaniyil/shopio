import 'package:flutter/material.dart';
import 'package:shop/app_keys.dart';
import 'package:shop/containers/app_loading.dart';
import 'package:shop/containers/product_details.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/loading_indicator.dart';

class ProductsList extends StatelessWidget {
  final List<ProductModel> products;
  final Function onProductsRefresh;
  final bool isLoading;

  ProductsList(
      {Key key,
        @required this.isLoading,
        @required this.products,
        @required this.onProductsRefresh});

  @override
  Widget build(BuildContext context) {
    return AppLoading(builder: (context, isLoading) {
      return isLoading
          ? LoadingIndicator(key: AppKeys.categoryProductsLoading)
          : _buildListView(context, onProductsRefresh);
    });
  }

  Widget _buildListView(
      BuildContext context, Function onProductsRefresh) {
    return RefreshIndicator(
      onRefresh: () {
        return onProductsRefresh();
      },
      child: Container(
        color: Colors.grey[100],
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: _buildGridCards(context, products),
        ),
      ),
    );
  }

  List<Card> _buildGridCards(
      BuildContext context, List<ProductModel> products) {
    final ThemeData theme = Theme.of(context);
    List<Card> cards = List.generate(
      products.length,
          (int index) => Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ProductDetails(
                    product: products[index],
                  )));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16.0 / 11.0,
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
                      Text(products[index].getPrice(),
                          style: theme.textTheme.body2),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );

    return cards;
  }

  Widget foodPicture(products, int index) {
    return Hero(
      child: Image.network(products[index].imageLink, fit: BoxFit.fitWidth),
      tag: '${products[index].id}_hero_tag',
    );
  }
}