import 'package:via_cep_mobile/src/modules/user/domain/entities/cep_entity.dart';

class CepModel extends CepEntity {
  CepModel({
    required super.cep,
    required super.city,
    required super.ibge,
    required super.neighborhood,
    required super.street,
    required super.uf,
    required super.ddd,
  });

  Map<String, dynamic> toMap() {
    return {
      "cep": cep,
      "city": city,
      "ibge": ibge,
      "neighborhood": neighborhood,
      "street": street,
      "uf": uf,
      "ddd": ddd,
    };
  }

  static CepModel fromMap(Map<String, dynamic> map) {
    return CepModel(
      cep: '${map["cep"]}',
      city: map["cidade"],
      ibge: '${map["ibge"]}',
      neighborhood: map["bairro"],
      street: map["logradouro"],
      uf: map["uf"],
      ddd: '${map["ddd"]}',
    );
  }

  static CepModel fromEntity(CepEntity entity) {
    return CepModel(
      cep: entity.cep,
      city: entity.city,
      ibge: entity.ibge,
      neighborhood: entity.neighborhood,
      street: entity.street,
      uf: entity.uf,
      ddd: entity.ddd,
    );
  }
}
