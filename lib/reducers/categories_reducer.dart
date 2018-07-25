import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';
import 'package:shop/models/category_model.dart';

final categoriesReducer = combineReducers<List<CategoryModel>>([
  TypedReducer<List<CategoryModel>, InitialLoadedAction>(
      _setLoadedCategories),
  TypedReducer<List<CategoryModel>, InitialNotLoadedAction>(
      _setNotLoadedCategories),
]);

List<CategoryModel> _setLoadedCategories(
    List<CategoryModel> categories, InitialLoadedAction action) {
  return action.categories;
}

List<CategoryModel> _setNotLoadedCategories(
    List<CategoryModel> categories, InitialNotLoadedAction action) {
  return [];
}
