import 'package:bertucanfrontend/core/adapters/home_adapter.dart';
import 'package:bertucanfrontend/core/repositories/home_repository.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IHomeRepository>(HomeRepository());
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
