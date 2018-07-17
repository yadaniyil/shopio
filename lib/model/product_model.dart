import 'package:flutter/material.dart';

class ProductModel {
  const ProductModel(
      {@required this.id,
      @required this.isFavourite,
      @required this.name,
      @required this.description,
      @required this.price,
      @required this.imageLink})
      : assert(id != null),
        assert(isFavourite != null),
        assert(name != null),
        assert(description != null),
        assert(price != null),
        assert(imageLink != null);

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
