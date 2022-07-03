import 'package:bertucanfrontend/core/models/freezed_models.dart';

abstract class IAuthRepository {
  Future<void> signUp(UserToSignUp signUpPayload);
  Future<void> signIn(UserToLogin loginPayload);
  Future<void> logOut();
}
