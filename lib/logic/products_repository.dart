import 'dart:async';

import 'package:shop/models/category_model.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/models/products_filter.dart';

abstract class ProductsRepository {
  const ProductsRepository();

  Future<List<ProductModel>> loadPopularProducts();

  Future<List<ProductModel>> loadProducts(
      ProductsFilter filter, List<String> filters);

  Future<List<CategoryModel>> loadCategories();

  Future<List<String>> loadAreas();

  Future<List<ProductModel>> loadFavouriteProducts();

  Future<ProductModel> downloadProductWithId(String id);

  Future<bool> saveToFavourites(String productId);

  Future<bool> removeFromFavorites(String productId);

  Future<List<String>> loadFavouriteIds();
}
