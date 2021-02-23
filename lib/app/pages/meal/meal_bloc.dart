import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:themealdb/app/pages/meal/repository/meal_repository.dart';

import 'model/meals_model.dart';

class MealBloc extends Disposable{
  final MealRepository mealRepository;

  MealBloc(this.mealRepository);

  BehaviorSubject<MealsModel> mealsModel$ = BehaviorSubject<MealsModel>();

  Future fetchMeal(String _meal) async{
    var _mealModel = await mealRepository.fetchMeal(_meal);
    print(_mealModel.toJson());
    mealsModel$.add(_mealModel);
  }

  @override
  void dispose() {
    mealsModel$.close();
  }

}