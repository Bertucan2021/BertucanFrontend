import 'package:bertucanfrontend/core/adapters/auth_adapter.dart';
import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:get/get.dart';

class AuthController {
  final IAuthRepository _authRepository;

  AuthController(this._authRepository);

  final _status = RxStatus.empty().obs;
  RxStatus get status => _status.value;
  set status(RxStatus value) {
    _status.value = value;
  }

  Future<void> signUp(UserToSignUp signUpPayload) async {
    status = RxStatus.loading();
    await _authRepository.signUp(signUpPayload).then((value) {
      status = RxStatus.success();
    }).catchError((error) {
      status = RxStatus.error(error);
    });
  }

  Future<void> signIn(UserToLogin loginPayload) async {
    await _authRepository.signIn(loginPayload).then((value) {
      status = RxStatus.success();
    }).catchError((error) {
      status = RxStatus.error(error);
    });
  }
}
