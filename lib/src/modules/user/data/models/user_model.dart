import 'package:via_cep_mobile/src/modules/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.fullname,
    required super.login,
    required super.password,
    required super.cep,
    required super.number,
    required super.complement,
    required super.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      "fullname": fullname,
      "login": login,
      "password": password,
      "cep": cep,
      "number": number,
      "complement": complement,
      "phone": phone
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullname: map["fullname"],
      login: map["login"],
      password: map["password"],
      cep: map["cep"],
      number: map["number"],
      complement: map["complement"],
      phone: map["phone"],
    );
  }

  static UserModel fromEntity(UserEntity entity) {
    return UserModel(
      fullname: entity.fullname,
      login: entity.login,
      password: entity.password,
      cep: entity.cep,
      number: entity.number,
      complement: entity.complement,
      phone: entity.phone,
    );
  }
}
