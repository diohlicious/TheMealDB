import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:themealdb/app/pages/home/repositories/home_repository.dart';

import 'model/categories_model.dart';

class HomeBloc extends Disposable{

  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository);

  BehaviorSubject<CategoriesModel> categoriesModel$ = BehaviorSubject<CategoriesModel>();

  Future fetchCategories() async {
    var _categoriesModel = await homeRepository.fetchCategories();
    print(_categoriesModel.toJson());
    categoriesModel$.add(_categoriesModel);
  }

  @override
  void dispose() {
    categoriesModel$.close();
  }

}