import 'package:flutter/material.dart';
import 'package:shop/containers/products_view.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/models/products_filter.dart';
import 'package:shop/presentation/loading_indicator.dart';

class CategoriesList extends StatelessWidget {
  final bool isLoading;
  final List<CategoryModel> categories;
  final Function clearProducts;

  const CategoriesList(
      {Key key, this.isLoading, this.categories, this.clearProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading ? LoadingIndicator() : getCategoriesListView();
  }

  ListView getCategoriesListView() =>
      ListView.builder(
          padding: EdgeInsets.only(top: 10.0),
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int position) {
            return getRow(position, context, categories);
          });

  Widget getRow(int i, BuildContext context, List categories) {
    return Column(children: <Widget>[
      ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          onTap: () {
            clearProducts();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) =>
                    ProductsView(
                      filter: ProductsFilter.meal,
                      filters: [categories[i].name],
                    )));
          },
          leading: Image.network(
            '${categories[i].imageLink}',
            width: 80.0,
          ),
          title: Text("${categories[i].name}")),
      Divider(
        height: 1.0,
      )
    ]);
  }
}
