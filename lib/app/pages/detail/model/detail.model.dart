// To parse this JSON data, do
//
//     final detailModel = detailModelFromJson(jsonString);

import 'dart:convert';

DetailModel detailModelFromJson(String str) => DetailModel.fromJson(json.decode(str));

String detailModelToJson(DetailModel data) => json.encode(data.toJson());

class DetailModel {
  DetailModel({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient,
    this.strMeasure,
    this.strSource,
    this.dateModified,
  });

  String idMeal;
  String strMeal;
  dynamic strDrinkAlternate;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;
  String strTags;
  String strYoutube;
  List<String> strIngredient;
  List<String> strMeasure;
  dynamic strSource;
  dynamic dateModified;

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
    idMeal: json["idMeal"],
    strMeal: json["strMeal"],
    strDrinkAlternate: json["strDrinkAlternate"],
    strCategory: json["strCategory"],
    strArea: json["strArea"],
    strInstructions: json["strInstructions"],
    strMealThumb: json["strMealThumb"],
    strTags: json["strTags"],
    strYoutube: json["strYoutube"],
    strIngredient: json["strIngredient"]==null?[]:List<String>.from(json["strIngredient"].map((x) => x)),
    strMeasure: json["strMeasure"]==null?[]:List<String>.from(json["strMeasure"].map((x) => x)),
    strSource: json["strSource"],
    dateModified: json["dateModified"],
  );

  Map<String, dynamic> toJson() => {
    "idMeal": idMeal,
    "strMeal": strMeal,
    "strDrinkAlternate": strDrinkAlternate,
    "strCategory": strCategory,
    "strArea": strArea,
    "strInstructions": strInstructions,
    "strMealThumb": strMealThumb,
    "strTags": strTags,
    "strYoutube": strYoutube,
    "strIngredient": List<dynamic>.from(strIngredient.map((x) => x)),
    "strMeasure": List<dynamic>.from(strMeasure.map((x) => x)),
    "strSource": strSource,
    "dateModified": dateModified,
  };
}
