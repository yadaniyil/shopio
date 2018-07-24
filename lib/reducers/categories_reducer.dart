import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';
import 'package:shop/models/category_model.dart';

final categoriesReducer = combineReducers<List<CategoryModel>>([
  TypedReducer<List<CategoryModel>, CategoriesLoadedAction>(
      _setLoadedCategories),
  TypedReducer<List<CategoryModel>, CategoriesNotLoadedAction>(
      _setNotLoadedCategories),
]);

List<CategoryModel> _setLoadedCategories(
    List<CategoryModel> categories, CategoriesLoadedAction action) {
  return action.categories;
}

List<CategoryModel> _setNotLoadedCategories(
    List<CategoryModel> categories, CategoriesNotLoadedAction action) {
  return [];
}
