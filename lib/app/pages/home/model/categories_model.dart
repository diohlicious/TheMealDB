// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

import 'package:themealdb/app/pages/detail/model/detail.model.dart';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    this.categories,
  });

  List<Category> categories;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category(
      {this.idCategory,
      this.strCategory,
      this.strCategoryThumb,
      this.strCategoryDescription,
      this.viewType,
      this.meals});

  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;
  String viewType;
  List<DetailModel> meals;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        strCategoryDescription: json["strCategoryDescription"],
        viewType: json["viewType"],
        meals: json["meals"]==null?null:List<DetailModel>.from(json["meals"].map((x) => DetailModel.fromJson(x)))
      );

  Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
        "viewType": viewType,
        "meals": meals==null?null:List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}
