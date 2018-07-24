import 'package:flutter/material.dart';
import 'package:shop/models/category_model.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoriesList({Key key, @required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getCategoriesListView();
  }

  ListView getCategoriesListView() => ListView.builder(
      padding: EdgeInsets.only(top: 10.0),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position, context, categories);
      });

  Widget getRow(int i, BuildContext context, List categories) {
    return Column(children: <Widget>[
      ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
          onTap: () {
            Navigator.of(context).pushNamed('/home');
          },
          leading: Image.network(
            '${categories[i].imageLink}',
            width: 80.0,
          ),
          title: Text("${categories[i].name}")),
      Divider()
    ]);
  }
}
