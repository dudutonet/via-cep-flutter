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
    required super.city,
    required super.ibge,
    required super.neighborhood,
    required super.street,
    required super.uf,
  });

  Map<String, dynamic> toMap() {
    return {
      "fullname": fullname,
      "login": login,
      "password": password,
      "cep": cep,
      "number": number,
      "complement": complement,
      "phone": phone,
      "city": city,
      "ibge": ibge,
      "neighborhood": neighborhood,
      "street": street,
      "uf": uf,
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
      city: map["city"],
      ibge: map["ibge"],
      neighborhood: map["neighborhood"],
      street: map["street"],
      uf: map["uf"],
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
      city: entity.city,
      ibge: entity.ibge,
      neighborhood: entity.neighborhood,
      street: entity.street,
      uf: entity.uf,
    );
  }
}
