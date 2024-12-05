import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/repositories/auth_repository.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthInitial());
  final AuthRepository _authRepository;

  Future<void> register({required RegisterRequest registerRequest}) async {
    emit(RegisterLoadingState());
    final result =
        await _authRepository.register(registerRequest: registerRequest);
    result.fold(
      (failure) => emit(RegisterErrorState(errorMessage: failure.message)),
      (_) => emit(RegisterSuccessState()),
    );
  }

  Future<void> login({required LoginRequest loginRequest}) async {
    emit(LoginLoadingState());
    final result = await _authRepository.login(loginRequest: loginRequest);
    result.fold(
      (failure) => emit(LoginErrorState(errorMessage: failure.message)),
      (_) => emit(LoginSuccessState()),
    );
  }
}
