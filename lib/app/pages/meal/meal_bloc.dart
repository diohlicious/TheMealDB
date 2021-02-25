import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:themealdb/app/pages/home/model/categories_model.dart';
import 'package:themealdb/app/pages/meal/repository/meal_repository.dart';
import 'package:themealdb/app/utils/shared_prefs_util.dart';

class MealBloc extends Disposable {
  final MealRepository mealRepository;

  MealBloc(this.mealRepository);

  BehaviorSubject<Category> detailModel$ = BehaviorSubject<Category>();

  Future fetchMeal(Category category) async {
    Category _categoryModel;
    if (category == null) {
      Map _catMap = jsonDecode(sharedPrefs.fav);
      _categoryModel = Category.fromJson(_catMap);
      detailModel$.add(_categoryModel);
    } else {
      category.meals == null
          ? mealRepository
              .fetchMeal(category)
              .then((value) => detailModel$.add(value))
          : detailModel$.add(category);
    }
  }

  @override
  void dispose() {
    detailModel$.close();
  }
}
