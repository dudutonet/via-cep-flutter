import 'package:via_cep_mobile/src/core/rest_client/rest_client.dart';
import 'package:via_cep_mobile/src/modules/user/data/models/user_model.dart';

import '../i_user_datasource.dart';

class UserDatasource extends IUserDatasource {
  final RestClient client;

  UserDatasource({required this.client});

  @override
  Future<void> createUser(UserModel user) async {
    throw UnimplementedError();
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
          password: "dsandsnvsda",
          phone: "74945471256",
        ),
        UserModel(
          fullname: "David",
          cep: "48121457",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "dsandsnvsda",
          phone: "74945471256",
        ),
        UserModel(
          fullname: "David",
          cep: "48121457",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "dsandsnvsda",
          phone: "74945471256",
        ),
        UserModel(
          fullname: "David",
          cep: "48121457",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "dsandsnvsda",
          phone: "74945471256",
        ),
        UserModel(
          fullname: "David",
          cep: "48121457",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "dsandsnvsda",
          phone: "74945471256",
        ),
        UserModel(
          fullname: "David",
          cep: "48121457",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "dsandsnvsda",
          phone: "74945471256",
        ),
        UserModel(
          fullname: "David",
          cep: "48121457",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "dsandsnvsda",
          phone: "74945471256",
        ),
        UserModel(
          fullname: "David",
          cep: "48121457",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "dsandsnvsda",
          phone: "74945471256",
        ),
        UserModel(
          fullname: "David",
          cep: "48121457",
          complement: "casa",
          login: "david_nine",
          number: "547",
          password: "dsandsnvsda",
          phone: "74945471256",
        ),
      ],
    );
  }
}
