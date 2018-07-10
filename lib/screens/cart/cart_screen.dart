import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 140.0),
          Icon(Icons.shopping_cart, size: 120.0, color: Colors.blueAccent),
          SizedBox(height: 40.0),
          Text('Your shopping cart is empty', textAlign: TextAlign.center, textScaleFactor: 1.2)
        ],
      ),
    );
  }
}
