import 'package:shop/models/app_tab.dart';
import 'package:shop/models/product_model.dart';

class LoadPopularProductsAction {}

class PopularProductsNotLoadedAction {}

class PopularProductsLoadedAction {
  final List<ProductModel> popularProducts;

  PopularProductsLoadedAction(this.popularProducts);

  @override
  String toString() {
    return 'PopularProductsLoadedAction{popularProducts: $popularProducts}';
  }
}

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);

  @override
  String toString() {
    return 'UpdateTabAction{newTab: $newTab}';
  }


}
