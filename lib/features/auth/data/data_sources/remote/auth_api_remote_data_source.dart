import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login_response.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/register_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  final Dio _dio;

  const AuthApiRemoteDataSource(this._dio);

  @override
  Future<RegisterResponse> register({
    required RegisterRequest registerRequest,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.registerEndPoint,
        data: registerRequest.toJson(),
      );
      final json = await response.data;
      return RegisterResponse.fromJson(json);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to Register');
    }
  }

  @override
  Future<LoginResponse> login({required LoginRequest loginRequest}) async {
    try {
      final response = await _dio.post(
        ApiConstants.loginEndPoint,
        data: loginRequest.toJson(),
      );
      final json = await response.data;
      return LoginResponse.fromJson(json);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to Login');
    }
  }
}
