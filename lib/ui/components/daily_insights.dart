import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/daily_insight_card.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';

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
              DailyInsightCard(
                title: "log_your_symptoms",
                bottom: IconButton(
                  icon: const Icon(
                    Icons.add_circle,
                    color: AppTheme.subtleGreen,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
              const DailyInsightCard(
                title: "todays_cycle_day",
                bottom: Text(
                  "26",
                  style: AppTheme.titleStyle2,
                ),
                color: AppTheme.subtleGreen,
              ),
              const DailyInsightCard(
                title: "chance_of_getting_pregnant",
                bottom: LocalizedText(
                  "low",
                  style: AppTheme.titleStyle2,
                ),
                color: AppTheme.subtleBlue,
              ),
              const DailyInsightCard(
                title: "todays_symptoms",
                bottom: Text(
                  "0",
                  style: AppTheme.titleStyle2,
                ),
                color: AppTheme.subtlePink,
              ),
            ],
          ),
        )
      ],
    );
  }
}
