import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rectangular_button.dart';
import 'package:bertucanfrontend/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogPeriodInfoPage extends StatefulWidget {
  LogPeriodInfoPage({Key? key}) : super(key: key);

  @override
  State<LogPeriodInfoPage> createState() => _LogPeriodInfoPageState();
}

class _LogPeriodInfoPageState extends State<LogPeriodInfoPage> {
  DateTime startDate = DateTime.now();
  DateTime? lastDate;
  bool isPeriodGoing = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        LocalizedText('are_you_on_your_period'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RectangularButton(
                label: 'no',
                onPressed: () {
                  setState(() {
                    isPeriodGoing = false;
                  });
                }),
            RectangularButton(
                label: 'yes',
                onPressed: () {
                  setState(() {
                    isPeriodGoing = true;
                  });
                }),
          ],
        ),
        isPeriodGoing
            ? Column(
                children: [
                  LocalizedText('when_did_your_last_period_start'),
                  RoundedButton(
                      text: 'select_date',
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: startDate,
                                firstDate:
                                    DateTime.now().subtract(Duration(days: 30)),
                                lastDate: DateTime.now())
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              startDate = value;
                              lastDate = value.add(Duration(days: 7));
                            });
                          }
                        });
                      }),
                ],
              )
            : Column(
                children: [
                  LocalizedText('select_the_start_and_end of_your_last_period'),
                  RoundedButton(
                      text: 'select_date_range',
                      onPressed: () {
                        showDateRangePicker(
                                context: context,
                                firstDate: startDate,
                                lastDate:
                                    DateTime.now().subtract(Duration(days: 1)))
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              startDate = value.start;
                              lastDate = value.end;
                            });
                          }
                        });
                      })
                ],
              ),
        Row(
          children: [
            RectangularButton(
                label: 'cancel',
                onPressed: () {
                  Get.back();
                }),
            RectangularButton(
                label: 'done',
                onPressed: () {
                  if (lastDate != null) {
                    HomeController homeController = Get.find();
                    homeController.setCurrentPeriodDate(
                        MonthlyMensturationModel(
                            startDate: startDate, endDate: lastDate!));
                  }
                }),
          ],
        )
      ],
    ));
  }
}
