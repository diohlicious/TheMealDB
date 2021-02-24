import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themealdb/app/network/network_endpoints.dart';
import 'package:themealdb/app/pages/home/model/categories_model.dart';
import 'package:themealdb/app/utils/shared_prefs_util.dart';

class DrawerRepository extends Disposable {

  Future initFav() async{
    Map<String, dynamic> _map =new Map();
    _map.addAll({
      "idCategory":"",
      "strCategory":"Favorite",
      "strCategoryDescription":"",
      "strCategoryThumb":"${NetworkEndpoints.BASE_URL}/images/meal-icon.png",
      "meals": [],
    });
    var _mapStr=jsonEncode(_map);
    sharedPrefs.fav=_mapStr;
  }

  Future<Category> readFav() async {
    final prefs = await SharedPreferences.getInstance();
    final parsed = prefs.getString('fav');
    final nameMap = jsonDecode(parsed);
    final nameCat = Category.fromJson(nameMap);
    print('ini parsed $parsed');
    return nameCat;
  }

  @override
  void dispose() {}
}


