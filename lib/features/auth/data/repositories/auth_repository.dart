import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_sources.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  const AuthRepository(this._authRemoteDataSource, this._authLocalDataSource);

  Future<Either<Failure, User>> register({
    required RegisterRequest registerRequest,
  }) async {
    try {
      final response = await _authRemoteDataSource.register(
          registerRequest: registerRequest);
      await _authLocalDataSource.saveToken(response.token);
      return Right(response.user);
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  Future<Either<Failure, User>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      final response =
          await _authRemoteDataSource.login(loginRequest: loginRequest);
      await _authLocalDataSource.saveToken(response.token);
      return Right(response.user);
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
