class UserEntity {
  final String? fullname;
  final String? login;
  final String? password;
  final String? cep;
  final String? street;
  final String? neighborhood;
  final String? city;
  final String? uf;
  final String? ibge;
  final String? number;
  final String? complement;
  final String? phone;

  UserEntity({
    this.fullname,
    this.login,
    this.password,
    this.cep,
    this.street,
    this.neighborhood,
    this.city,
    this.uf,
    this.ibge,
    this.number,
    this.complement,
    this.phone,
  });

  UserEntity copyWith({
    String? fullname,
    String? login,
    String? password,
    String? cep,
    String? street,
    String? neighborhood,
    String? city,
    String? uf,
    String? ibge,
    String? number,
    String? complement,
    String? phone,
  }) {
    return UserEntity(
      complement: complement ?? this.complement,
      fullname: fullname ?? this.fullname,
      login: login ?? this.login,
      cep: cep ?? this.cep,
      street: street ?? this.street,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      uf: uf ?? this.uf,
      ibge: ibge ?? this.ibge,
      number: number ?? this.number,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }
}
