// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoriesModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.meals,
  });

  List<Meal> meals;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}

class Meal {
  Meal({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  String strMeal;
  String strMealThumb;
  String idMeal;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    strMeal: json["strMeal"],
    strMealThumb: json["strMealThumb"],
    idMeal: json["idMeal"],
  );

  Map<String, dynamic> toJson() => {
    "strMeal": strMeal,
    "strMealThumb": strMealThumb,
    "idMeal": idMeal,
  };
}
