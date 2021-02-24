import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:themealdb/app/pages/home/model/categories_model.dart';
import 'package:themealdb/app/pages/meal/repository/meal_repository.dart';


class MealBloc extends Disposable{
  final MealRepository mealRepository;

  MealBloc(this.mealRepository);

  BehaviorSubject<Category> detailModel$ = BehaviorSubject<Category>();

  Future fetchMeal(Category category) async{
    var _detailModel = await mealRepository.fetchMeal(category);
    detailModel$.add(_detailModel);
  }

  @override
  void dispose() {
    detailModel$.close();
  }

}