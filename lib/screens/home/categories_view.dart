import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/presentation/cart_and_search_toolbar.dart';

import '../../models/category_model.dart';



class CategoriesView extends StatefulWidget {
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  // region UI
  showLoadingDialog() {
    return categories.length == 0;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressView();
    } else {
      return getCategoriesListView();
    }
  }

  getProgressView() => Center(child: CircularProgressIndicator());

  ListView getCategoriesListView() => ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position, context, categories);
      });

  Widget getRow(int i, BuildContext context, List categories) {
    return ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('/home');
        },
        leading: Image.network(
          '${categories[i].imageLink}',
          width: 80.0,
        ),
        title: Text("${categories[i].name}"));
  }
  // endregion UI

  loadCategories() async {
    String dataURL = "https://www.themealdb.com/api/json/v1/1/categories.php";
    http.Response response = await http.get(dataURL);
    List categoriesJson = json.decode(response.body)['categories'];
    setState(() {
      categories.clear();
      categoriesJson
          .forEach((json) => categories.add(CategoryModel.fromJson(json)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cartAndSearchToolbar('Categories', context),
      body: getBody(),
    );
  }
}
