import 'package:bertucanfrontend/core/models/simple_models.dart';

abstract class IHomeRepository {
  void saveCurrentMensturationData(MonthlyMensturationModel data);
  List<MonthlyMensturationModel> calculateNextMensturationDates(
      int forMonths, MonthlyMensturationModel data);
}
