// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return new CategoryModel(
      id: json['idCategory'] as String,
      name: json['strCategory'] as String,
      imageLink: json['strCategoryThumb'] as String,
      description: json['strCategoryDescription'] as String);
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
