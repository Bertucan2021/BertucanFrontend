import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/components/daily_insights.dart';
import 'package:bertucanfrontend/ui/components/phase_container.dart';
import 'package:bertucanfrontend/ui/components/selectable_dates.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:bertucanfrontend/ui/widgets/daily_insight_card.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/stat_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
                Obx(() => Text(
                    DateFormat.yMMMd().format(_homeController.selectedDate),
                    style: AppTheme.titleStyle3)),
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
            DailyInsights(),
            const SizedBox(height: 30),
            LocalizedText(
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
