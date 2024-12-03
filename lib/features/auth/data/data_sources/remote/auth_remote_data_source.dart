import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/login_response.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/register_response.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register({required RegisterRequest registerRequest});
  Future<LoginResponse> login({required LoginRequest loginRequest});
}
