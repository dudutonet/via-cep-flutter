import 'package:via_cep_mobile/src/core/rest_client/rest_client.dart';
import 'package:via_cep_mobile/src/modules/shared/data/datasource/shared_datasource.dart';

import '../../models/address_viacep_model.dart';

class SharedDatasourceImp implements SharedDatasource {
  final RestClient client;

  SharedDatasourceImp(this.client);

  @override
  Future<AddressViacepModel> getAddressByCep(String cep) async {
    final result = await client.get("https://viacep.com.br/ws/$cep/json/");

    return AddressViacepModel.fromMap(Map<String, dynamic>.from(result.data));
  }
}
