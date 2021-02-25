import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/pages/meal/repository/meal_repository.dart';

import 'meal_bloc.dart';
import 'meal_page.dart';

class MealModule extends ChildModule {
  static Inject get to => Inject<MealModule>.of();

  @override
  List<Bind> get binds => [
    Bind((i) => MealBloc(i.get())),
    Bind((i) => MealRepository()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => MealPage(category: args.data,)),
  ];
}