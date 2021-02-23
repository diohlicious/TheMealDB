import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_endpoints.dart';
import 'package:themealdb/app/pages/home/model/categories_model.dart';
import 'package:themealdb/app/utils/network_util.dart';

class HomeRepository extends Disposable{

  Future<CategoriesModel> fetchCategories() => NetworkUtil()
      .get(
    // HTTP-GET request
      url: '${NetworkEndpoints.BASE_API}/categories.php')
      .then((dynamic response) {
    //final resStr = jsonEncode(response);
    //final Map parsed = jsonDecode(resStr);
    final _detailModel = CategoriesModel.fromJson(response);
    return _detailModel; // Map json response to TokenModel object
  });

  @override
  void dispose() {
  }
}