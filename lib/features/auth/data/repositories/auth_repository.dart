import 'package:ecommerce/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/user_model.dart';

class AuthRepository {
  final _authRemoteDataSource = AuthApiRemoteDataSource();
  final _authLocalDataSource = AuthSharedPrefLocalDataSource();

  Future<User> register({required RegisterRequest registerRequest}) async {
    final response =
        await _authRemoteDataSource.register(registerRequest: registerRequest);
    await _authLocalDataSource.saveToken(response.token);
    return response.user;
  }

  Future<User> login({required LoginRequest loginRequest}) async {
    final response =
        await _authRemoteDataSource.login(loginRequest: loginRequest);
    await _authLocalDataSource.saveToken(response.token);
    return response.user;
  }
}
