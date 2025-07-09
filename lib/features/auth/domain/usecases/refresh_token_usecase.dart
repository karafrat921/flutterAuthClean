import 'package:dartz/dartz.dart';
import 'package:flutter_auth_clean/core/errors/failures.dart';
import 'package:flutter_auth_clean/core/usecases/usecase.dart';
import 'package:flutter_auth_clean/features/auth/domain/entities/auth_entity.dart';
import 'package:flutter_auth_clean/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class RefreshTokenUseCase implements UseCase<AuthEntity, RefreshTokenParams> {
  final AuthRepository repository;

  RefreshTokenUseCase(this.repository);

  @override
  Future<Either<Failure, AuthEntity>> call(RefreshTokenParams params) async {
    return await repository.refreshToken(params.refreshToken);
  }
}

class RefreshTokenParams extends Equatable {
  final String refreshToken;

  const RefreshTokenParams({required this.refreshToken});

  @override
  List<Object?> get props => [refreshToken];
}
