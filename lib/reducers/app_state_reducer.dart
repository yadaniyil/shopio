import 'package:shop/models/app_state.dart';
import 'package:shop/reducers/popular_products_reducer.dart';
import 'categories_reducer.dart';
import 'initial_loading_reducer.dart';
import 'tabs_reducer.dart';
import 'favourite_products_reducer.dart';
import 'favourites_loading_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isInitialLoading: initialLoadingReducer(state.isInitialLoading, action),
    popularProducts: popularProductsReducer(state.popularProducts, action),
    categories: categoriesReducer(state.categories, action),
    isFavouritesLoading:
        favouritesLoadingReducer(state.isFavouritesLoading, action),
    favouriteProducts:
        favouriteProductsReducer(state.favouriteProducts, action),
    activeTab: tabsReducer(state.activeTab, action),
  );
}
