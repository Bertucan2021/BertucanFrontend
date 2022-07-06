import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/components/daily_insights.dart';
import 'package:bertucanfrontend/ui/components/phase_container.dart';
import 'package:bertucanfrontend/ui/components/selectable_dates.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/stat_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                      DateFormat.yMMMd().format(_homeController.selectedDate),
                      style: AppTheme.titleStyle3),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () async {
                        DateTimeRange? newDateRange = await showDateRangePicker(
                            context: context,
                            confirmText: "confirm",
                            firstDate:
                                DateTime.now().subtract(Duration(days: 365)),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                            builder: (context, child) {
                              return Container(child: child);
                            });
                      },
                      // Get.toNamed(Routes.LogPage);
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        size: 25,
                      )),
                ),
                IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.notificationPage);
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.amber,
                      size: 40,
                    ))
              ],
            ),
            Obx(
              () => SelectableDates(
                selectedDate: _homeController.selectedDate,
                setSelectedDate: _homeController.setSelectedDate,
                selectableDates: _homeController.selectableDates,
              ),
            ),
            const SizedBox(height: 20),
            PhaseContainer(date: _homeController.selectedDate),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  StatContainer(
                      label: "weight",
                      stat: "65",
                      unit: "kg",
                      color: AppTheme.orange),
                  StatContainer(
                      label: "period_in",
                      stat: "5",
                      unit: "days",
                      color: AppTheme.green),
                  StatContainer(
                      label: "water",
                      stat: "3",
                      unit: "litters",
                      color: AppTheme.blue)
                ],
              ),
            ),
            const SizedBox(height: 30),
            const DailyInsights(),
            const SizedBox(height: 30),
            const LocalizedText(
              "my_cycles",
              style: AppTheme.boldTitle,
            ),
            const SizedBox(height: 15),
            Container(
              decoration: AppTheme.textFieldDecoration(),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [myCycleRow(), myCycleRow()],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: AppTheme.whiteBoxDecoration(),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocalizedText(
                        "cycles_history",
                        style:
                            AppTheme.titleStyle4.copyWith(color: Colors.black),
                      ),
                      Row(
                        children: [
                          LocalizedText(
                            "see_all",
                            style: AppTheme.titleStyle4
                                .copyWith(color: AppTheme.textGrey),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: AppTheme.textGrey,
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 0.2,
                    color: AppTheme.hintGrey,
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LocalizedText(
                            "current_cycle : 27 days",
                            style: AppTheme.titleStyle4
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          LocalizedText(
                            "Started Dec 27,2021",
                            style: AppTheme.articleTextStyle
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: AppTheme.textGrey,
                      )
                    ],
                  ),
                  Container(
                    height: 0.2,
                    color: AppTheme.hintGrey,
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "37 days",
                            style: AppTheme.titleStyle4
                                .copyWith(color: Colors.black),
                          ),
                          Text(
                            "Nov 23 - Dec 29",
                            style: AppTheme.articleTextStyle
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 0.2,
                    color: AppTheme.hintGrey,
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_circle,
                          color: AppTheme.primaryColor,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        LocalizedText(
                          "log_previous_cycles",
                          style: AppTheme.titleStyle4
                              .copyWith(color: AppTheme.primaryColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
  }

  myCycleRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocalizedText("previous_cycle_length",
                  style: AppTheme.greySubtitleStyle),
              Row(
                children: [
                  Text("37", style: AppTheme.titleStyle2),
                  LocalizedText("days", style: AppTheme.titleStyle2)
                ],
              ),
            ],
          ),
          LocalizedText(
            "abnormal",
            style:
                AppTheme.greySubtitleStyle.copyWith(color: AppTheme.textBlack),
          ),
        ],
      ),
    );
  }
}
