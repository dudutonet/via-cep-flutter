import 'package:flutter_modular/flutter_modular.dart';
import 'package:via_cep_mobile/src/modules/shared/domain/usecases/get_address_by_cep_usecase.dart';
import 'package:via_cep_mobile/src/modules/user/data/datasource/i_cep_datasource.dart';
import 'package:via_cep_mobile/src/modules/user/data/datasource/i_user_datasource.dart';
import 'package:via_cep_mobile/src/modules/user/data/datasource/remote/cep_datasource.dart';
import 'package:via_cep_mobile/src/modules/user/data/repositories/cep_repository.dart';
import 'package:via_cep_mobile/src/modules/user/domain/repositories/i_cep_repository.dart';
import 'package:via_cep_mobile/src/modules/user/domain/repositories/i_user_repository.dart';
import 'package:via_cep_mobile/src/modules/user/domain/usecases/create_cep_usecase.dart';
import 'package:via_cep_mobile/src/modules/user/domain/usecases/create_user_usecase.dart';
import 'package:via_cep_mobile/src/modules/user/domain/usecases/get_user_address_usecase.dart';
import 'package:via_cep_mobile/src/modules/user/domain/usecases/get_user_by_id_usecase.dart';
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
        Bind.lazySingleton<ICepDatasource>(
            (i) => CepDatasource(client: i.get())),
        Bind.lazySingleton<IUserDatasource>(
            (i) => UserDatasource(client: i.get(), repository: i.get())),
        //Repositories
        Bind.lazySingleton<IUserRepository>(
            (i) => UserRepository(datasource: i.get())),
        Bind.lazySingleton<ICepRepository>(
            (i) => CepRepository(datasource: i.get())),
        //Usecases
        Bind.lazySingleton<ICreateUserUsecase>(
            (i) => CreateUserUsecase(repository: i.get())),
        Bind.lazySingleton<IListUsersUsecase>(
            (i) => ListUsersUsecase(repository: i.get())),
        Bind.lazySingleton<IGetUserAddresUsecase>(
            (i) => GetUserAddresUsecase(repository: i.get())),
        Bind.lazySingleton<ICreateCepUsecase>(
            (i) => CreateCepUsecase(repository: i.get())),
        Bind.lazySingleton<IGetUserByIdUsecase>(
            (i) => GetUserByIdUsecase(repository: i.get())),
        Bind.lazySingleton<IGetAddressByCepUsecase>(
            (i) => GetAddressByCepUsecase(repository: i.get())),
        //Controllers
        Bind.lazySingleton<ListUserController>(
            (i) => ListUserController(listUsersUsecase: i.get())),
        Bind.lazySingleton<NewUserController>((i) => NewUserController(
              createUserUsecase: i.get(),
              getAddressByCepUsecase: i.get(),
              createCepUsecase: i.get(),
              getUserAddresUsecase: i.get(),
              getUserByIdUsecase: i.get(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ListUsersPage()),
        ChildRoute('/new_user',
            child: (context, args) => NewUserPage(userId: args.data)),
      ];
}
