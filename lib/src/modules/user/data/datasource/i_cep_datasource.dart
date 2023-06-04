import 'package:via_cep_mobile/src/modules/user/data/models/cep_model.dart';

abstract class ICepDatasource {
  Future<void> createCep(CepModel cep);
  Future<CepModel> getByCep(String cep);
}
