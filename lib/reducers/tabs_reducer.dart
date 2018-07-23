import 'package:redux/redux.dart';
import 'package:shop/models/app_tab.dart';
import 'package:shop/actions/actions.dart';

final tabsReducer = combineReducers<AppTab>([
  TypedReducer<AppTab, UpdateTabAction>(_activeTabReducer),
]);

AppTab _activeTabReducer(AppTab newTab, UpdateTabAction action) {
  return action.newTab;
}

