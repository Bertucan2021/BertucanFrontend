import 'package:bertucanfrontend/core/models/simple_models.dart';

class EstimationService {
  //get next mensturation date
  MonthlyMensturationModel getNextMensurationDate(
      MonthlyMensturationModel data, UserLogData userLogData) {
    return MonthlyMensturationModel(
        startDate: data.endDate.add(Duration(days: userLogData.daysToStart)),
        endDate: data.endDate.add(
            Duration(days: (userLogData.daysToEnd + userLogData.daysToStart))),
        pregnancyDate: data.endDate.add(Duration(
            days: userLogData.daysToEnd + userLogData.daysToStart + 9)),
        phaseChange:
            data.endDate.add(Duration(days: userLogData.daysToStart + 14)));
  }
}
