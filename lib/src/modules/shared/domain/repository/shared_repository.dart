import 'package:dartz/dartz.dart';
import 'package:via_cep_mobile/src/modules/shared/data/models/address_viacep_model.dart';

import '../../../../core/errors/failure.dart';

abstract class SharedRepository {
  Future<Either<Failure, AddressViacepModel>> getAddressByCep(String cep);
}
