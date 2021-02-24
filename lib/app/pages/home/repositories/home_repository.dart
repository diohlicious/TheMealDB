import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_endpoints.dart';
import 'package:themealdb/app/pages/detail/repositories/detail_repository.dart';
import 'package:themealdb/app/pages/home/model/categories_model.dart';
import 'package:themealdb/app/utils/network_util.dart';

class HomeRepository extends Disposable{

  Future<CategoriesModel> fetchCategories() => NetworkUtil()
      .get(
    // data for home cointain list category
      url: '${NetworkEndpoints.BASE_API}/categories.php')
      .then((dynamic response) {
    final _detailModel = CategoriesModel.fromJson(response);
    return _detailModel; // Map json response to TokenModel object
  });


  Future<Category> searchMeal(String _mealStr) => NetworkUtil()
      .get(
    // Return with detail
      url: '${NetworkEndpoints.BASE_API}/search.php?s=$_mealStr')
      .then((dynamic response) => DetailRepository().toList(response['meals']).then((value) {
    Map<String, dynamic> _catJson = new Map();
    _catJson.addAll({
      "idCategory":"",
      "strCategory":"Search Result",
      "strCategoryDescription":"",
      "strCategoryThumb":"${NetworkEndpoints.BASE_URL}/images/meal-icon.png",
      "meals": value,

    });

    Category _cat = Category.fromJson(_catJson);
    return _cat; // Map json response to TokenModel object
  }));

  @override
  void dispose() {
  }
}