import 'package:via_cep_mobile/src/modules/user/domain/entities/cep_entity.dart';

class UserEntity {
  final int? id;
  final String? fullname;
  final String? login;
  final String? cep;
  final CepEntity? cepEntity;
  final String? password;
  final String? number;
  final String? complement;
  final String? phone;

  UserEntity({
    this.id,
    this.fullname,
    this.login,
    this.password,
    this.cepEntity,
    this.cep,
    this.number,
    this.complement,
    this.phone,
  });

  UserEntity copyWith({
    int? id,
    String? fullname,
    String? login,
    String? password,
    CepEntity? cepEntity,
    String? cep,
    String? number,
    String? complement,
    String? phone,
  }) {
    return UserEntity(
      id: id ?? this.id,
      complement: complement ?? this.complement,
      fullname: fullname ?? this.fullname,
      login: login ?? this.login,
      cepEntity: cepEntity ?? this.cepEntity,
      cep: cep ?? this.cep,
      number: number ?? this.number,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }
}
