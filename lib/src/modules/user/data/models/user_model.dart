import 'package:via_cep_mobile/src/modules/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.fullname,
    required super.login,
    required super.password,
    required super.cep,
    required super.number,
    required super.complement,
    required super.phone,
    super.cepEntity,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "fullname": fullname,
      "login": login,
      "password": password,
      "cep": cep,
      "cepEntity": cepEntity,
      "number": number,
      "complement": complement,
      "phone": phone,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"],
      fullname: map["fullname"],
      login: map["login"],
      password: map["password"],
      cep: map["cep"],
      cepEntity: map["cepEntity"],
      number: map["number"],
      complement: map["complement"],
      phone: map["phone"],
    );
  }

  static UserModel fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      fullname: entity.fullname,
      login: entity.login,
      password: entity.password,
      cep: entity.cep,
      cepEntity: entity.cepEntity,
      number: entity.number,
      complement: entity.complement,
      phone: entity.phone,
    );
  }
}
