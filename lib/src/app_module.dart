import 'package:flutter_modular/flutter_modular.dart';
import 'package:via_cep_mobile/src/core/rest_client/dio/dio_rest_client.dart';
import 'package:via_cep_mobile/src/core/rest_client/rest_client.dart';
import 'package:via_cep_mobile/src/modules/shared/shared_module.dart';

import 'modules/user/user_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        SharedModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.lazySingleton<RestClient>((i) => DioRestClient()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: UserModule()),
      ];
}
