import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:themealdb/app/pages/home/model/categories_model.dart';
import 'package:themealdb/app/pages/home/repositories/home_repository.dart';
import 'package:themealdb/app/pages/meal/model/meals_model.dart';


class HomeBloc extends Disposable{

  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository);

  BehaviorSubject<CategoriesModel> categoriesModel$ = BehaviorSubject<CategoriesModel>();

  String _txtSearch;

  String get txtSearch => _txtSearch;

  setTxtSearch(String val){
    _txtSearch=val;
    notifyListener();
  }

  Future fetchCategories() async {
    var _categoriesModel = await homeRepository.fetchCategories();
    categoriesModel$.add(_categoriesModel);
  }

  Future searchMeal() async {
    //go to meals page
    await homeRepository.searchMeal(txtSearch).then((value) =>
        Modular.to.pushNamed('/meal', arguments: value,
        ));
  }

  @override
  void dispose() {
    categoriesModel$.close();
  }

  void notifyListener() {}

}