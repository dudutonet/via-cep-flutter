import 'package:dartz/dartz.dart';
import 'package:via_cep_mobile/src/modules/shared/data/datasource/shared_datasource.dart';
import 'package:via_cep_mobile/src/modules/shared/data/models/address_viacep_model.dart';
import 'package:via_cep_mobile/src/modules/shared/domain/repository/shared_repository.dart';

import '../../../../core/errors/failure.dart';

class SharedRepositoryImp implements SharedRepository {
  final SharedDatasource datasource;

  SharedRepositoryImp(this.datasource);

  @override
  Future<Either<Failure, AddressViacepModel>> getAddressByCep(String cep) async {
    try {
      final result = await datasource.getAddressByCep(cep);

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }
}
