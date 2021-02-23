import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_endpoints.dart';
import 'package:themealdb/app/pages/home/model/categories_model.dart';
import 'package:themealdb/app/pages/meal/model/meals_model.dart';
import 'package:themealdb/app/utils/network_util.dart';

class HomeRepository extends Disposable{

  Future<CategoriesModel> fetchCategories() => NetworkUtil()
      .get(
    // HTTP-GET request
      url: '${NetworkEndpoints.BASE_API}/categories.php')
      .then((dynamic response) {
    final _detailModel = CategoriesModel.fromJson(response);
    return _detailModel; // Map json response to TokenModel object
  });

  Future<MealsModel> searchMeal(String _mealStr) => NetworkUtil()
      .get(
    // HTTP-GET request
      url: '${NetworkEndpoints.BASE_API}/search.php?s=$_mealStr')
      .then((dynamic response) {
    final _mealModel = MealsModel.fromJson(response);
    return _mealModel; // Map json response to TokenModel object
  });

  @override
  void dispose() {
  }
}