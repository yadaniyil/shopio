import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shop/logic/products_repository.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/models/product_model.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  const ProductsRepositoryImpl();

  static const String FAVOURITES_IDS = 'favouritesIds';

  @override
  Future<List<ProductModel>> loadPopularProducts() async {
    String latestProductsUrl =
        'https://www.themealdb.com/api/json/v1/1/latest.php';
    http.Response response = await http.get(latestProductsUrl);
    List categoriesJson = json.decode(response.body)['meals'];
    List<ProductModel> products = List();
    categoriesJson.forEach((json) => products.add(ProductModel.fromJson(json)));

    return products;
  }

  @override
  Future<List<CategoryModel>> loadCategories() async {
    String dataURL = "https://www.themealdb.com/api/json/v1/1/categories.php";
    http.Response response = await http.get(dataURL);
    List categoriesJson = json.decode(response.body)['categories'];
    List<CategoryModel> categories = List();
    categoriesJson
        .forEach((json) => categories.add(CategoryModel.fromJson(json)));
    return categories;
  }

  @override
  Future<List<String>> loadAreas() async {
    String dataURL = "https://www.themealdb.com/api/json/v1/1/list.php?a=list";
    http.Response response = await http.get(dataURL);
    List areasJson = json.decode(response.body)['meals'];
    List<String> areas = List();
    areasJson
        .forEach((json) => areas.add(json['strArea']));
    return areas;
  }

  @override
  Future<List<ProductModel>> loadFavouriteProducts() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> favouritesIds = preferences.getStringList(FAVOURITES_IDS);
    List<ProductModel> favouriteProducts = List();

    for (String id in favouritesIds) {
      var product = await downloadProductWithId(id);
      favouriteProducts.add(product);
    }

    return favouriteProducts;
  }

  @override
  Future<ProductModel> downloadProductWithId(String id) async {
    String dataURL = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id';
    http.Response response = await http.get(dataURL);
    print('response: ${response.body}');
    List productJson = json.decode(response.body)['meals'];
    ProductModel product = ProductModel.fromJson(productJson[0]);
    return product;
  }

  @override
  Future<bool> saveToFavourites(String productId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var ids = preferences.getStringList(FAVOURITES_IDS);
    if (ids == null) {
      ids = List<String>();
    }

    if (!ids.contains(productId)) {
      ids.add(productId);
    }
    return preferences.setStringList(FAVOURITES_IDS, ids);
  }

  @override
  Future<bool> removeFromFavorites(String productId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var ids = preferences.getStringList(FAVOURITES_IDS);
    if (ids.contains(productId)) {
      ids.remove(productId);
    }
    return preferences.setStringList(FAVOURITES_IDS, ids);
  }

  @override
  Future<List<String>> loadFavouriteIds() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var ids = preferences.getStringList(FAVOURITES_IDS);
    return ids ?? List();
  }
}
