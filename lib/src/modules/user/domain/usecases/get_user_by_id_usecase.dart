import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/user_model.dart';
import '../repositories/i_user_repository.dart';

abstract class IGetUserByIdUsecase {
  Future<Either<Failure, UserModel>> call(int id);
}

class GetUserByIdUsecase extends IGetUserByIdUsecase {
  final IUserRepository repository;

  GetUserByIdUsecase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(int id) async {
    return await repository.getUserById(id);
  }
}
