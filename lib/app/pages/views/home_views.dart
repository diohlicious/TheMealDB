import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/pages/home/home_module.dart';

class HomeView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RouterOutlet(module: HomeModule());
  }

}