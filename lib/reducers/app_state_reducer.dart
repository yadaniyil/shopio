import 'package:shop/models/app_state.dart';
import 'package:shop/reducers/popular_products_reducer.dart';
import 'loading_reducer.dart';
import 'tabs_reducer.dart';


AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    popularProducts: popularProductsReducer(state.popularProducts, action),
    activeTab: tabsReducer(state.activeTab, action),
  );
}
