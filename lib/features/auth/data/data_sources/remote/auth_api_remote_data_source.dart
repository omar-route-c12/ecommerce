import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login_response.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/register_response.dart';

class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future<RegisterResponse> register({
    required RegisterRequest registerRequest,
  }) async {
    final response = await _dio.post(
      ApiConstants.registerEndPoint,
      data: registerRequest.toJson(),
    );
    final json = await response.data;
    return RegisterResponse.fromJson(json);
  }

  @override
  Future<LoginResponse> login({required LoginRequest loginRequest}) async {
    final response = await _dio.post(
      ApiConstants.loginEndPoint,
      data: loginRequest.toJson(),
    );
    final json = await response.data;
    return LoginResponse.fromJson(json);
  }
}
