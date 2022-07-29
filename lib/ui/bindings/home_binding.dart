import 'package:bertucanfrontend/core/adapters/home_adapter.dart';
import 'package:bertucanfrontend/core/repositories/home_repository.dart';
import 'package:bertucanfrontend/core/services/estimation_service.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EstimationService(), fenix: true);
    Get.put<IHomeRepository>(
        HomeRepository(service: Get.find(), apiClient: Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
