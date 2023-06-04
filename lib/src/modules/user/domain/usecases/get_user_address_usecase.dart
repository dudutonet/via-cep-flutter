import 'package:dartz/dartz.dart';
import 'package:via_cep_mobile/src/modules/user/data/models/cep_model.dart';
import 'package:via_cep_mobile/src/modules/user/domain/repositories/i_cep_repository.dart';

import '../../../../core/errors/failure.dart';

abstract class IGetUserAddresUsecase {
  Future<Either<Failure, CepModel>> call(String cep);
}

class GetUserAddresUsecase extends IGetUserAddresUsecase {
  final ICepRepository repository;

  GetUserAddresUsecase({required this.repository});

  @override
  Future<Either<Failure, CepModel>> call(String cep) async {
    return await repository.getByCep(cep);
  }
}
