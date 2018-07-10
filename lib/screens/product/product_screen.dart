import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product'), backgroundColor: Colors.white),
      body: ListView(
          children: [
            Image.asset('assets/salmon-dish-food-meal.jpeg',
              height: 240.0,
              fit: BoxFit.cover,
            ),
          ],
      )
    );
  }
}