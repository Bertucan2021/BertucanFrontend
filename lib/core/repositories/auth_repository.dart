import 'package:bertucanfrontend/core/adapters/auth_adapter.dart';
import 'package:bertucanfrontend/core/models/freezed_models.dart';

class AuthRepository with IAuthRepository {
  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(UserToLogin loginPayload) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(UserToSignUp signUpPayload) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
