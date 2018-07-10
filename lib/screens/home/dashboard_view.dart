import 'package:flutter/material.dart';

import 'toolbar_actions.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Dashboard'),
          actions: getToolbarActions(context),
          automaticallyImplyLeading: false),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(30, context),
      ),
    );
  }
}

List<Card> _buildGridCards(int count, BuildContext context) {
  final ThemeData theme = Theme.of(context);
  List<Card> cards = List.generate(
    count,
    (int index) => Card(
      child: GestureDetector(
        onTap: () { Navigator.of(context).pushNamed('/product'); },
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Image.asset('assets/salmon-dish-food-meal.jpeg',
                    fit: BoxFit.fitWidth),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Delicious food',
                      style: theme.textTheme.title,
                      maxLines: 1,
                    ),
                    SizedBox(height: 8.0),
                    Text('\$12.00 ', style: theme.textTheme.body2),
                  ],
                ),
              ),
            ],
          ),
      )
          
        ),
  );

  return cards;
}
