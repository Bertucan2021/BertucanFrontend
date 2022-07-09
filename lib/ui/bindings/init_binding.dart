import 'package:bertucanfrontend/core/services/api/api_client.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio(), fenix: true);
    Get.lazyPut(() => Connectivity(), fenix: true);
    Get.lazyPut(() => ApiClient(dio: Get.find(), connectivity: Get.find()),
        fenix: true);
  }
}
