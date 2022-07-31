import 'package:bertucanfrontend/core/models/simple_models.dart';

abstract class IHomeRepository {
  void saveCurrentMensturationData(MonthlyMensturationModel data);
  MonthlyMensturationModel? getMonthMensturationModel(DateTime ofMonth);
  List<MonthlyMensturationModel> calculateNextMensturationDates(
      int forMonths, MonthlyMensturationModel data);
  void saveUserLogData(UserLogData data);
  UserLogData getUserLogData();
  Future<List<MonthlyMensturationModel>> getForecomingMensturationDates();
  void savePredictedDates(List<MonthlyMensturationModel> data);
}
