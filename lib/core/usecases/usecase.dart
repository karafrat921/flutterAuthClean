import 'package:dartz/dartz.dart';
import 'package:flutter_auth_clean/core/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
