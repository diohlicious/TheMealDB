import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_endpoints.dart';
import 'package:themealdb/app/pages/meal/model/meals_model.dart';
import 'package:themealdb/app/utils/network_util.dart';

class MealRepository extends Disposable{

  Future<MealsModel> fetchMeal(String _meal) => NetworkUtil()
      .get(
    // HTTP-GET request
      url: '${NetworkEndpoints.BASE_API}/filter.php?c=$_meal')
      .then((dynamic response) {
    final _detailModel = MealsModel.fromJson(response);
    return _detailModel; // Map json response to TokenModel object
  });

  @override
  void dispose() {}
}