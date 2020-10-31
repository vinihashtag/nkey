import 'package:flutter_modular/flutter_modular.dart';

import 'home_bloc.dart';
import 'home_page.dart';
import 'interfaces/home_repository_interface.dart';
import 'repositories/home_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeBloc(i())),
        Bind<IHomeRepository>((i) => HomeRepository(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
