import 'package:flutter/material.dart';

import 'dashboard_view.dart';
import 'categories_view.dart';
import 'favourites_view.dart';
import 'profile_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentBottomBarIndex = 0;
  List<HomeScreenItem> _homeScreenItems;

  @override
  void initState() {
    _homeScreenItems = [
      HomeScreenItem(
          icon: Icon(Icons.home),
          title: Text('Dashboard'),
          content: DashboardView()),
      HomeScreenItem(
          icon: Icon(Icons.list),
          title: Text('Categories'),
          content: CategoriesView()),
      HomeScreenItem(
          icon: Icon(Icons.favorite),
          title: Text('Favourites'),
          content: FavouritesView()),
      HomeScreenItem(
          icon: Icon(Icons.account_circle),
          title: Text('Profile'),
          content: ProfileView())
    ];
    super.initState();
  }

  void _bottomBarItemSelected(int index) {
    setState(() {
      _currentBottomBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _homeScreenItems[_currentBottomBarIndex].content,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentBottomBarIndex,
        items: _homeScreenItems
            .map((HomeScreenItem item) => item.barItem)
            .toList(),
        onTap: _bottomBarItemSelected,
      ),
    );
  }
}

class HomeScreenItem {
  final BottomNavigationBarItem barItem;
  final Widget content;

  HomeScreenItem({Widget icon, Widget title, Widget content})
      : barItem = BottomNavigationBarItem(icon: icon, title: title),
        content = content;
}
