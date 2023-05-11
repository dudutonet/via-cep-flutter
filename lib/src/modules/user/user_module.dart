import 'package:flutter_modular/flutter_modular.dart';
import 'package:via_cep_mobile/src/modules/user/data/datasource/i_user_datasource.dart';
import 'package:via_cep_mobile/src/modules/user/domain/repositories/i_user_repository.dart';
import 'package:via_cep_mobile/src/modules/user/domain/usecases/create_user_usecase.dart';
import 'package:via_cep_mobile/src/modules/user/domain/usecases/list_users_usecase.dart';
import 'package:via_cep_mobile/src/modules/user/presentation/controllers/list_user_controller.dart';
import 'package:via_cep_mobile/src/modules/user/presentation/controllers/new_user_controller.dart';
import 'package:via_cep_mobile/src/modules/user/presentation/pages/list_users_page.dart';
import 'package:via_cep_mobile/src/modules/user/presentation/pages/new_user_page.dart';

import 'data/datasource/remote/user_datasource.dart';
import 'data/repositories/user_repository.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [
        //Datasources
        Bind.lazySingleton<IUserDatasource>((i) => UserDatasource(client: i.get())),
        //Repositories
        Bind.lazySingleton<IUserRepository>((i) => UserRepository(datasource: i.get())),
        //Usecases
        Bind.lazySingleton<ICreateUserUsecase>((i) => CreateUserUsecase(repository: i.get())),
        Bind.lazySingleton<IListUsersUsecase>((i) => ListUsersUsecase(repository: i.get())),
        //Controllers
        Bind.lazySingleton<ListUserController>((i) => ListUserController(listUsersUsecase: i.get())),
        Bind.lazySingleton<NewUserController>((i) => NewUserController(
              createUserUsecase: i.get(),
              getAddressByCepUsecase: i.get(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ListUsersPage()),
        ChildRoute('/new_user', child: (context, args) => NewUserPage(user: args.data)),
      ];
}
