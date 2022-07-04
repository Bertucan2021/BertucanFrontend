import 'package:bertucanfrontend/core/adapters/auth_adapter.dart';
import 'package:bertucanfrontend/core/repositories/auth_repository.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IAuthRepository>(AuthRepository());
    Get.lazyPut<AuthController>(() => AuthController(Get.find()));
  }
}
