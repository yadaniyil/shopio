// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return new CategoryModel(
      json['idCategory'] as String,
      json['strCategory'] as String,
      json['strCategoryThumb'] as String,
      json['strCategoryDescription'] as String);
}

abstract class _$CategoryModelSerializerMixin {
  String get id;
  String get name;
  String get imageLink;
  String get description;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'idCategory': id,
        'strCategory': name,
        'strCategoryThumb': imageLink,
        'strCategoryDescription': description
      };
}
