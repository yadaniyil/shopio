import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shop/logic/products_repository.dart';
import 'package:shop/models/product_model.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  const ProductsRepositoryImpl();

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
}
