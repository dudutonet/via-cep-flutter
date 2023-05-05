import 'package:dartz/dartz.dart';
import 'package:via_cep_mobile/src/modules/user/domain/entities/user_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/user_model.dart';
import '../repositories/i_user_repository.dart';

abstract class ICreateUserUsecase {
  Future<Either<Failure, Unit>> call(UserEntity entity);
}

class CreateUserUsecase extends ICreateUserUsecase {
  final IUserRepository repository;

  CreateUserUsecase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(UserEntity entity) async {
    return await repository.createUser(UserModel.fromEntity(entity));
  }
}
