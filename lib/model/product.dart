import 'package:flutter/material.dart';

enum Category { all, healthy, tasty, vegan }

class Product {
  const Product({
    @required this.category,
    @required this.id,
    @required this.isFavourite,
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.imageLink
  })  : assert(category != null),
        assert(id != null),
        assert(isFavourite != null),
        assert(name != null),
        assert(description != null),
        assert(price != null),
        assert(imageLink != null);

  final Category category;
  final int id;
  final bool isFavourite;
  final String name;
  final String description;
  final int price;
  final String imageLink;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";
}
