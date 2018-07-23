import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shop/actions/actions.dart';
import 'package:shop/app_keys.dart';
import 'package:shop/models/app_state.dart';
import 'package:shop/models/app_tab.dart';

class TabSelector extends StatelessWidget {

  TabSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return BottomNavigationBar(
          fixedColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          key: AppKeys.tabs,
          currentIndex: AppTab.values.indexOf(vm.activeTab),
          onTap: vm.onTabSelected,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, key: AppKeys.homeTab),
              title: Text('Dashboard'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, key: AppKeys.categoriesTab),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, key: AppKeys.favouritesTab),
              title: Text('Favourites'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, key: AppKeys.profileTab),
              title: Text('Profile'),
            )
          ],
        );
      },
    );
  }
}


class _ViewModel {
  final AppTab activeTab;
  final Function(int) onTabSelected;

  _ViewModel({@required this.activeTab, @required this.onTabSelected});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        activeTab: store.state.activeTab,
        onTabSelected: (index) {
          store.dispatch(UpdateTabAction(AppTab.values[index]));
        });
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab;

  @override
  int get hashCode => activeTab.hashCode;


}
