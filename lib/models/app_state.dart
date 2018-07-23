import 'package:meta/meta.dart';
import 'package:shop/models/app_tab.dart';
import 'package:shop/models/product_model.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<ProductModel> popularProducts;
  final AppTab activeTab;

  AppState(
      {this.isLoading = false,
      this.popularProducts = const [],
      this.activeTab = AppTab.home});

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith(
      {bool isLoading, List<ProductModel> popularProducts, AppTab activeTab}) {
    return AppState(
        isLoading: isLoading ?? this.isLoading,
        popularProducts: popularProducts ?? this.popularProducts,
        activeTab: activeTab ?? this.activeTab);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          popularProducts == other.popularProducts &&
          activeTab == other.activeTab;

  @override
  int get hashCode =>
      isLoading.hashCode ^ popularProducts.hashCode ^ activeTab.hashCode;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, todos: $popularProducts, activeTab: $activeTab}';
  }
}
