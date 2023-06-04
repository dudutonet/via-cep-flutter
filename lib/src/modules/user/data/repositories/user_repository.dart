import 'package:via_cep_mobile/src/modules/user/data/models/user_model.dart';
import 'package:via_cep_mobile/src/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:via_cep_mobile/src/modules/user/domain/repositories/i_user_repository.dart';

import '../datasource/i_user_datasource.dart';

class UserRepository extends IUserRepository {
  final IUserDatasource datasource;

  UserRepository({required this.datasource});

  @override
  Future<Either<Failure, Unit>> createUser(UserModel model) async {
    try {
      await datasource.createUser(model);

      return right(unit);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> listUsers() async {
    try {
      final result = await datasource.listUsers();

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserById(int id) async {
    try {
      final result = await datasource.getById(id);

      return right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnhandledFailure());
    }
  }
}
