import 'package:flutter/material.dart';

import 'toolbar_actions.dart';

class CategoriesView extends StatefulWidget {
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Categories'),
          actions: getToolbarActions(),
          automaticallyImplyLeading: false),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("For obese"),
          ),
          Divider(),
          ListTile(
            title: Text("For a little fat"),
          ),
          Divider(),
          ListTile(
            title: Text("For little big"),
          ),
          Divider(),
          ListTile(
            title: Text("Salads"),
          ),
          Divider(),
          ListTile(
            title: Text("Pizza"),
          ),Divider(),
          ListTile(
            title: Text("Vegan"),
          ),
          Divider(),
          ListTile(
            title: Text("Lactose free"),
          ),
          Divider(),
          ListTile(
            title: Text("Cakes"),
          ),
          Divider(),
          ListTile(
            title: Text("Sales"),
          )
        ],
      ),
    );
  }
}
