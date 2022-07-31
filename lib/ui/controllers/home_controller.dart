import 'dart:developer';

import 'package:bertucanfrontend/core/adapters/home_adapter.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/ui/pages/intro/log_period_info.dart';
import 'package:bertucanfrontend/utils/functions.dart';
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

  final _currentMenstruation = MonthlyMensturationModel(
          startDate: DateTime.now(), endDate: DateTime.now())
      .obs;
  MonthlyMensturationModel get currentMenstruation =>
      _currentMenstruation.value;
  set currentMenstruation(MonthlyMensturationModel value) =>
      _currentMenstruation.value = value;

  UserLogData? userLogData;

  final _status = RxStatus.empty().obs;
  RxStatus get status => _status.value;
  set status(RxStatus value) {
    _status.value = value;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    addSelectableDays();
    try {
      status = RxStatus.loading();
      await _repository.loadMensturationCycles();
      status = RxStatus.empty();
      getPredictedDates();
      // ignore: empty_catches
    } catch (e) {}
  }

  void addSelectableDays() {
    selectableDates.clear();
    final newDates = <DateTime>[];
    for (int i = 0; i < 30; i++) {
      newDates.add(DateTime.now().add(Duration(days: i)));
    }
    selectableDates.addAll(newDates);
  }

  setCurrentMenstruationCycle() {
    currentMenstruation = predictedDates.firstWhere(
      (element) {
        return element.startDate.year == DateTime.now().year &&
            element.startDate.month == DateTime.now().month;
      },
      orElse: () {
        return predictedDates.firstWhere(
          (element) {
            return element.startDate.month == DateTime.now().month + 1;
          },
        );
      },
    );
    _repository.saveCurrentMensturationData(currentMenstruation);
  }

  void setSelectedDate(DateTime date) {
    selectedDate = date;
  }

  void setCurrentPeriodDate(UserLogData data) {
    userLogData = data;
    _repository.saveUserLogData(data);
    predictedDates = [];
    MonthlyMensturationModel currentMensturationData = MonthlyMensturationModel(
        startDate: data.startDate, endDate: data.endDate);
    predictedDates =
        _repository.calculateNextMensturationDates(12, currentMensturationData);
  }

  void editLogData(UserLogData data) {
    userLogData = data;
    _repository.saveUserLogData(data);
    MonthlyMensturationModel tempData =
        _repository.getCurrentMensturationdata() ??
            MonthlyMensturationModel(
                startDate: data.startDate, endDate: data.endDate);
    predictedDates = predictedDates
            .where((element) => element.startDate.isBefore(tempData.startDate))
            .toList() +
        _repository.calculateNextMensturationDates(12, tempData);
    currentMenstruation = tempData;
  }

  void getPredictedDates() {
    predictedDates = _repository.getForecomingMensturationDates();
    if (predictedDates.isNotEmpty) {
      setCurrentMenstruationCycle();
    }
  }

  void addPreviousCycle(MonthlyMensturationModel data) {
    var temp = predictedDates;
    int wasPrevSet = temp.indexWhere((element) {
      return element.startDate.year == DateTime.now().year &&
          element.startDate.month == DateTime.now().month;
    });
    if (wasPrevSet != -1) {
      temp[wasPrevSet] = data;
    } else {
      temp.add(data);
    }
    temp.sort((a, b) {
      return a.startDate.compareTo(b.startDate);
    });
    predictedDates = temp;
    _repository.savePredictedDates(predictedDates);
  }

  UserLogData getUserLogData() {
    log("1${userLogData?.toJson().toString()} 2 ${_repository.getUserLogData().toJson().toString()}");
    return userLogData ?? _repository.getUserLogData();
  }
}
