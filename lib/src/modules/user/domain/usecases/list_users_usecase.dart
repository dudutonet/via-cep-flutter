import 'package:dartz/dartz.dart';
import 'package:via_cep_mobile/src/core/errors/failure.dart';
import 'package:via_cep_mobile/src/modules/user/domain/entities/user_entity.dart';
import 'package:via_cep_mobile/src/modules/user/domain/repositories/i_user_repository.dart';

abstract class IListUsersUsecase {
  Future<Either<Failure, List<UserEntity>>> call();
}

class ListUsersUsecase extends IListUsersUsecase {
  final IUserRepository repository;

  ListUsersUsecase({required this.repository});

  @override
  Future<Either<Failure, List<UserEntity>>> call() async {
    return await repository.listUsers();
  }
}
