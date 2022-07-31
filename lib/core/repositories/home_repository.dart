import 'dart:developer';

import 'package:bertucanfrontend/core/adapters/home_adapter.dart';
import 'package:bertucanfrontend/core/enums/common_enums.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/core/services/api/api_client.dart';
import 'package:bertucanfrontend/core/services/estimation_service.dart';
import 'package:bertucanfrontend/core/services/notification_service.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeRepository implements IHomeRepository {
  GetStorage storage = GetStorage();
  EstimationService service;
  ApiClient apiClient;
  NotificationService notificationService;
  HomeRepository(
      {required this.service,
      required this.apiClient,
      required this.notificationService});

  @override
  List<MonthlyMensturationModel> calculateNextMensturationDates(
      int forMonths, MonthlyMensturationModel data) {
    List<MonthlyMensturationModel> predictions = [];
    MonthlyMensturationModel calculateFrom = data;
    UserLogData userLogData = getUserLogData();
    predictions.add(calculateFrom);
    for (int i = 0; i < forMonths; i++) {
      var temp = service.getNextMensurationDate(calculateFrom, userLogData);
      predictions.add(temp);
      try {
        showPeriodNotification(temp.startDate.subtract(Duration(days: 2)), i);
      } catch (e) {
        log(e.toString());
      }
      calculateFrom = temp;
    }
    savePredictedDates(predictions);
    MonthlyMensturationModel currentMonth = predictions.firstWhere(
        (element) => element.startDate.month == DateTime.now().month);
    saveCurrentMensturationData(currentMonth);
    return predictions;
  }

  showPeriodNotification(DateTime forDate, int id) {
    Duration showAfter = forDate.difference(DateTime.now());

    notificationService.scheduledNotification(
        'period_alert'.tr,
        '${'your_period_starts_in'.tr} ${showAfter.inDays.abs()} days',
        showAfter,
        id);
  }

  @override
  void saveCurrentMensturationData(MonthlyMensturationModel data) {
    storage.write('current_mensturation_data', data.toJson());
  }

  @override
  MonthlyMensturationModel? getMonthMensturationModel(DateTime ofMonth) {
    return MonthlyMensturationModel.fromJson(
        storage.read('current_mensturation_data'));
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
      List<MonthlyMensturationModel> predictions = [];

      storage.read('forecoming_mensturation_data').forEach((element) {
        predictions.add(MonthlyMensturationModel.fromJson(element));
      });
      showPeriodNotification(DateTime.now().add(Duration(minutes: 1)), 1);
      showPeriodNotification(DateTime.now().add(Duration(minutes: 2)), 2);
      showPeriodNotification(DateTime.now().add(Duration(minutes: 3)), 3);

      return predictions;
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

  @override
  void savePredictedDates(List<MonthlyMensturationModel> data) {
    storage.write('forecoming_mensturation_data', data);
  }
}
