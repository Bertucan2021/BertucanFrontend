import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
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
  final TextEditingController _periodLength = TextEditingController();
  final TextEditingController _periodComing = TextEditingController();

  DateTime startDate = DateTime.now();
  DateTime lastDate = DateTime.now();
  bool isPeriodGoing = true;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Form(
        key: _formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            LocalizedText(
              'log_you_cycle',
              style: AppTheme.titleStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomTextField(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomTextField(
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LocalizedText(
                    'are_you_on_your_period',
                    style: AppTheme.normalTextStyle,
                  ),
                  TextButton(
                      child: Container(
                          decoration: AppTheme.textFieldDecoration(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: LocalizedText(
                            'no',
                            style: AppTheme.buttonLabelStyle2
                                .copyWith(color: AppTheme.primaryColor),
                            textAlign: TextAlign.center,
                          )),
                      onPressed: () {
                        setState(() {
                          isPeriodGoing = false;
                        });
                      }),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      child: Container(
                          decoration: AppTheme.textFieldDecoration(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: LocalizedText(
                            'yes',
                            style: AppTheme.buttonLabelStyle2
                                .copyWith(color: AppTheme.primaryColor),
                            textAlign: TextAlign.center,
                          )),
                      onPressed: () {
                        setState(() {
                          isPeriodGoing = true;
                        });
                      }),
                ],
              ),
            ),
            isPeriodGoing
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      LocalizedText('when_did_your_period_start',
                          style: AppTheme.normalTextStyle),
                      SizedBox(
                        height: 10,
                      ),
                      Theme(
                        data: _buildShrineTheme(),
                        child: Builder(builder: (context) {
                          return TextButton(
                              child: Container(
                                  decoration: AppTheme
                                      .primaryColoredRoundedButtonDecoration(),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: LocalizedText(
                                    'select_date',
                                    style: AppTheme.buttonLabelStyle2
                                        .copyWith(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  )),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: startDate,
                                        firstDate: DateTime.now()
                                            .subtract(Duration(days: 30)),
                                        lastDate: DateTime.now())
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      startDate = value;
                                      lastDate = value.add(Duration(days: 7));
                                    });
                                  }
                                });
                              });
                        }),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: LocalizedText(
                          'select_the_start_and_end of_your_last_period',
                          style: AppTheme.normalTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Theme(
                        data: _buildShrineTheme(),
                        child: Builder(builder: (context) {
                          return TextButton(
                              child: Container(
                                  decoration: AppTheme
                                      .primaryColoredRoundedButtonDecoration(),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: LocalizedText(
                                    'select_date',
                                    style: AppTheme.buttonLabelStyle2
                                        .copyWith(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  )),
                              onPressed: () {
                                showDateRangePicker(
                                        context: context,
                                        firstDate: DateTime.now()
                                            .subtract(Duration(days: 7)),
                                        lastDate: DateTime.now()
                                            .subtract(Duration(days: 1)))
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      startDate = value.start;
                                      lastDate = value.end;
                                    });
                                  }
                                });
                              });
                        }),
                      )
                    ],
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: TextButton(
                  child: Container(
                      decoration: AppTheme.textFieldDecoration(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: LocalizedText(
                        'done',
                        style: AppTheme.buttonLabelStyle2
                            .copyWith(color: AppTheme.primaryColor),
                        textAlign: TextAlign.center,
                      )),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      HomeController homeController = Get.find();
                      homeController.setCurrentPeriodDate(UserLogData(
                          startDate: startDate,
                          endDate: lastDate,
                          daysToEnd: int.parse(_periodLength.text),
                          daysToStart: int.parse(_periodComing.text)));
                      Get.offAndToNamed(Routes.homePage);
                    }
                  }),
            )
          ],
        ),
      ),
    ));
  }

  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: _shrineColorScheme,
      toggleableActiveColor: AppTheme.primaryColor,
      accentColor: AppTheme.primaryColor,
      primaryColor: AppTheme.primaryColor,
      buttonColor: AppTheme.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      textSelectionColor: AppTheme.primaryColor,
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
