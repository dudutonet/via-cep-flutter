import 'package:via_cep_mobile/src/core/rest_client/rest_client.dart';
import 'package:via_cep_mobile/src/modules/user/data/models/user_model.dart';

import '../i_user_datasource.dart';

class UserDatasource extends IUserDatasource {
  final RestClient client;

  UserDatasource({required this.client});

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
          fullname: "David",
          cep: "48121457",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "12s1231",
          phone: "47995846781",
          city: "Blumenau",
          neighborhood: "Agua branca",
          street: "Rua Bahia",
          uf: "SC",
          ibge: "123141",
        ),
      ],
    );
  }
}
