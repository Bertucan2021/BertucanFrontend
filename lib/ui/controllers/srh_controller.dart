import 'package:bertucanfrontend/core/adapters/srh_adapter.dart';
import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/repositories/srh_repository.dart';
import 'package:bertucanfrontend/core/services/api/api_client.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:get/get.dart';

class SrhController extends GetxController {
  ISrhRepository repository;

  SrhController({required this.repository});

  var status = RxStatus.empty().obs;

  var srhs = <Srh>[].obs;
  var selectedSrh = Srh(id: -1).obs;
  getSrh() async {
    status.value = RxStatus.loading();
    await repository.getSrhs().then((data) {
      if (data != null) {
        srhs.value = data;
        status.value = RxStatus.success();
      }
      else{
        status.value = RxStatus.error();
      }
    });

    return srhs;
  }

  selectSrh(Srh temp) {
    selectedSrh.value = temp;
    Get.toNamed(Routes.srhDetailPage);
  }
}
