// To parse this JSON data, do
//
//     final mealsModel = mealsModelFromJson(jsonString);

import 'dart:convert';

MealsModel mealsModelFromJson(String str) => MealsModel.fromJson(json.decode(str));

String mealsModelToJson(MealsModel data) => json.encode(data.toJson());

class MealsModel {
  MealsModel({
    this.meals,
  });

  List<Meal> meals;

  factory MealsModel.fromJson(Map<String, dynamic> json) => MealsModel(
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
