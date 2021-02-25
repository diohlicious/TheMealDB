import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/pages/about/about_module.dart';
import 'package:themealdb/app/pages/detail/detail_module.dart';
import 'package:themealdb/app/pages/drawer/drawer_module.dart';
import 'package:themealdb/app/pages/home/home_module.dart';
import 'package:themealdb/app/pages/meal/meal_module.dart';

import 'app_bloc.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
    Bind((i) => AppBloc()),

  ];

  // Provide all the routes for your module
  @override
  List<ModularRouter> get routers => [
    ModularRouter("/", module: DrawerModule()),
    ModularRouter("/home", module: HomeModule()),
    ModularRouter("/meal", module: MealModule()),
    ModularRouter("/detail", module: DetailModule()),
    ModularRouter("/about", module: AboutModule()),
  ];

  // Provide the root widget associated with your module
  // In this case, it's the widget you created in the first step
  @override
  Widget get bootstrap => AppWidget();
}