import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/pages/meal/meal_module.dart';

class FavoriteView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return RouterOutlet(module: MealModule());
  }
}