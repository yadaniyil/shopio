import 'package:meta/meta.dart';
import 'package:shop/models/app_tab.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/models/product_model.dart';

@immutable
class AppState {
  final bool isInitialLoading;
  final List<ProductModel> popularProducts;
  final List<CategoryModel> categories;

  final bool isFavouritesLoading;
  final List<ProductModel> favouriteProducts;
  final AppTab activeTab;

  AppState(
      {this.isInitialLoading = false,
      this.popularProducts = const [],
      this.isFavouritesLoading = false,
      this.favouriteProducts = const [],
      this.categories = const [],
      this.activeTab = AppTab.home});

  factory AppState.initialLoading() => AppState(isInitialLoading: true);

  AppState copyWith(
      {bool isInitialLoading,
      List<ProductModel> popularProducts,
      bool isFavouritesLoading,
      List<ProductModel> favouriteProducts,
      List<CategoryModel> categories,
      AppTab activeTab}) {
    return AppState(
        isInitialLoading: isInitialLoading ?? this.isInitialLoading,
        isFavouritesLoading: isFavouritesLoading ?? this.isFavouritesLoading,
        popularProducts: popularProducts ?? this.popularProducts,
        favouriteProducts: favouriteProducts ?? this.favouriteProducts,
        categories: categories ?? this.categories,
        activeTab: activeTab ?? this.activeTab);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isInitialLoading == other.isInitialLoading &&
          isFavouritesLoading == other.isFavouritesLoading &&
          popularProducts == other.popularProducts &&
          favouriteProducts == other.favouriteProducts &&
          categories == other.categories &&
          activeTab == other.activeTab;

  @override
  int get hashCode =>
      isInitialLoading.hashCode ^
      isFavouritesLoading.hashCode ^
      popularProducts.hashCode ^
      favouriteProducts.hashCode ^
      categories.hashCode ^
      activeTab.hashCode;

  @override
  String toString() {
    return 'AppState{isInitialLoading: $isInitialLoading, popularProducts: $popularProducts,'
        ' favouriteProducts: $favouriteProducts, isFavouritesLoading: $isFavouritesLoading'
        ' categories: $categories, activeTab: $activeTab}';
  }
}
