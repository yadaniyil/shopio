import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/cart_and_search_toolbar.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel product;

  const ProductScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: cartAndSearchToolbar(
            title: product.name, context: context, implyLeading: true),
        body: ListView(
          children: [
            foodPicture,
          ],
        ));
  }

  Widget get foodPicture {
    return Hero(
      tag: '${product.id}_hero_tag',
      child: Image.network(
        product.imageLink,
        height: 240.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
