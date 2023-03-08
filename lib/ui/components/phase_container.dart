import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:bertucanfrontend/ui/pages/log/calendar/ethio_date_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PhaseContainer extends StatefulWidget {
  final MonthlyMensturationModel data;
  final Function(UserLogData) onEdit;
  final DateTime date;
  final UserLogData userLogData;
  PhaseContainer(
      {Key? key,
      required this.data,
      required this.date,
      required this.onEdit,
      required this.userLogData})
      : super(key: key);
  // bool isPeriodGoing = true;
  // AuthController _authController = Get.find();

  @override
  State<PhaseContainer> createState() => _PhaseContainerState();
}

class _PhaseContainerState extends State<PhaseContainer> {
  AuthController _authController = Get.find();
  HomeController _homeController = Get.find();
  DateTime startDate = DateTime.now();

  final TextEditingController _periodLength = TextEditingController();
  final TextEditingController _periodComing = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  // PhaseContainer(
  //     {Key? key,
  //     required this.data,
  //     required this.date,
  //     required this.onEdit,
  //     required this.userLogData})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int ovulationIn = 0;
    if (widget.data.pregnancyDate == null)
      widget.data.pregnancyDate = widget.data.endDate.add(Duration(days: 9));
    if (widget.date
        .isBefore(widget.data.pregnancyDate!.subtract(Duration(days: 1)))) {
      //selected date is before the start of ovulation
      ovulationIn = widget.date
          .difference(widget.data.pregnancyDate!.subtract(Duration(days: 1)))
          .inDays
          .abs();
    } else {
      //selected date is after the start of ovulation
      if (widget.date
          .isAfter(widget.data.pregnancyDate!.add(Duration(days: 2)))) {
        //selected date is after the end of ovulation of current month
        //next line will calculate when the next ovulation will start and get the days left
        ovulationIn = widget.date
            .difference(widget.data.startDate.add(Duration(
                days: widget.userLogData.daysToStart +
                    widget.userLogData.daysToEnd +
                    7)))
            .inDays
            .abs();
      } else {
        //selected date is before the end of ovulation
        //do nothing(ovulationIn stays 0)
      }
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 160,
        decoration: AppTheme.orangeBoxDecoration(),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 7.0,
                backgroundColor: Colors.white38,
                rotateLinearGradient: true,
                animateFromLastPercent: true,
                startAngle: 180,
                percent: ovulationIn / 30,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    LocalizedText(
                        ovulationIn != 0
                            ? translate("ovulation_in")
                            : translate("ovulating"),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTheme.greySubtitleStyle),
                    ovulationIn != 0
                        ? Text("$ovulationIn ${translate('days')}",
                            style: AppTheme.normal2TextStyle)
                        : SizedBox()
                  ],
                ),
                progressColor: Colors.white,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LocalizedText(getPhase(date, data),
                //     style: AppTheme.titleStyle2.copyWith(color: AppTheme.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: LocalizedText('chance_of_pregnancy: ',
                          style: AppTheme.greySubtitleStyle),
                    ),
                    widget.data.pregnancyDate != null
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: LocalizedText(
                              getChanceOfPregnancy(widget.date, widget.data),
                              style: AppTheme.buttonLabelStyle2
                                  .copyWith(color: Colors.black),
                            ),
                          )
                        : SizedBox()
                  ],
                ),
                // SizedBox(height: 10),
                TextButton(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: AppTheme.whiteBoxDecoration(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: LocalizedText(
                        'edit_period_log',
                        style: AppTheme.normalPrimaryTextStyle,
                        textAlign: TextAlign.center,
                      )),
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            LocalizedText(
                                                'when_did_your_period_start',
                                                style:
                                                    AppTheme.normalTextStyle),
                                            SizedBox(
                                              width: width * 0.03,
                                            ),
                                            Theme(
                                              data: _buildShrineTheme(),
                                              child:
                                                  Builder(builder: (context) {
                                                return TextButton(
                                                    child: Container(
                                                        decoration: AppTheme
                                                            .primaryColoredRoundedButtonDecoration2(),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15,
                                                                vertical: 10),
                                                        child: LocalizedText(
                                                          'select_date',
                                                          style: AppTheme
                                                              .buttonLabelStyle2
                                                              .copyWith(
                                                                  color: AppTheme
                                                                      .primaryColor),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                    onPressed: () {
                                                      if (_authController
                                                          .isEthio) {
                                                        showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                useSafeArea: false,
                                                                context: context,
                                                                builder: (context) {
                                                                  return AlertDialog(
                                                                      contentPadding:
                                                                          const EdgeInsets.all(
                                                                              0),
                                                                      scrollable:
                                                                          true,
                                                                      content: SizedBox(
                                                                          height: 0.85 *
                                                                              height,
                                                                          width: 0.85 *
                                                                              width,
                                                                          child:
                                                                              SelectableEthioCalendar()));
                                                                })
                                                            .then((_) => startDate =
                                                                DateTime.fromMillisecondsSinceEpoch(
                                                                    _homeController
                                                                        .selectedPeriodDate
                                                                        .moment));
                                                      } else {
                                                        Get.to(showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    startDate,
                                                                firstDate: DateTime
                                                                        .now()
                                                                    .subtract(
                                                                        Duration(
                                                                            days:
                                                                                40)),
                                                                lastDate:
                                                                    DateTime
                                                                        .now())
                                                            .then((value) {
                                                          if (value != null) {
                                                            setState(() {
                                                              startDate = value;
                                                            });
                                                          }
                                                        }));
                                                      }
                                                      ;
                                                    });
                                              }),
                                            )
                                          ],
                                        ),
                                      ),
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
                                              style: AppTheme
                                                  .normalPrimaryTextStyle,
                                            ),
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                print("original startDate: ");
                                                print(widget.data.startDate);
                                                print("The new StartDate: ");
                                                print(startDate);
                                                print("original endDate: ");
                                                print(widget.data.endDate);
                                                print("The new endDate: ");
                                                print(startDate.add(Duration(
                                                    days: int.parse(
                                                        _periodLength.text))));
                                                HomeController homeController = Get.find();
                      homeController.setCurrentPeriodDate(UserLogData(
                                                    startDate: startDate,
                                                    endDate: startDate.add(
                                                        Duration(
                                                            days: int.parse(
                                                                _periodLength
                                                                    .text))),
                                                    daysToStart: int.parse(
                                                        _periodComing.text),
                                                    daysToEnd: int.parse(
                                                        _periodLength.text)));
                                                Get.back();
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
              ],
            ),
          ]),
        ),
      ),
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

  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: _shrineColorScheme,
      toggleableActiveColor: AppTheme.primaryColor,
      accentColor: AppTheme.primaryColor,
      primaryColor: Color.fromARGB(255, 63, 45, 32),
      buttonColor: AppTheme.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      // textSelectionTheme: AppTheme.primaryColor,
      errorColor: Colors.red,
      buttonTheme: ButtonThemeData(
        colorScheme: _shrineColorScheme,
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: _customIconTheme(base.iconTheme),
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      iconTheme: _customIconTheme(base.iconTheme),
    );
  }

  IconThemeData _customIconTheme(IconThemeData original) {
    return original.copyWith(color: AppTheme.primaryColor);
  }

  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          caption: base.caption!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          button: base.button!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
          displayColor: AppTheme.primaryColor,
          bodyColor: AppTheme.primaryColor,
        );
  }

  ColorScheme _shrineColorScheme = ColorScheme(
    primary: AppTheme.primaryColor,
    primaryVariant: AppTheme.primaryColor,
    secondary: AppTheme.primaryColor,
    secondaryVariant: AppTheme.primaryColor,
    surface: AppTheme.primaryColor,
    background: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.white,
    onError: Colors.red,
    brightness: Brightness.light,
  );
}
