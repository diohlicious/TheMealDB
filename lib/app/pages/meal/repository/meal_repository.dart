import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_endpoints.dart';
import 'package:themealdb/app/pages/detail/model/detail.model.dart';
import 'package:themealdb/app/pages/home/model/categories_model.dart';
import 'package:themealdb/app/utils/network_util.dart';

class MealRepository extends Disposable {
  Future<Category> fetchMeal(Category _category) => NetworkUtil()
          .get(
              // HTTP-GET request
              url:
                  '${NetworkEndpoints.BASE_API}/filter.php?c=${_category.strCategory}')
          .then((dynamic response) {
        Map<String, dynamic> _map = Map();
        _map.addAll(_category.toJson());
        _map.addAll(response);
        Category _categoryModel = _category;
        _categoryModel = Category.fromJson(_map);
        //final _categoryModel = Category.fromJson(_cat);
        return _categoryModel; // Map json response to TokenModel object
      });

  @override
  void dispose() {}
}
