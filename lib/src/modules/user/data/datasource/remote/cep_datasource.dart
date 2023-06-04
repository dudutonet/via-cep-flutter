import 'package:via_cep_mobile/src/core/rest_client/rest_client.dart';
import 'package:via_cep_mobile/src/modules/user/data/datasource/i_cep_datasource.dart';
import 'package:via_cep_mobile/src/modules/user/data/models/cep_model.dart';

class CepDatasource extends ICepDatasource {
  final RestClient client;

  CepDatasource({required this.client});

  @override
  Future<void> createCep(CepModel cep) async {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<CepModel> getByCep(String cep) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => CepModel(
        cep: "48121457",
        city: "Blumenau",
        neighborhood: "Agua branca",
        street: "Rua Bahia",
        uf: "SC",
        ibge: "123141",
        ddd: "12",
      ),
    );
  }
}
