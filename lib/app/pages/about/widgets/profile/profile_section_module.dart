import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/pages/about/about_bloc.dart';
import 'package:themealdb/app/pages/about/widgets/profile/profile_section_widget.dart';


class ProfileSectionModule extends ChildModule{

  static Inject get to => Inject<ProfileSectionModule>.of();

  @override
  List<Bind> get binds => [
    Bind((i) => AboutBloc()),
  ];


  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, __) => ProfileSectionWidget())
  ];

}