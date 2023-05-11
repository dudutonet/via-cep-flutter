class AddressViacepEntity {
  final String? cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String ibge;

  AddressViacepEntity({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
  });

  AddressViacepEntity copyWith({
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
    String? ibge,
  }) {
    return AddressViacepEntity(
      bairro: bairro ?? this.bairro,
      cep: cep ?? this.cep,
      complemento: complemento ?? this.complemento,
      ibge: ibge ?? this.ibge,
      localidade: localidade ?? this.localidade,
      logradouro: logradouro ?? this.logradouro,
      uf: uf ?? this.uf,
    );
  }
}
