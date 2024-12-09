import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_sources.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/mappers/user_mappers.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  const AuthRepositoryImpl(
      this._authRemoteDataSource, this._authLocalDataSource);

  @override
  Future<Either<Failure, User>> register({
    required RegisterRequest registerRequest,
  }) async {
    try {
      final response = await _authRemoteDataSource.register(
          registerRequest: registerRequest);
      await _authLocalDataSource.saveToken(response.token);
      return Right(response.user.toEntity);
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, User>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      final response =
          await _authRemoteDataSource.login(loginRequest: loginRequest);
      await _authLocalDataSource.saveToken(response.token);
      return Right(response.user.toEntity);
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
