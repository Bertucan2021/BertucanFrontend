import 'package:bertucanfrontend/core/adapters/auth_adapter.dart';
import 'package:bertucanfrontend/core/enums/common_enums.dart';
import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/services/api/api_client.dart';

class AuthRepository with IAuthRepository {
  final ApiClient apiClient;
  AuthRepository({required this.apiClient});
  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(UserToLogin loginPayload) async {
    final response = await apiClient.request(
      requestType: RequestType.post,
      path: '/signin',
      data: loginPayload.toJson(),
    );
  }

  @override
  Future<void> signUp(UserToSignUp signUpPayload) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
