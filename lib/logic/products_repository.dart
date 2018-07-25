
import 'dart:async';

import 'package:shop/models/category_model.dart';
import 'package:shop/models/product_model.dart';

abstract class ProductsRepository {
  const ProductsRepository();

  Future<List<ProductModel>> loadPopularProducts();

  Future<List<CategoryModel>> loadCategories();

  Future<List<ProductModel>> loadFavouriteProducts();

  Future<ProductModel> downloadProductWithId(String id);
}