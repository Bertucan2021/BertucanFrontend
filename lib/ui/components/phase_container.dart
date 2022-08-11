import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PhaseContainer extends StatelessWidget {
  final MonthlyMensturationModel data;
  final Function(UserLogData) onEdit;

  final TextEditingController _periodLength = TextEditingController();
  final TextEditingController _periodComing = TextEditingController();
  final DateTime date;

  var _formKey = GlobalKey<FormState>();
  PhaseContainer(
      {Key? key, required this.data, required this.date, required this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: AppTheme.orangeBoxDecoration(),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        CircularPercentIndicator(
          radius: 60.0,
          lineWidth: 7.0,
          backgroundColor: Colors.white38,
          rotateLinearGradient: true,
          animateFromLastPercent: true,
          startAngle: 180,
          percent: date.day / 31,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 4,
              ),
              const LocalizedText("day",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTheme.greySubtitleStyle),
              Text(DateFormat.d().format(date), style: AppTheme.titleStyle5),
            ],
          ),
          progressColor: Colors.white,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocalizedText(getPhase(date, data),
                style: AppTheme.titleStyle2.copyWith(color: AppTheme.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocalizedText('chance_of_pregnancy: ',
                    style: AppTheme.greySubtitleStyle),
                data.pregnancyDate != null
                    ? LocalizedText(
                        getChanceOfPregnancy(date, data),
                        style: AppTheme.titleStyle4,
                      )
                    : SizedBox()
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Container(
                    decoration: AppTheme.whiteBoxDecoration(),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: LocalizedText('edit_period_log',
                        style: AppTheme.normalPrimaryTextStyle)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: const LocalizedText('edit_period_log',
                                style: AppTheme.titleStyle,
                                textAlign: TextAlign.center),
                            content: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomTextField(
                                    label: 'enter_your_period_length',
                                    controller: _periodLength,
                                    keyboardType: TextInputType.number,
                                    hintText: 'enter_your_period_length',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'enter_your_period_length';
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomTextField(
                                    label: 'enter_your_cycle_length',
                                    controller: _periodComing,
                                    keyboardType: TextInputType.number,
                                    hintText: 'enter_your_cycle_length',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'enter_your_cycle_length';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        child: const LocalizedText('cancel',
                                            style: AppTheme
                                                .normalPrimaryTextStyle),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      TextButton(
                                          child: const LocalizedText(
                                            'save',
                                            style:
                                                AppTheme.normalPrimaryTextStyle,
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              Get.back();
                                              onEdit(UserLogData(
                                                  startDate: data.startDate,
                                                  endDate: data.endDate,
                                                  daysToStart: int.parse(
                                                      _periodComing.text),
                                                  daysToEnd: int.parse(
                                                      _periodLength.text)));
                                            }
                                          }),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }

  getPhase(DateTime day, MonthlyMensturationModel data) {
    if (day.isBefore(data.endDate.add(Duration(days: 1))) &&
        day.isAfter(data.startDate)) {
      return 'menstrual_phase';
    } else if (data.pregnancyDate != null) {
      if ((day.difference(data.pregnancyDate!).abs().inDays <= 1)
          // ||  day.day == data.pregnancyDate!.day
          ) {
        return 'ovulation_phase';
      } else if (day
              .isBefore(data.pregnancyDate!.subtract(Duration(days: 2))) &&
          day.isAfter(data.endDate)) {
        return 'follicular_phase';
      } else {
        return 'luteal_phase';
      }
    }
  }
}
