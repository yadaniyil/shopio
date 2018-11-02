import 'package:meta/meta.dart';
import 'package:shop/models/app_tab.dart';
import 'package:shop/models/cart_model.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/models/product_model.dart';

@immutable
class AppState {
  // Initial loading launches on app start and loads popular products,
  // meal categories and areas
  final bool isInitialLoading;

  // Popular products is products that shows on app start in Dashboard tab
  final List<ProductModel> popularProducts;

  // Meal categories in categories tab, e.g. Beef, Chicken, Desert
  final List<CategoryModel> categories;

  // Counties in categories tab, e.g.: American, British, Canadian
  final List<String> areas;

  // Used to show progress indicator during favorites is loading
  final bool isFavouritesLoading;

  // Contains favorite products that downloaded one by one from web with saved ids
  final List<ProductModel> favouriteProducts;

  // Contains favorite product's ids that user marked with like button
  final List<String> favouriteProductsIds;

  // Contains products that user added to cart and want to buy
  // TODO save cartItems in shared prefs or db
  final List<CartModel> cartItems;

  // Active tab that user observes now. BottomNavigationBar items
  // One of [Dashboard, Categories, Favorites, Profile]
  final AppTab activeTab;

  // Used to show loading indicator for current loading products
  final bool isProductsLoading;

  // Contains products that user want to observe.
  // E.g. products of specific category or filtered products
  final List<ProductModel> products;

  // Contains product that is loaded from the network.
  // This is used in situations when only name and picture of product is pulled
  // from the api but user wants to get product details
  final ProductModel product;

  AppState(
      {this.isInitialLoading = false,
      this.popularProducts = const [],
      this.categories = const [],
      this.areas = const [],
      this.isFavouritesLoading = false,
      this.favouriteProducts = const [],
      this.favouriteProductsIds = const [],
      this.cartItems = const [],
      this.activeTab = AppTab.home,
      this.isProductsLoading = false,
      this.products = const [],
      this.product = null});

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
      AppTab activeTab,
      bool isProductsLoading,
      List<ProductModel> products,
      ProductModel product}) {
    return AppState(
        isInitialLoading: isInitialLoading ?? this.isInitialLoading,
        popularProducts: popularProducts ?? this.popularProducts,
        categories: categories ?? this.categories,
        areas: areas ?? this.areas,
        isFavouritesLoading: isFavouritesLoading ?? this.isFavouritesLoading,
        favouriteProducts: favouriteProducts ?? this.favouriteProducts,
        favouriteProductsIds: favouriteProductsIds ?? this.favouriteProductsIds,
        cartItems: cartItems ?? this.cartItems,
        activeTab: activeTab ?? this.activeTab,
        isProductsLoading: isProductsLoading ?? this.isProductsLoading,
        products: products ?? this.products,
        product: product ?? this.product);
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
          activeTab == other.activeTab &&
          isProductsLoading == other.isProductsLoading &&
          products == other.products &&
          product == other.product;

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
      activeTab.hashCode ^
      isProductsLoading.hashCode ^
      products.hashCode ^
      product.hashCode;

  @override
  String toString() {
    return 'AppState{isInitialLoading: $isInitialLoading, popularProducts: $popularProducts, categories: $categories, areas: $areas, isFavouritesLoading: $isFavouritesLoading, favouriteProducts: $favouriteProducts, favouriteProductsIds: $favouriteProductsIds, cartItems: $cartItems, activeTab: $activeTab, isProductsLoading: $isProductsLoading, products: $products, product: $product}';
  }
}
