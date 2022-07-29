import 'package:bertucanfrontend/core/adapters/home_adapter.dart';
import 'package:bertucanfrontend/core/enums/common_enums.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/core/services/api/api_client.dart';
import 'package:bertucanfrontend/core/services/estimation_service.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:get_storage/get_storage.dart';

class HomeRepository implements IHomeRepository {
  GetStorage storage = GetStorage();
  EstimationService service;
  ApiClient apiClient;
  HomeRepository({required this.service, required this.apiClient});

  @override
  List<MonthlyMensturationModel> calculateNextMensturationDates(
      int forMonths, MonthlyMensturationModel data) {
    List<MonthlyMensturationModel> predictions = [];
    MonthlyMensturationModel calculateFrom = data;
    UserLogData userLogData = getUserLogData();
    for (int i = 0; i < forMonths; i++) {
      var temp = service.getNextMensurationDate(calculateFrom, userLogData);
      predictions.add(temp);
      calculateFrom = temp;
    }
    storage.write('forecoming_mensturation_data', predictions);
    return predictions;
  }

  @override
  void saveCurrentMensturationData(MonthlyMensturationModel data) {
    storage.write('current_mensturation_data', data);
  }

  @override
  UserLogData getUserLogData() {
    return UserLogData.fromJson(storage.read('user_log_data'));
  }

  @override
  void saveUserLogData(UserLogData data) {
    storage.write('user_log_data', data.toJson());
  }

  @override
  Future<List<MonthlyMensturationModel>>
      getForecomingMensturationDates() async {
    if (storage.hasData('forecoming_mensturation_data')) {
      return storage.read('forecoming_mensturation_data');
    } else {
      List<MonthlyMensturationModel> predictions = [];
      final response = await apiClient.request(
        requestType: RequestType.get,
        path: '/cycles',
      );
      if (response['success']) {
        response['data'].forEach((element) {
          predictions.add(MonthlyMensturationModel.fromJson(element));
        });
      } else {
        toast('error', 'could_not_load_data');
      }
      return predictions;
    }
  }
}
