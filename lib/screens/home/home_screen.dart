import 'package:flutter/material.dart';
import 'package:shop/app_keys.dart';
import 'package:shop/containers/active_tab.dart';
import 'package:shop/containers/tab_selector.dart';
import 'package:shop/models/app_tab.dart';

import 'dashboard_view.dart';
import 'categories_view.dart';
import 'favourites_view.dart';
import 'profile_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen() : super(key: AppKeys.homeScreen);

  @override
  Widget build(BuildContext context) {
    return ActiveTab(builder: (context, activeTab) {
      return Scaffold(
        body: _getBody(activeTab),
        bottomNavigationBar: TabSelector(),
      );
    });
  }

  Widget _getBody(AppTab activeTab) {
    switch (activeTab) {
      case AppTab.home: return DashboardView();
      case AppTab.categories: return CategoriesView();
      case AppTab.favourite: return FavouritesView();
      case AppTab.profile: return ProfileView();
      default: return DashboardView();
    }
  }
}