import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/user_model.dart';

abstract class IUserRepository {
  Future<Either<Failure, Unit>> createUser(UserModel model);
  Future<Either<Failure, List<UserModel>>> listUsers();
}
