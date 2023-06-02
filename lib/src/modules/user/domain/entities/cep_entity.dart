class CepEntity {
  final String? cep;
  final String? street;
  final String? neighborhood;
  final String? city;
  final String? uf;
  final String? ibge;
  final String? ddd;

  CepEntity({
    this.cep,
    this.street,
    this.neighborhood,
    this.city,
    this.uf,
    this.ibge,
    this.ddd,
  });

  CepEntity copyWith({
    String? cep,
    String? street,
    String? neighborhood,
    String? city,
    String? uf,
    String? ibge,
    String? ddd,
  }) {
    return CepEntity(
      cep: cep ?? this.cep,
      street: street ?? this.street,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      uf: uf ?? this.uf,
      ibge: ibge ?? this.ibge,
      ddd: ddd ?? this.ddd,
    );
  }
}
