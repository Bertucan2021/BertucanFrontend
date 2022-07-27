import 'package:bertucanfrontend/core/models/simple_models.dart';

class EstimationService {
  //get next mensturation date
  MonthlyMensturationModel getNextMensurationDate(
      MonthlyMensturationModel data) {
    return MonthlyMensturationModel(
        startDate: data.endDate.add(Duration(days: 25)),
        endDate: data.endDate.add(Duration(days: 32)));
  }
}
