import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_endpoints.dart';
import 'package:themealdb/app/pages/detail/model/detail.model.dart';
import 'package:themealdb/app/utils/network_util.dart';

class DetailRepository extends Disposable {
  Future<DetailModel> fetchDetail(String idMeal) => NetworkUtil()
      .get(
          // HTTP-GET request
          url: '${NetworkEndpoints.BASE_API}/lookup.php?i=$idMeal')
      .then((dynamic response) => toList(response['meals']).then((value) {
        final _value = DetailModel.fromJson(value[0]);
            return _value;
          }));

  Future<List> toList(List _object) async {
    for (var j = 0; j < _object.length; j++) {
      List ingredientList = [];
      List measureList = [];
      for (var i = 0; i < 20; i++) {
        String _d1 = _object[j]['strIngredient${i + 1}'] ?? '';
        String _d2 = _object[j]['strMeasure${i + 1}'] ?? '';
        if (_d1.length > 0 && _d2.length > 0) {
          ingredientList.add(_d1);
          measureList.add(_d2);
        }
      }
      _object[j]['strIngredient'] = ingredientList;
      _object[j]['strMeasure'] = measureList;
    }
    return _object;
  }

  @override
  void dispose() {}
}
