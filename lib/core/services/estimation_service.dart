import 'package:bertucanfrontend/core/models/simple_models.dart';

class EstimationService {
  //get next mensturation date
  static MonthlyMensturationModel getNextMensurationDate(DateTime date) {
    DateTime startDate = date.add(const Duration(days: 25));
    return MonthlyMensturationModel(
        startDate: startDate, endDate: startDate.add(const Duration(days: 7)));
  }
}
