import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_endpoints.dart';
import 'package:themealdb/app/pages/detail/model/detail.model.dart';
import 'package:themealdb/app/pages/home/model/categories_model.dart';
import 'package:themealdb/app/utils/network_util.dart';
import 'package:themealdb/app/utils/shared_prefs_util.dart';

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


  Future<String> setFav(DetailModel _detailModel) async {
      String _alert = '';
      int _idExist;
      final prefsStr = sharedPrefs.fav;
      final prefsMap = jsonDecode(prefsStr);
      Category _cat = Category.fromJson(prefsMap);
      if (_cat.meals.isEmpty) {
        print('empty');
        _cat.meals.add(_detailModel);
        _alert = 'Added To Favorite';
      } else {
        for (var i = 0; i < prefsMap['meals'].length; i++) {
          if (prefsMap['meals'][i]['idMeal'] == _detailModel.idMeal) {
            _idExist = i;
          }
        }
        if(_idExist!=null){
          _cat.meals.removeAt(_idExist);
          _alert = 'Deleted from Favorite';
          print('$_alert');
        }else{
          _cat.meals.insert(0, _detailModel);
          _alert = 'Added To Favorite';
          print('$_alert');

        }
      }
    final prefsNew = jsonEncode(_cat.toJson());
    sharedPrefs.fav = prefsNew;
    return _alert;
  }

  @override
  void dispose() {}

  void notifyListener() {}
}
