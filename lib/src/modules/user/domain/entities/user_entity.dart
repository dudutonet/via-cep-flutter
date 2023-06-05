import 'package:via_cep_mobile/src/modules/user/domain/entities/cep_entity.dart';

class UserEntity {
  final String? fullname;
  final String? login;
  final String? password;
  final CepEntity? cep;
  final String? number;
  final String? complement;
  final String? phone;

  UserEntity({
    this.fullname,
    this.login,
    this.password,
    this.cep,
    this.number,
    this.complement,
    this.phone,
  });

  UserEntity copyWith({
    String? fullname,
    String? login,
    String? password,
    CepEntity? cep,
    String? number,
    String? complement,
    String? phone,
  }) {
    return UserEntity(
      complement: complement ?? this.complement,
      fullname: fullname ?? this.fullname,
      login: login ?? this.login,
      cep: cep ?? this.cep,
      number: number ?? this.number,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }
}
