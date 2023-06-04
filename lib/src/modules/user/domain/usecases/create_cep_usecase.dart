import 'package:dartz/dartz.dart';
import 'package:via_cep_mobile/src/modules/user/data/models/cep_model.dart';
import 'package:via_cep_mobile/src/modules/user/domain/entities/cep_entity.dart';
import 'package:via_cep_mobile/src/modules/user/domain/repositories/i_cep_repository.dart';

import '../../../../core/errors/failure.dart';

abstract class ICreateCepUsecase {
  Future<Either<Failure, Unit>> call(CepEntity entity);
}

class CreateCepUsecase extends ICreateCepUsecase {
  final ICepRepository repository;

  CreateCepUsecase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(CepEntity entity) async {
    return await repository.createCep(CepModel.fromEntity(entity));
  }
}
