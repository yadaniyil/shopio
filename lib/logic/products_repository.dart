
import 'dart:async';

import 'package:shop/models/product_model.dart';

abstract class ProductsRepository {
  const ProductsRepository();

  Future<List<ProductModel>> loadPopularProducts();
}