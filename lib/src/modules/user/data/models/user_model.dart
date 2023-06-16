import 'package:via_cep_mobile/src/modules/user/data/models/cep_model.dart';
import 'package:via_cep_mobile/src/modules/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.fullname,
    required super.login,
    required super.password,
    required super.number,
    required super.complement,
    required super.phone,
    required super.cepEntity,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "fullname": fullname,
      "login": login,
      "password": password,
      "cepEntity": cepEntity,
      "number": number,
      "complement": complement,
      "phone": phone,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"],
      fullname: map["nome"],
      login: map["login"],
      password: map["password"],
      cepEntity: CepModel.fromMap(map["cep"]),
      number: map["numero"],
      complement: map["complemento"],
      phone: map["telefone"],
    );
  }

  static UserModel fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      fullname: entity.fullname,
      login: entity.login,
      password: entity.password,
      cepEntity: entity.cepEntity,
      number: entity.number,
      complement: entity.complement,
      phone: entity.phone,
    );
  }
}
