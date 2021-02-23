import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/pages/drawer/repositories/drawer_repositories.dart';

import 'drawer_bloc.dart';
import 'drawer_page.dart';
class DrawerModule extends ChildModule {
  static Inject get to => Inject<MainModule>.of();

  @override
  List<Bind> get binds => [
    Bind((i) => DrawerBloc(i.get())),
    Bind((i) => DrawerRepository()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => DrawerPage()),
  ];
}