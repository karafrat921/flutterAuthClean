import 'package:dartz/dartz.dart';
import 'package:flutter_auth_clean/core/errors/failures.dart';
import 'package:flutter_auth_clean/core/usecases/usecase.dart';
import 'package:flutter_auth_clean/features/auth/domain/repositories/auth_repository.dart';

class IsAuthenticatedUseCase implements UseCase<bool, NoParams> {
  final AuthRepository repository;

  IsAuthenticatedUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.isAuthenticated();
  }
}

class NoParams {
  const NoParams();
}
