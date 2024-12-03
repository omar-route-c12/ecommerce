import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/repositories/auth_repository.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final _authRepository = AuthRepository();

  Future<void> register({required RegisterRequest registerRequest}) async {
    emit(RegisterLoadingState());
    try {
      await _authRepository.register(registerRequest: registerRequest);
      emit(RegisterSuccessState());
    } catch (error) {
      emit(RegisterErrorState(errorMessage: error.toString()));
    }
  }

  Future<void> login({required LoginRequest loginRequest}) async {
    emit(LoginLoadingState());
    try {
      await _authRepository.login(loginRequest: loginRequest);
      emit(LoginSuccessState());
    } catch (error) {
      emit(LoginErrorState(errorMessage: error.toString()));
    }
  }
}
