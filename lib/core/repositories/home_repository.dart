import 'package:bertucanfrontend/core/adapters/home_adapter.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/core/services/estimation_service.dart';
import 'package:get_storage/get_storage.dart';

class HomeRepository implements IHomeRepository {
  GetStorage storage = GetStorage();
  EstimationService service;
  HomeRepository({required this.service});

  @override
  List<MonthlyMensturationModel> calculateNextMensturationDates(
      int forMonths, MonthlyMensturationModel data) {
    List<MonthlyMensturationModel> predictions = [];
    MonthlyMensturationModel calculateFrom = data;
    for (int i = 0; i < forMonths; i++) {
      var temp = service.getNextMensurationDate(calculateFrom);
      predictions.add(temp);
      calculateFrom = temp;
    }
    return predictions;
  }

  @override
  void saveCurrentMensturationData(MonthlyMensturationModel data) {
    storage.write('current_mensturation_data', data);
  }
}
