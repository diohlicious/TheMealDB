import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/network/network_endpoints.dart';
import 'package:themealdb/app/pages/detail/model/detail.model.dart';
import 'package:themealdb/app/utils/network_util.dart';

class DetailRepository extends Disposable{

  Future<DetailModel> fetchDetail(String idMeal) => NetworkUtil()
      .get(
    // HTTP-GET request
      url: '${NetworkEndpoints.BASE_API}/lookup.php?i=$idMeal')
      .then((dynamic response) {
        List ingredientList=[];
        List measureList=[];
        for(var i =0; i<20; i++){
          String _d1 = response['meals'][0]['strIngredient${i+1}']??'';
          String _d2 = response['meals'][0]['strMeasure${i+1}']??'';
          if(_d1.length>0&&_d2.length>0){
            ingredientList.add(_d1);
            measureList.add(_d2);
          }
        }
        response['meals'][0]['strIngredient']=ingredientList;
        response['meals'][0]['strMeasure']=measureList;
    final _detailModel = DetailModel.fromJson(response['meals'][0]);
    return _detailModel; // Map json response to TokenModel object
  });

  @override
  void dispose() {}
}