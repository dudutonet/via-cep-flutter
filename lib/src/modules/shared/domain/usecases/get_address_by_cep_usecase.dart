import 'package:dartz/dartz.dart';
import 'package:via_cep_mobile/src/modules/shared/domain/entities/address_viacep_entity.dart';
import 'package:via_cep_mobile/src/modules/shared/domain/repository/shared_repository.dart';

import '../../../../core/errors/failure.dart';

abstract class IGetAddressByCepUsecase {
  Future<Either<Failure, AddressViacepEntity>> call(String cep);
}

class GetAddressByCepUsecase extends IGetAddressByCepUsecase {
  final SharedRepository repository;

  GetAddressByCepUsecase({required this.repository});

  @override
  Future<Either<Failure, AddressViacepEntity>> call(String cep) async {
    return await repository.getAddressByCep(cep.replaceAll("-", "").replaceAll(".", ""));
  }
}
