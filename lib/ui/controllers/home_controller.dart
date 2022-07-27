import 'package:bertucanfrontend/core/adapters/home_adapter.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/ui/pages/intro/log_period_info.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final IHomeRepository _repository;
  HomeController(this._repository);

  final _selectedDate = DateTime.now().obs;
  DateTime get selectedDate => _selectedDate.value;
  set selectedDate(DateTime value) => _selectedDate.value = value;

  final _selectableDates = <DateTime>[].obs;
  List<DateTime> get selectableDates => _selectableDates;
  set selectableDates(List<DateTime> value) => _selectableDates.value = value;

  @override
  void onInit() {
    super.onInit();
    addSelectableDays();
    Get.dialog(LogPeriodInfoPage(), barrierDismissible: false);
  }

  //a function that addes 30 days from the selected days and add on to selectable dates
  void addSelectableDays() {
    selectableDates.clear();
    final newDates = <DateTime>[];
    for (int i = 0; i < 30; i++) {
      newDates.add(DateTime.now().add(Duration(days: i)));
    }
    selectableDates.addAll(newDates);
  }

  void setSelectedDate(DateTime date) {
    selectedDate = date;
  }

  void setCurrentPeriodDate(MonthlyMensturationModel data) {}
}
