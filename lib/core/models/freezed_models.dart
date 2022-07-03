import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_models.g.dart';

part 'freezed_models.freezed.dart';

@freezed
class UserToSignUp with _$UserToSignUp {
  const factory UserToSignUp({
    required String email,
    required String phoneNumber,
    required String password,
    required String name,
  }) = _UserToSignUp;

  factory UserToSignUp.fromJson(Map<String, dynamic> json) =>
      _$UserToSignUpFromJson(json);
}

@freezed
class UserToLogin with _$UserToLogin {
  const factory UserToLogin({
    required String email,
    required String password,
  }) = _UserToLogin;

  factory UserToLogin.fromJson(Map<String, dynamic> json) =>
      _$UserToLoginFromJson(json);
}
