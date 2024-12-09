import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/domain/use_cases/login.dart';
import 'package:ecommerce/features/auth/domain/use_cases/register.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._register, this._login) : super(AuthInitial());
  final Register _register;
  final Login _login;

  Future<void> register({required RegisterRequest registerRequest}) async {
    emit(RegisterLoadingState());
    final result = await _register(registerRequest);
    result.fold(
      (failure) => emit(RegisterErrorState(errorMessage: failure.message)),
      (_) => emit(RegisterSuccessState()),
    );
  }

  Future<void> login({required LoginRequest loginRequest}) async {
    emit(LoginLoadingState());
    final result = await _login(loginRequest);
    result.fold(
      (failure) => emit(LoginErrorState(errorMessage: failure.message)),
      (_) => emit(LoginSuccessState()),
    );
  }
}
