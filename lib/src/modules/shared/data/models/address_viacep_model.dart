import '../../domain/entities/address_viacep_entity.dart';

class AddressViacepModel extends AddressViacepEntity {
  AddressViacepModel({
    required super.cep,
    required super.logradouro,
    required super.complemento,
    required super.bairro,
    required super.localidade,
    required super.uf,
    required super.ibge,
  });

  static AddressViacepModel fromMap(Map<String, dynamic> map) {
    return AddressViacepModel(
      bairro: map["bairro"],
      cep: map["cep"],
      complemento: map["complemento"],
      ibge: map["ibge"],
      localidade: map["localidade"],
      logradouro: map["logradouro"],
      uf: map["uf"],
    );
  }
}
