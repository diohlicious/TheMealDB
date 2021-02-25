import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/pages/about/about_module.dart';

class AboutView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RouterOutlet(module: AboutModule());
  }

}