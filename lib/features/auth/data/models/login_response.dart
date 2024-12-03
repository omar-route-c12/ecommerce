import 'package:ecommerce/features/auth/data/models/user_model.dart';

class LoginResponse {
  LoginResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'],
    );
  }

  final String message;
  final User user;
  final String token;
}

