import 'package:flutter_modular/flutter_modular.dart';
import 'package:via_cep_mobile/src/modules/shared/data/datasource/remote/shared_datasource_imp.dart';
import 'package:via_cep_mobile/src/modules/shared/data/datasource/shared_datasource.dart';
import 'package:via_cep_mobile/src/modules/shared/data/repository/shared_repository_imp.dart';
import 'package:via_cep_mobile/src/modules/shared/domain/repository/shared_repository.dart';
import 'package:via_cep_mobile/src/modules/shared/domain/usecases/get_address_by_cep_usecase.dart';

class SharedModule extends Module {
  @override
  List<Bind> get binds => [
        // Datasource
        Bind.lazySingleton<SharedDatasource>(
          (i) => SharedDatasourceImp(i.get()),
          export: true,
        ),

        // Repositories
        Bind.lazySingleton<SharedRepository>(
          (i) => SharedRepositoryImp(i.get()),
          export: true,
        ),

        // Usecases
        Bind.lazySingleton<GetAddressByCepUsecase>(
          (i) => GetAddressByCepUsecase(repository: i.get()),
          export: true,
        ),
      ];

  @override
  List<ModularRoute> get routes => [];
}
