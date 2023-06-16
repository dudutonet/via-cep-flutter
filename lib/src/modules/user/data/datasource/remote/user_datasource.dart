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
          cepEntity: null,
          fullname: "David",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "12s1231",
          phone: "47995846781",
        ),
        UserModel(
          id: 2,
          cepEntity: null,
          fullname: "Vitor",
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
    final result = await client.get('/api/v1/user/$id');
    return UserModel.fromMap(result.data);
  }
}
