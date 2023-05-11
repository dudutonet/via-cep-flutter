import '../models/address_viacep_model.dart';

abstract class SharedDatasource {
  Future<AddressViacepModel> getAddressByCep(String cep);
}
