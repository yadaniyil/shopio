import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Object with _$ProductModelSerializerMixin {
  @JsonKey(name: 'idMeal')
  final String id;

  @JsonKey(name: 'strMeal')
  final String name;

  @JsonKey(name: 'strCategory')
  final String category;

  @JsonKey(name: 'strArea')
  final String area;

  @JsonKey(name: 'strInstructions')
  final String instructions;

  @JsonKey(name: 'strMealThumb')
  final String imageLink;

  @JsonKey(name: 'strTags')
  final String tags;

  @JsonKey(name: 'strYoutube')
  final String youtubeLink;

  @JsonKey(name: 'strSource')
  final String sourceLink;

  @JsonKey(name: 'dateModified')
  final String dateModified;

  // Ingredients. 20 is max. "" if no ingredient
  @JsonKey(name: 'strIngredient1')
  final String ingredient1;
  @JsonKey(name: 'strIngredient2')
  final String ingredient2;
  @JsonKey(name: 'strIngredient3')
  final String ingredient3;
  @JsonKey(name: 'strIngredient4')
  final String ingredient4;
  @JsonKey(name: 'strIngredient5')
  final String ingredient5;
  @JsonKey(name: 'strIngredient6')
  final String ingredient6;
  @JsonKey(name: 'strIngredient7')
  final String ingredient7;
  @JsonKey(name: 'strIngredient8')
  final String ingredient8;
  @JsonKey(name: 'strIngredient9')
  final String ingredient9;
  @JsonKey(name: 'strIngredient10')
  final String ingredient10;
  @JsonKey(name: 'strIngredient11')
  final String ingredient11;
  @JsonKey(name: 'strIngredient12')
  final String ingredient12;
  @JsonKey(name: 'strIngredient13')
  final String ingredient13;
  @JsonKey(name: 'strIngredient14')
  final String ingredient14;
  @JsonKey(name: 'strIngredient15')
  final String ingredient15;
  @JsonKey(name: 'strIngredient16')
  final String ingredient16;
  @JsonKey(name: 'strIngredient17')
  final String ingredient17;
  @JsonKey(name: 'strIngredient18')
  final String ingredient18;
  @JsonKey(name: 'strIngredient19')
  final String ingredient19;
  @JsonKey(name: 'strIngredient20')
  final String ingredient20;

  // Measures of corresponding ingredient
  // 20 is max. "" if no measure
  @JsonKey(name: 'strMeasure1')
  final String measure1;
  @JsonKey(name: 'strMeasure2')
  final String measure2;
  @JsonKey(name: 'strMeasure3')
  final String measure3;
  @JsonKey(name: 'strMeasure4')
  final String measure4;
  @JsonKey(name: 'strMeasure5')
  final String measure5;
  @JsonKey(name: 'strMeasure6')
  final String measure6;
  @JsonKey(name: 'strMeasure7')
  final String measure7;
  @JsonKey(name: 'strMeasure8')
  final String measure8;
  @JsonKey(name: 'strMeasure9')
  final String measure9;
  @JsonKey(name: 'strMeasure10')
  final String measure10;
  @JsonKey(name: 'strMeasure11')
  final String measure11;
  @JsonKey(name: 'strMeasure12')
  final String measure12;
  @JsonKey(name: 'strMeasure13')
  final String measure13;
  @JsonKey(name: 'strMeasure14')
  final String measure14;
  @JsonKey(name: 'strMeasure15')
  final String measure15;
  @JsonKey(name: 'strMeasure16')
  final String measure16;
  @JsonKey(name: 'strMeasure17')
  final String measure17;
  @JsonKey(name: 'strMeasure18')
  final String measure18;
  @JsonKey(name: 'strMeasure19')
  final String measure19;
  @JsonKey(name: 'strMeasure20')
  final String measure20;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  ProductModel(
      {this.id,
      this.name,
      this.category,
      this.area,
      this.instructions,
      this.imageLink,
      this.tags,
      this.youtubeLink,
      this.sourceLink,
      this.dateModified,
      this.ingredient1,
      this.ingredient2,
      this.ingredient3,
      this.ingredient4,
      this.ingredient5,
      this.ingredient6,
      this.ingredient7,
      this.ingredient8,
      this.ingredient9,
      this.ingredient10,
      this.ingredient11,
      this.ingredient12,
      this.ingredient13,
      this.ingredient14,
      this.ingredient15,
      this.ingredient16,
      this.ingredient17,
      this.ingredient18,
      this.ingredient19,
      this.ingredient20,
      this.measure1,
      this.measure2,
      this.measure3,
      this.measure4,
      this.measure5,
      this.measure6,
      this.measure7,
      this.measure8,
      this.measure9,
      this.measure10,
      this.measure11,
      this.measure12,
      this.measure13,
      this.measure14,
      this.measure15,
      this.measure16,
      this.measure17,
      this.measure18,
      this.measure19,
      this.measure20});
}
