import 'package:dartz/dartz.dart';
import 'package:via_cep_mobile/src/core/errors/failure.dart';
import 'package:via_cep_mobile/src/modules/user/data/models/cep_model.dart';
import 'package:via_cep_mobile/src/modules/user/domain/repositories/i_cep_repository.dart';

import '../datasource/i_cep_datasource.dart';

class CepRepository extends ICepRepository {
  final ICepDatasource datasource;

  CepRepository({required this.datasource});

  @override
  Future<Either<Failure, Unit>> createCep(CepModel model) async {
    try {
      await datasource.createCep(model);

      return right(unit);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, CepModel>> getByCep(String cep) async {
    try {
      final result = await datasource.getByCep(cep);

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }
}
