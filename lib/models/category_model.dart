import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Object with _$CategoryModelSerializerMixin {
  CategoryModel({this.id, this.name, this.imageLink, this.description});

  @JsonKey(name: 'idCategory')
  final String id;

  @JsonKey(name: 'strCategory')
  final String name;

  @JsonKey(name: 'strCategoryThumb')
  final String imageLink;

  @JsonKey(name: 'strCategoryDescription')
  final String description;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
