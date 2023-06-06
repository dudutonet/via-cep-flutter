import 'package:via_cep_mobile/src/modules/user/data/models/user_model.dart';

abstract class IUserDatasource {
  Future<void> createUser(UserModel user);
  Future<List<UserModel>> listUsers();
  Future<UserModel?> getById(int id);
}
