import 'package:flutter_modular/flutter_modular.dart';

import 'about_bloc.dart';
import 'about_page.dart';

class AboutModule extends ChildModule{

  static Inject get to => Inject<AboutModule>.of();

  @override
  List<Bind> get binds => [
    Bind((i) => AboutBloc()),
  ];


  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, __) => AboutPage())
  ];

}