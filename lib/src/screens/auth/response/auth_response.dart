import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greengrocer/src/models/user_model.dart';

part 'auth_response.freezed.dart';

@freezed
class AuthResponse with _$AuthResponse {
  factory AuthResponse.success(UserModel user) = Success;
  factory AuthResponse.error(String message) = Error;
}

// dart run build_runner build