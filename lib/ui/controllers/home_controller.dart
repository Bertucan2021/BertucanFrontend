import 'dart:developer';

import 'package:bertucanfrontend/core/adapters/home_adapter.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/ui/pages/intro/log_period_info.dart';
import 'package:flutter/cupertino.dart';
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

  final _predictedDates = <MonthlyMensturationModel>[].obs;
  List<MonthlyMensturationModel> get predictedDates => _predictedDates.value;
  set predictedDates(List<MonthlyMensturationModel> value) =>
      _predictedDates.value = value;

  @override
  void onInit() {
    super.onInit();
    addSelectableDays();
    // Get.dialog(LogPeriodInfoPage(), barrierDismissible: false);
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

  void setCurrentPeriodDate(UserLogData data) {
    _repository.saveUserLogData(data);
    predictedDates = [];
    MonthlyMensturationModel currentMensturationData = MonthlyMensturationModel(
        startDate: data.startDate, endDate: data.endDate);
    predictedDates =
        _repository.calculateNextMensturationDates(12, currentMensturationData);
  }

  void getPredictedDates() async {
    predictedDates = await _repository.getForecomingMensturationDates();
  }
}
