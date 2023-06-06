import 'package:via_cep_mobile/src/core/rest_client/rest_client.dart';
import 'package:via_cep_mobile/src/modules/user/data/models/user_model.dart';
import 'package:via_cep_mobile/src/modules/user/domain/repositories/i_cep_repository.dart';

import '../i_user_datasource.dart';

class UserDatasource extends IUserDatasource {
  final RestClient client;
  final ICepRepository repository;

  UserDatasource({required this.client, required this.repository});

  @override
  Future<void> createUser(UserModel user) async {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<List<UserModel>> listUsers() async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        UserModel(
          id: 1,
          fullname: "David",
          cep: "48121457",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "12s1231",
          phone: "47995846781",
        ),
        UserModel(
          id: 2,
          fullname: "Vitor",
          cep: "48121457",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "12s1231",
          phone: "47995846781",
        ),
      ],
    );
  }

  @override
  Future<UserModel?> getById(int id) async {
    return await Future.delayed(const Duration(seconds: 2), () async {
      final cepEntity = await repository.getByCep("457");
      return cepEntity.fold((i) => null, (cep) {
        return UserModel(
          id: 1,
          fullname: "David",
          cep: "48121457",
          cepEntity: cep,
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "12s1231",
          phone: "47995846781",
        );
      });
    });
  }
}
