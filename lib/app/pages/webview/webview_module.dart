import 'package:flutter_modular/flutter_modular.dart';
import 'package:themealdb/app/pages/webview/webview_bloc.dart';
import 'package:themealdb/app/pages/webview/webview_page.dart';

class WebviewModule extends ChildModule {
  static Inject get to => Inject<WebviewModule>.of();

  @override
  List<Bind> get binds => [
        Bind((i) => WebviewBloc()),
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter("/", child: (_, __) => WebviewPage()),
      ];
}

