import 'package:dartz/dartz.dart';
import 'package:via_cep_mobile/src/modules/user/data/models/cep_model.dart';

import '../../../../core/errors/failure.dart';

abstract class ICepRepository {
  Future<Either<Failure, Unit>> createCep(CepModel model);
  Future<Either<Failure, CepModel>> getByCep(String cep);
}
