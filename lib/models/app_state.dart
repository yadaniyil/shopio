import 'package:meta/meta.dart';
import 'package:shop/models/app_tab.dart';
import 'package:shop/models/cart_model.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/models/product_model.dart';

@immutable
class AppState {
  final bool isInitialLoading;
  final List<ProductModel> popularProducts;
  final List<CategoryModel> categories;
  final List<String> areas;
  final bool isFavouritesLoading;
  final List<ProductModel> favouriteProducts;
  final List<String> favouriteProductsIds;
  final List<CartModel> cartItems;
  final AppTab activeTab;

  AppState(
      {this.isInitialLoading = false,
      this.popularProducts = const [],
      this.categories = const [],
      this.areas = const [],
      this.isFavouritesLoading = false,
      this.favouriteProducts = const [],
      this.favouriteProductsIds = const [],
      this.cartItems = const [],
      this.activeTab = AppTab.home});

  factory AppState.initialLoading() => AppState(isInitialLoading: true);

  AppState copyWith(
      {bool isInitialLoading,
      List<ProductModel> popularProducts,
      List<CategoryModel> categories,
      List<String> areas,
      bool isFavouritesLoading,
      List<ProductModel> favouriteProducts,
      List<String> favouriteProductsIds,
      List<CartModel> cartItems,
      AppTab activeTab}) {
    return AppState(
        isInitialLoading: isInitialLoading ?? this.isInitialLoading,
        popularProducts: popularProducts ?? this.popularProducts,
        categories: categories ?? this.categories,
        areas: areas ?? this.areas,
        isFavouritesLoading: isFavouritesLoading ?? this.isFavouritesLoading,
        favouriteProducts: favouriteProducts ?? this.favouriteProducts,
        favouriteProductsIds: favouriteProductsIds ?? this.favouriteProductsIds,
        cartItems: cartItems ?? this.cartItems,
        activeTab: activeTab ?? this.activeTab);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isInitialLoading == other.isInitialLoading &&
          popularProducts == other.popularProducts &&
          categories == other.categories &&
          areas == other.areas &&
          isFavouritesLoading == other.isFavouritesLoading &&
          favouriteProducts == other.favouriteProducts &&
          favouriteProductsIds == other.favouriteProductsIds &&
          cartItems == other.cartItems &&
          activeTab == other.activeTab;

  @override
  int get hashCode =>
      isInitialLoading.hashCode ^
      categories.hashCode ^
      areas.hashCode ^
      popularProducts.hashCode ^
      isFavouritesLoading.hashCode ^
      favouriteProducts.hashCode ^
      favouriteProductsIds.hashCode ^
      cartItems.hashCode ^
      activeTab.hashCode;

  @override
  String toString() {
    return 'AppState{isInitialLoading: $isInitialLoading, '
        'popularProducts: ${popularProducts.length}, '
        'categories: ${categories.length}, '
        'areas: ${areas.length}, '
        'isFavouritesLoading: $isFavouritesLoading '
        'favouriteProducts: $favouriteProducts, '
        'favouriteProductsIds: $favouriteProductsIds, '
        'cartItems: ${cartItems.length}, '
        'activeTab: $activeTab}';
  }
}
