import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/daily_insight_card.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyInsights extends StatelessWidget {
  const DailyInsights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LocalizedText("my_daily_insights", style: AppTheme.boldTitle),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // DailyInsightCard(
              //   title: "log_your_symptoms",
              //   bottom: const Icon(
              //     Icons.add_circle,
              //     color: AppTheme.subtleGreen,
              //     size: 30,
              //   ),
              //   onPressed: () {
              //     Get.toNamed(Routes.dailyDetailPage);
              //   },
              // ),
              const DailyInsightCard(
                title: "todays_cycle_day",
                bottom: Text(
                  "26",
                  style: AppTheme.titleStyle2,
                ),
                color: AppTheme.subtleGreen,
              ),
              DailyInsightCard(
                title: "chance_of_getting_pregnant",
                bottom: const LocalizedText(
                  "low",
                  style: AppTheme.titleStyle2,
                ),
                color: AppTheme.subtleBlue,
                onPressed: () {
                  Get.toNamed(Routes.logChancePregnancyPage);
                },
              ),
              // DailyInsightCard(
              //   title: "todays_symptoms",
              //   bottom: const Text(
              //     "0",
              //     style: AppTheme.titleStyle2,
              //   ),
              //   color: AppTheme.subtlePink,
              //   onPressed: () {
              //     Get.toNamed(Routes.symptomsPage);
              //   },
              // ),
            ],
          ),
        )
      ],
    );
  }
}
